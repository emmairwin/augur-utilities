ALTER TABLE "augur_data"."issue_assignees" 
  DROP CONSTRAINT "fk_issue_assignees_issues_1",
  DROP CONSTRAINT "issue_assignees_cntrb_id_fkey",
  ADD CONSTRAINT "fk_issue_assignees_issues_1" FOREIGN KEY ("issue_id") REFERENCES "augur_data"."issues" ("issue_id") ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT "issue_assignees_cntrb_id_fkey" FOREIGN KEY ("cntrb_id") REFERENCES "augur_data"."contributors" ("cntrb_id") ON DELETE RESTRICT ON UPDATE CASCADE  DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "augur_data"."pull_request_review_message_ref" 
DROP CONSTRAINT "fk_pull_request_review_message_ref_message_1",
ADD CONSTRAINT "fk_pull_request_review_message_ref_message_1" FOREIGN KEY ("msg_id") REFERENCES "augur_data"."message" ("msg_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "augur_data"."pull_request_message_ref" 
DROP CONSTRAINT "fk_pull_request_message_ref_message_1",
ADD CONSTRAINT "fk_pull_request_message_ref_message_1" FOREIGN KEY ("msg_id") REFERENCES "augur_data"."message" ("msg_id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;

