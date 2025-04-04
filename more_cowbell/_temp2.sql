
-- Duplicate pair: repo_src_id = 464935169
BEGIN;
-- Executing statement for table: augur_data.issue_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_message_ref SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_message_ref WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_message_ref for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_message_ref for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_review_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_review_message_ref SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_review_message_ref WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_review_message_ref for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_review_message_ref for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_message_ref SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_message_ref WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_message_ref for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_message_ref for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_info
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_info SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_info WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_info for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_info for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_events SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_events WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_events for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_events for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_labels SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_labels WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_labels for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_labels for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_labels SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_labels WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_labels for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_labels for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_events SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_events WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_events for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_events for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_meta
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_meta SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_meta WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_meta for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_meta for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviewers
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviewers SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviewers WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviewers for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviewers for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_assignees SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_assignees WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_assignees for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_assignees for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_assignees SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_assignees WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_assignees for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_assignees for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.releases
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.releases SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.releases WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.releases for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.releases for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviews
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviews SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviews WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviews for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviews for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_files
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_files SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_files WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_files for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_files for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_commits SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_commits WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_commits for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_commits for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_requests
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_requests SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_requests WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_requests for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_requests for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_badging
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_badging SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_badging WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_badging for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_badging for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.issues
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issues SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issues WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issues for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issues for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_libyear
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_libyear SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_libyear WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_libyear for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_libyear for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_scorecard
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_scorecard SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_scorecard WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_scorecard for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_scorecard for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_dependencies
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_dependencies SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_dependencies WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_dependencies for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_dependencies for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.commits SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commits WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commits for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commits for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_labor
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_labor SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_labor WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_labor for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_labor for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.message
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.message SET repo_id = 260768 WHERE repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.message WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.message for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.message for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_operations.user_repos
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.user_repos where repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.user_repos WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.user_repos for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.user_repos for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_operations.collection_status
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.collection_status where repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.collection_status WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.collection_status for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.collection_status for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.commit_messages
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.commit_messages where repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commit_messages WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commit_messages for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commit_messages for repo_id 257479: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.repo where repo_id = 257479;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo WHERE repo_id = 257479;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo for repo_id 257479 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo for repo_id 257479: %', original_error;
END $$;
COMMIT;


-- Duplicate pair: repo_src_id = 188779637
BEGIN;
-- Executing statement for table: augur_data.issue_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_message_ref SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_message_ref WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_message_ref for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_message_ref for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_review_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_review_message_ref SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_review_message_ref WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_review_message_ref for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_review_message_ref for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_message_ref SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_message_ref WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_message_ref for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_message_ref for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_info
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_info SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_info WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_info for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_info for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_events SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_events WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_events for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_events for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_labels SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_labels WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_labels for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_labels for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_labels SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_labels WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_labels for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_labels for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_events SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_events WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_events for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_events for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_meta
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_meta SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_meta WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_meta for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_meta for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviewers
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviewers SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviewers WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviewers for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviewers for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_assignees SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_assignees WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_assignees for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_assignees for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_assignees SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_assignees WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_assignees for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_assignees for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.releases
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.releases SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.releases WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.releases for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.releases for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviews
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviews SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviews WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviews for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviews for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_files
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_files SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_files WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_files for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_files for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_commits SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_commits WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_commits for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_commits for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_requests
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_requests SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_requests WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_requests for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_requests for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_badging
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_badging SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_badging WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_badging for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_badging for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.issues
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issues SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issues WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issues for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issues for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_libyear
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_libyear SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_libyear WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_libyear for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_libyear for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_scorecard
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_scorecard SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_scorecard WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_scorecard for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_scorecard for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_dependencies
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_dependencies SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_dependencies WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_dependencies for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_dependencies for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.commits SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commits WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commits for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commits for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_labor
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_labor SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_labor WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_labor for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_labor for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.message
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.message SET repo_id = 38882 WHERE repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.message WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.message for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.message for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_operations.user_repos
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.user_repos where repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.user_repos WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.user_repos for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.user_repos for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_operations.collection_status
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.collection_status where repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.collection_status WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.collection_status for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.collection_status for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.commit_messages
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.commit_messages where repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commit_messages WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commit_messages for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commit_messages for repo_id 36598: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.repo where repo_id = 36598;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo WHERE repo_id = 36598;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo for repo_id 36598 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo for repo_id 36598: %', original_error;
END $$;
COMMIT;


-- Duplicate pair: repo_src_id = 624494421
BEGIN;
-- Executing statement for table: augur_data.issue_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_message_ref SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_message_ref WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_message_ref for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_message_ref for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_review_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_review_message_ref SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_review_message_ref WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_review_message_ref for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_review_message_ref for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_message_ref SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_message_ref WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_message_ref for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_message_ref for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_info
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_info SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_info WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_info for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_info for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_events SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_events WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_events for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_events for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_labels SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_labels WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_labels for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_labels for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_labels SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_labels WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_labels for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_labels for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_events SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_events WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_events for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_events for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_meta
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_meta SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_meta WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_meta for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_meta for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviewers
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviewers SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviewers WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviewers for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviewers for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_assignees SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_assignees WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_assignees for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_assignees for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_assignees SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_assignees WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_assignees for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_assignees for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.releases
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.releases SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.releases WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.releases for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.releases for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviews
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviews SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviews WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviews for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviews for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_files
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_files SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_files WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_files for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_files for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_commits SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_commits WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_commits for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_commits for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_requests
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_requests SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_requests WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_requests for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_requests for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_badging
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_badging SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_badging WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_badging for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_badging for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.issues
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issues SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issues WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issues for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issues for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_libyear
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_libyear SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_libyear WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_libyear for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_libyear for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_scorecard
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_scorecard SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_scorecard WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_scorecard for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_scorecard for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_dependencies
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_dependencies SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_dependencies WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_dependencies for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_dependencies for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.commits SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commits WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commits for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commits for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_labor
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_labor SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_labor WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_labor for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_labor for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.message
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.message SET repo_id = 128320 WHERE repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.message WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.message for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.message for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_operations.user_repos
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.user_repos where repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.user_repos WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.user_repos for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.user_repos for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_operations.collection_status
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.collection_status where repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.collection_status WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.collection_status for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.collection_status for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.commit_messages
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.commit_messages where repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commit_messages WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commit_messages for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commit_messages for repo_id 149077: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.repo where repo_id = 149077;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo WHERE repo_id = 149077;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo for repo_id 149077 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo for repo_id 149077: %', original_error;
END $$;
COMMIT;


-- Duplicate pair: repo_src_id = 471728341
BEGIN;
-- Executing statement for table: augur_data.issue_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_message_ref SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_message_ref WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_message_ref for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_message_ref for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_review_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_review_message_ref SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_review_message_ref WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_review_message_ref for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_review_message_ref for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_message_ref SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_message_ref WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_message_ref for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_message_ref for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_info
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_info SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_info WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_info for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_info for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_events SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_events WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_events for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_events for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_labels SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_labels WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_labels for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_labels for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_labels SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_labels WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_labels for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_labels for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_events SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_events WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_events for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_events for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_meta
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_meta SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_meta WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_meta for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_meta for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviewers
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviewers SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviewers WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviewers for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviewers for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_assignees SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_assignees WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_assignees for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_assignees for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_assignees SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_assignees WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_assignees for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_assignees for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.releases
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.releases SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.releases WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.releases for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.releases for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviews
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviews SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviews WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviews for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviews for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_files
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_files SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_files WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_files for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_files for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_commits SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_commits WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_commits for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_commits for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_requests
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_requests SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_requests WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_requests for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_requests for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_badging
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_badging SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_badging WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_badging for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_badging for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.issues
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issues SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issues WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issues for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issues for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_libyear
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_libyear SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_libyear WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_libyear for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_libyear for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_scorecard
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_scorecard SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_scorecard WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_scorecard for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_scorecard for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_dependencies
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_dependencies SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_dependencies WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_dependencies for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_dependencies for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.commits SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commits WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commits for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commits for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_labor
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_labor SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_labor WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_labor for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_labor for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.message
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.message SET repo_id = 267619 WHERE repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.message WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.message for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.message for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_operations.user_repos
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.user_repos where repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.user_repos WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.user_repos for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.user_repos for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_operations.collection_status
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.collection_status where repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.collection_status WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.collection_status for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.collection_status for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.commit_messages
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.commit_messages where repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commit_messages WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commit_messages for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commit_messages for repo_id 36237: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.repo where repo_id = 36237;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo WHERE repo_id = 36237;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo for repo_id 36237 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo for repo_id 36237: %', original_error;
END $$;
COMMIT;


-- Duplicate pair: repo_src_id = 624378379
BEGIN;
-- Executing statement for table: augur_data.issue_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_message_ref SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_message_ref WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_message_ref for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_message_ref for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_review_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_review_message_ref SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_review_message_ref WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_review_message_ref for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_review_message_ref for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_message_ref
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_message_ref SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_message_ref WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_message_ref for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_message_ref for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_info
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_info SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_info WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_info for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_info for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_events SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_events WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_events for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_events for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_labels SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_labels WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_labels for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_labels for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_labels
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_labels SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_labels WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_labels for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_labels for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_events
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_events SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_events WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_events for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_events for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_meta
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_meta SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_meta WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_meta for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_meta for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviewers
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviewers SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviewers WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviewers for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviewers for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_assignees SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_assignees WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_assignees for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_assignees for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.issue_assignees
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issue_assignees SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issue_assignees WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issue_assignees for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issue_assignees for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.releases
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.releases SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.releases WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.releases for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.releases for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_reviews
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_reviews SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_reviews WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_reviews for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_reviews for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_files
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_files SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_files WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_files for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_files for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_request_commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_request_commits SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_request_commits WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_request_commits for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_request_commits for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.pull_requests
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.pull_requests SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.pull_requests WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.pull_requests for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.pull_requests for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_badging
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_badging SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_badging WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_badging for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_badging for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.issues
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.issues SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.issues WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.issues for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.issues for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_libyear
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_libyear SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_libyear WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_libyear for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_libyear for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_deps_scorecard
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_deps_scorecard SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_deps_scorecard WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_deps_scorecard for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_deps_scorecard for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_dependencies
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_dependencies SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_dependencies WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_dependencies for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_dependencies for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.commits
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.commits SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commits WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commits for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commits for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo_labor
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.repo_labor SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo_labor WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo_labor for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo_labor for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.message
DO $$
DECLARE
  original_error TEXT;
BEGIN
    UPDATE augur_data.message SET repo_id = 57910 WHERE repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.message WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.message for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.message for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_operations.user_repos
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.user_repos where repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.user_repos WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.user_repos for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.user_repos for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_operations.collection_status
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_operations.collection_status where repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_operations.collection_status WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_operations.collection_status for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_operations.collection_status for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.commit_messages
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.commit_messages where repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.commit_messages WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.commit_messages for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.commit_messages for repo_id 165630: %', original_error;
END $$;
-- Executing statement for table: augur_data.repo
DO $$
DECLARE
  original_error TEXT;
BEGIN
    delete from augur_data.repo where repo_id = 165630;
EXCEPTION WHEN unique_violation OR foreign_key_violation THEN
    original_error := SQLERRM;
    BEGIN
         DELETE FROM augur_data.repo WHERE repo_id = 165630;
    EXCEPTION WHEN OTHERS THEN
         RAISE NOTICE 'Fallback delete from augur_data.repo for repo_id 165630 failed: %', SQLERRM;
    END;
    RAISE NOTICE 'Handled error in augur_data.repo for repo_id 165630: %', original_error;
END $$;
COMMIT;

