

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
                WHERE repo_id = 191192
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191192; Total deleted so far: %', 
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
                WHERE repo_id = 191198
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191198; Total deleted so far: %', 
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
                WHERE repo_id = 191211
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191211; Total deleted so far: %', 
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
                WHERE repo_id = 191232
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191232; Total deleted so far: %', 
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
                WHERE repo_id = 191234
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191234; Total deleted so far: %', 
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
                WHERE repo_id = 191261
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191261; Total deleted so far: %', 
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
                WHERE repo_id = 191267
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191267; Total deleted so far: %', 
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
                WHERE repo_id = 191273
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191273; Total deleted so far: %', 
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
                WHERE repo_id = 191285
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191285; Total deleted so far: %', 
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
                WHERE repo_id = 191506
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191506; Total deleted so far: %', 
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
                WHERE repo_id = 191510
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191510; Total deleted so far: %', 
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
                WHERE repo_id = 191517
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 191517; Total deleted so far: %', 
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
                WHERE repo_id = 195334
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 195334; Total deleted so far: %', 
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
                WHERE repo_id = 195519
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 195519; Total deleted so far: %', 
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
                WHERE repo_id = 195981
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 195981; Total deleted so far: %', 
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
                WHERE repo_id = 196032
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196032; Total deleted so far: %', 
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
                WHERE repo_id = 196042
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196042; Total deleted so far: %', 
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
                WHERE repo_id = 196046
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196046; Total deleted so far: %', 
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
                WHERE repo_id = 196078
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196078; Total deleted so far: %', 
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
                WHERE repo_id = 196085
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196085; Total deleted so far: %', 
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
                WHERE repo_id = 196149
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196149; Total deleted so far: %', 
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
                WHERE repo_id = 196169
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196169; Total deleted so far: %', 
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
                WHERE repo_id = 196170
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196170; Total deleted so far: %', 
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
                WHERE repo_id = 196171
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196171; Total deleted so far: %', 
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
                WHERE repo_id = 196172
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196172; Total deleted so far: %', 
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
                WHERE repo_id = 196175
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196175; Total deleted so far: %', 
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
                WHERE repo_id = 196176
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196176; Total deleted so far: %', 
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
                WHERE repo_id = 196177
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 196177; Total deleted so far: %', 
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
                WHERE repo_id = 201974
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 201974; Total deleted so far: %', 
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
                WHERE repo_id = 201976
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 201976; Total deleted so far: %', 
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
                WHERE repo_id = 202148
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 202148; Total deleted so far: %', 
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
                WHERE repo_id = 202231
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 202231; Total deleted so far: %', 
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
                WHERE repo_id = 202303
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 202303; Total deleted so far: %', 
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
                WHERE repo_id = 202824
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 202824; Total deleted so far: %', 
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
                WHERE repo_id = 202828
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 202828; Total deleted so far: %', 
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
                WHERE repo_id = 203684
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 203684; Total deleted so far: %', 
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
                WHERE repo_id = 203692
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 203692; Total deleted so far: %', 
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
                WHERE repo_id = 203878
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 203878; Total deleted so far: %', 
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
                WHERE repo_id = 203893
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 203893; Total deleted so far: %', 
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
                WHERE repo_id = 203988
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 203988; Total deleted so far: %', 
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
                WHERE repo_id = 204113
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 204113; Total deleted so far: %', 
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
                WHERE repo_id = 204643
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 204643; Total deleted so far: %', 
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
                WHERE repo_id = 204759
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 204759; Total deleted so far: %', 
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
                WHERE repo_id = 204764
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 204764; Total deleted so far: %', 
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
                WHERE repo_id = 205069
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 205069; Total deleted so far: %', 
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
                WHERE repo_id = 205073
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 205073; Total deleted so far: %', 
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
                WHERE repo_id = 205078
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 205078; Total deleted so far: %', 
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
                WHERE repo_id = 209162
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209162; Total deleted so far: %', 
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
                WHERE repo_id = 209168
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209168; Total deleted so far: %', 
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
                WHERE repo_id = 209169
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209169; Total deleted so far: %', 
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
                WHERE repo_id = 209172
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209172; Total deleted so far: %', 
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
                WHERE repo_id = 209173
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209173; Total deleted so far: %', 
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
                WHERE repo_id = 209175
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209175; Total deleted so far: %', 
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
                WHERE repo_id = 209179
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209179; Total deleted so far: %', 
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
                WHERE repo_id = 209180
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209180; Total deleted so far: %', 
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
                WHERE repo_id = 209181
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209181; Total deleted so far: %', 
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
                WHERE repo_id = 209182
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209182; Total deleted so far: %', 
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
                WHERE repo_id = 209183
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 209183; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            