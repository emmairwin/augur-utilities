

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 151401
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 151401; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 157020
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 157020; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 162160
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 162160; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 162996
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 162996; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 163211
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 163211; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 163218
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 163218; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 163331
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 163331; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 165423
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 165423; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 165440
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 165440; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 166067
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 166067; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 189828
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 189828; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 189850
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 189850; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 190320
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 190320; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 190485
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 190485; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191131
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191131; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191138
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191138; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191139
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191139; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191147
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191147; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191156
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191156; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191158
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191158; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191164
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191164; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191165
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191165; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191167
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191167; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191168
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191168; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191176
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191176; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191177
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191177; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191180
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191180; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            

            DO $$
            DECLARE
            rows_deleted INTEGER;
            total_deleted INTEGER := 0;
            BEGIN
            LOOP
                DELETE FROM pull_request_reviews
                WHERE ctid IN (
                SELECT ctid
                FROM pull_request_reviews
                WHERE repo_id = 191185
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191185; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            