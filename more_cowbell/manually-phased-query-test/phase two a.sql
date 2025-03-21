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
                WHERE repo_id = 25430
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 25430; Total deleted so far: %', 
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
                WHERE repo_id = 36022
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 36022; Total deleted so far: %', 
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
                WHERE repo_id = 36032
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 36032; Total deleted so far: %', 
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
                WHERE repo_id = 36528
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 36528; Total deleted so far: %', 
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
                WHERE repo_id = 36540
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 36540; Total deleted so far: %', 
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
                WHERE repo_id = 36649
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 36649; Total deleted so far: %', 
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
                WHERE repo_id = 36775
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 36775; Total deleted so far: %', 
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
                WHERE repo_id = 39149
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 39149; Total deleted so far: %', 
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
                WHERE repo_id = 39266
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 39266; Total deleted so far: %', 
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
                WHERE repo_id = 39474
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 39474; Total deleted so far: %', 
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
                WHERE repo_id = 39485
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 39485; Total deleted so far: %', 
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
                WHERE repo_id = 40747
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 40747; Total deleted so far: %', 
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
                WHERE repo_id = 40752
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 40752; Total deleted so far: %', 
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
                WHERE repo_id = 40880
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 40880; Total deleted so far: %', 
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
                WHERE repo_id = 47542
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 47542; Total deleted so far: %', 
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
                WHERE repo_id = 48477
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 48477; Total deleted so far: %', 
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
                WHERE repo_id = 49981
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 49981; Total deleted so far: %', 
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
                WHERE repo_id = 50998
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 50998; Total deleted so far: %', 
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
                WHERE repo_id = 51297
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 51297; Total deleted so far: %', 
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
                WHERE repo_id = 51367
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 51367; Total deleted so far: %', 
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
                WHERE repo_id = 52630
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 52630; Total deleted so far: %', 
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
                WHERE repo_id = 52632
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 52632; Total deleted so far: %', 
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
                WHERE repo_id = 52691
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 52691; Total deleted so far: %', 
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
                WHERE repo_id = 52825
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 52825; Total deleted so far: %', 
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
                WHERE repo_id = 53180
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 53180; Total deleted so far: %', 
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
                WHERE repo_id = 53189
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 53189; Total deleted so far: %', 
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
                WHERE repo_id = 53204
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 53204; Total deleted so far: %', 
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
                WHERE repo_id = 53216
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 53216; Total deleted so far: %', 
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
                WHERE repo_id = 53553
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 53553; Total deleted so far: %', 
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
                WHERE repo_id = 54041
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 54041; Total deleted so far: %', 
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
                WHERE repo_id = 57754
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 57754; Total deleted so far: %', 
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
                WHERE repo_id = 57782
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 57782; Total deleted so far: %', 
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
                WHERE repo_id = 126415
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 126415; Total deleted so far: %', 
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
                WHERE repo_id = 128659
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 128659; Total deleted so far: %', 
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
                WHERE repo_id = 131491
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 131491; Total deleted so far: %', 
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
                WHERE repo_id = 131560
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 131560; Total deleted so far: %', 
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
                WHERE repo_id = 132142
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 132142; Total deleted so far: %', 
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
                WHERE repo_id = 138636
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138636; Total deleted so far: %', 
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
                WHERE repo_id = 138639
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138639; Total deleted so far: %', 
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
                WHERE repo_id = 138641
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138641; Total deleted so far: %', 
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
                WHERE repo_id = 138663
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138663; Total deleted so far: %', 
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
                WHERE repo_id = 138670
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138670; Total deleted so far: %', 
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
                WHERE repo_id = 138678
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138678; Total deleted so far: %', 
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
                WHERE repo_id = 138684
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138684; Total deleted so far: %', 
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
                WHERE repo_id = 138685
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138685; Total deleted so far: %', 
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
                WHERE repo_id = 138687
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138687; Total deleted so far: %', 
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
                WHERE repo_id = 138692
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138692; Total deleted so far: %', 
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
                WHERE repo_id = 138694
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138694; Total deleted so far: %', 
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
                WHERE repo_id = 138704
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138704; Total deleted so far: %', 
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
                WHERE repo_id = 138707
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138707; Total deleted so far: %', 
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
                WHERE repo_id = 138708
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138708; Total deleted so far: %', 
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
                WHERE repo_id = 138710
                LIMIT 100
                );
                GET DIAGNOSTICS rows_deleted = ROW_COUNT;
                total_deleted := total_deleted + rows_deleted;
                
                RAISE NOTICE 'At %: Deleted % rows in this batch for repo 138710; Total deleted so far: %', 
                 clock_timestamp(), rows_deleted, total_deleted;
                
                COMMIT; 
                
                EXIT WHEN rows_deleted = 0;
            END LOOP;
            END
            $$;
            