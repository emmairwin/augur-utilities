

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
                WHERE repo_id = 251803
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 251803; Total deleted so far: %', 
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
                WHERE repo_id = 253014
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 253014; Total deleted so far: %', 
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
                WHERE repo_id = 254070
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 254070; Total deleted so far: %', 
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
                WHERE repo_id = 254071
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 254071; Total deleted so far: %', 
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
                WHERE repo_id = 254072
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 254072; Total deleted so far: %', 
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
                WHERE repo_id = 256625
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 256625; Total deleted so far: %', 
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
                WHERE repo_id = 273633
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 273633; Total deleted so far: %', 
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
                WHERE repo_id = 273785
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 273785; Total deleted so far: %', 
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
                WHERE repo_id = 284978
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 284978; Total deleted so far: %', 
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
                WHERE repo_id = 285785
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 285785; Total deleted so far: %', 
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
                WHERE repo_id = 286977
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 286977; Total deleted so far: %', 
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
                WHERE repo_id = 286984
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 286984; Total deleted so far: %', 
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
                WHERE repo_id = 288054
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288054; Total deleted so far: %', 
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
                WHERE repo_id = 288090
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288090; Total deleted so far: %', 
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
                WHERE repo_id = 288221
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288221; Total deleted so far: %', 
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
                WHERE repo_id = 288232
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288232; Total deleted so far: %', 
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
                WHERE repo_id = 288320
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288320; Total deleted so far: %', 
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
                WHERE repo_id = 288340
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288340; Total deleted so far: %', 
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
                WHERE repo_id = 288438
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288438; Total deleted so far: %', 
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
                WHERE repo_id = 288503
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288503; Total deleted so far: %', 
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
                WHERE repo_id = 288562
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288562; Total deleted so far: %', 
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
                WHERE repo_id = 288571
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288571; Total deleted so far: %', 
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
                WHERE repo_id = 288575
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288575; Total deleted so far: %', 
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
                WHERE repo_id = 288627
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288627; Total deleted so far: %', 
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
                WHERE repo_id = 288659
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288659; Total deleted so far: %', 
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
                WHERE repo_id = 288678
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288678; Total deleted so far: %', 
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
                WHERE repo_id = 288842
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 288842; Total deleted so far: %', 
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
                WHERE repo_id = 289050
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 289050; Total deleted so far: %', 
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
                WHERE repo_id = 289154
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 289154; Total deleted so far: %', 
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
                WHERE repo_id = 289378
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 289378; Total deleted so far: %', 
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
                WHERE repo_id = 289525
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 289525; Total deleted so far: %', 
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
                WHERE repo_id = 289758
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 289758; Total deleted so far: %', 
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
                WHERE repo_id = 289811
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 289811; Total deleted so far: %', 
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
                WHERE repo_id = 289926
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 289926; Total deleted so far: %', 
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
                WHERE repo_id = 290043
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290043; Total deleted so far: %', 
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
                WHERE repo_id = 290127
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290127; Total deleted so far: %', 
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
                WHERE repo_id = 290182
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290182; Total deleted so far: %', 
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
                WHERE repo_id = 290239
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290239; Total deleted so far: %', 
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
                WHERE repo_id = 290357
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290357; Total deleted so far: %', 
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
                WHERE repo_id = 290360
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290360; Total deleted so far: %', 
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
                WHERE repo_id = 290554
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290554; Total deleted so far: %', 
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
                WHERE repo_id = 290581
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290581; Total deleted so far: %', 
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
                WHERE repo_id = 290690
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290690; Total deleted so far: %', 
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
                WHERE repo_id = 290928
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 290928; Total deleted so far: %', 
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
                WHERE repo_id = 291106
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 291106; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            
