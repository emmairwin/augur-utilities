DO $$
DECLARE
  r RECORD;
  winner_id uuid;
  loser_ids uuid[];
  merged jsonb;
  update_fields jsonb;
  update_sql text;
  fk RECORD;
  dup_count int;
BEGIN
  FOR r IN
    SELECT gh_user_id
    FROM augur_data.contributors
    WHERE gh_user_id IS NOT NULL
    GROUP BY gh_user_id
    HAVING COUNT(*) > 1
  LOOP
    -- Step 1: Identify winner
    SELECT cntrb_id
    INTO winner_id
    FROM augur_data.contributors
    WHERE gh_user_id = r.gh_user_id
    ORDER BY data_collection_date DESC
    LIMIT 1;

    -- Step 2: Gather loser IDs
    SELECT array_agg(cntrb_id)
    INTO loser_ids
    FROM augur_data.contributors
    WHERE gh_user_id = r.gh_user_id
      AND cntrb_id != winner_id;

    -- Log group being processed
    RAISE NOTICE 'Processing gh_user_id=%, winner=%, losers=%', r.gh_user_id, winner_id, loser_ids;

    -- Skip if no losers
    IF loser_ids IS NULL THEN
      CONTINUE;
    END IF;

    -- Step 3: Merge fields from losers
    SELECT jsonb_object_agg(kv.key, kv.value) INTO merged
    FROM augur_data.contributors c,
    LATERAL jsonb_each(to_jsonb(c.*)) AS kv
    WHERE c.gh_user_id = r.gh_user_id
      AND c.cntrb_id != winner_id
      AND kv.value IS NOT NULL;

    -- Identify fields to update in winner
    SELECT jsonb_object_agg(key, value) INTO update_fields
    FROM jsonb_each(merged)
    WHERE key NOT IN ('cntrb_id', 'gh_user_id')
      AND (SELECT (to_jsonb(c) -> key) IS NULL FROM augur_data.contributors c WHERE cntrb_id = winner_id);

    -- Update winner with merged fields
    IF update_fields IS NOT NULL THEN
      SELECT string_agg(format('%I = %L', key, value::text), ', ')
      INTO update_sql
      FROM jsonb_each_text(update_fields);

      RAISE NOTICE 'Updating winner % with fields: %', winner_id, update_fields;
      EXECUTE format('UPDATE augur_data.contributors SET %s WHERE cntrb_id = %L', update_sql, winner_id);
    END IF;

    -- Step 4: Reassign foreign keys in related tables
    FOR fk IN
      SELECT
          tc.table_schema,
          tc.table_name,
          kcu.column_name
      FROM information_schema.table_constraints tc
      JOIN information_schema.key_column_usage kcu
          ON tc.constraint_name = kcu.constraint_name
      JOIN information_schema.constraint_column_usage ccu
          ON tc.constraint_name = ccu.constraint_name
      WHERE tc.constraint_type = 'FOREIGN KEY'
        AND tc.table_schema = 'augur_data'
        AND ccu.table_name = 'contributors'
        AND ccu.column_name = 'cntrb_id'
    LOOP
      RAISE NOTICE 'Reassigning FKs in %.% for losers: %', fk.table_schema, fk.table_name, loser_ids;
      EXECUTE format(
        'UPDATE %I.%I SET %I = %L WHERE %I = ANY($1)',
        fk.table_schema, fk.table_name, fk.column_name,
        winner_id, fk.column_name
      )
      USING loser_ids;
    END LOOP;

    -- Step 5: Delete loser rows
    RAISE NOTICE 'Deleting losers: %', loser_ids;
    DELETE FROM augur_data.contributors
    WHERE cntrb_id = ANY(loser_ids);

    -- Step 6: Log remaining duplicates
    SELECT COUNT(*) INTO dup_count
    FROM (
      SELECT gh_user_id
      FROM augur_data.contributors
      WHERE gh_user_id IS NOT NULL
      GROUP BY gh_user_id
      HAVING COUNT(*) > 1
    ) sub;
    RAISE NOTICE 'Remaining duplicate gh_user_id groups: %', dup_count;
  END LOOP;

  -- Final Summary
  RAISE NOTICE 'Merge process completed.';
END $$;