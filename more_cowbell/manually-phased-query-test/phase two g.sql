

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
                WHERE repo_id = 138711
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138711; Total deleted so far: %', 
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
                WHERE repo_id = 138712
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138712; Total deleted so far: %', 
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
                WHERE repo_id = 138720
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138720; Total deleted so far: %', 
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
                WHERE repo_id = 138724
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138724; Total deleted so far: %', 
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
                WHERE repo_id = 138731
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138731; Total deleted so far: %', 
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
                WHERE repo_id = 138741
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138741; Total deleted so far: %', 
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
                WHERE repo_id = 138744
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138744; Total deleted so far: %', 
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
                WHERE repo_id = 138746
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138746; Total deleted so far: %', 
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
                WHERE repo_id = 138754
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138754; Total deleted so far: %', 
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
                WHERE repo_id = 138768
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138768; Total deleted so far: %', 
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
                WHERE repo_id = 138770
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138770; Total deleted so far: %', 
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
                WHERE repo_id = 138772
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138772; Total deleted so far: %', 
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
                WHERE repo_id = 138779
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138779; Total deleted so far: %', 
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
                WHERE repo_id = 138797
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138797; Total deleted so far: %', 
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
                WHERE repo_id = 138801
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138801; Total deleted so far: %', 
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
                WHERE repo_id = 138807
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138807; Total deleted so far: %', 
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
                WHERE repo_id = 138816
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138816; Total deleted so far: %', 
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
                WHERE repo_id = 138830
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138830; Total deleted so far: %', 
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
                WHERE repo_id = 139026
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139026; Total deleted so far: %', 
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
                WHERE repo_id = 139028
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139028; Total deleted so far: %', 
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
                WHERE repo_id = 139031
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139031; Total deleted so far: %', 
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
                WHERE repo_id = 139038
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139038; Total deleted so far: %', 
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
                WHERE repo_id = 139042
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139042; Total deleted so far: %', 
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
                WHERE repo_id = 139050
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139050; Total deleted so far: %', 
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
                WHERE repo_id = 139261
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139261; Total deleted so far: %', 
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
                WHERE repo_id = 139262
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139262; Total deleted so far: %', 
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
                WHERE repo_id = 139273
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139273; Total deleted so far: %', 
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
                WHERE repo_id = 139278
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139278; Total deleted so far: %', 
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
                WHERE repo_id = 139288
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139288; Total deleted so far: %', 
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
                WHERE repo_id = 139289
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139289; Total deleted so far: %', 
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
                WHERE repo_id = 139311
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139311; Total deleted so far: %', 
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
                WHERE repo_id = 139871
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 139871; Total deleted so far: %', 
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
                WHERE repo_id = 140424
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 140424; Total deleted so far: %', 
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
                WHERE repo_id = 150633
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 150633; Total deleted so far: %', 
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
                WHERE repo_id = 151339
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 151339; Total deleted so far: %', 
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
                WHERE repo_id = 151354
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 151354; Total deleted so far: %', 
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
                WHERE repo_id = 151370
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 151370; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            