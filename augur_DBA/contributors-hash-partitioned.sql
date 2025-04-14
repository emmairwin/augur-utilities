-- 

-- STEP 1: Rename old table
ALTER TABLE augur_data.contributors RENAME TO contributors_old;

-- STEP 2: Create new partitioned table
CREATE TABLE "augur_data"."contributors" (
  "cntrb_login" varchar COLLATE "pg_catalog"."default",
  "cntrb_email" varchar COLLATE "pg_catalog"."default",
  "cntrb_full_name" varchar COLLATE "pg_catalog"."default",
  "cntrb_company" varchar COLLATE "pg_catalog"."default",
  "cntrb_created_at" timestamp(0),
  "cntrb_type" varchar COLLATE "pg_catalog"."default",
  "cntrb_fake" int2 DEFAULT 0,
  "cntrb_deleted" int2 DEFAULT 0,
  "cntrb_long" numeric(11,8) DEFAULT NULL::numeric,
  "cntrb_lat" numeric(10,8) DEFAULT NULL::numeric,
  "cntrb_country_code" char(3) COLLATE "pg_catalog"."default" DEFAULT NULL::bpchar,
  "cntrb_state" varchar COLLATE "pg_catalog"."default",
  "cntrb_city" varchar COLLATE "pg_catalog"."default",
  "cntrb_location" varchar COLLATE "pg_catalog"."default",
  "cntrb_canonical" varchar COLLATE "pg_catalog"."default",
  "cntrb_last_used" timestamptz(0) DEFAULT NULL::timestamp with time zone,
  "gh_user_id" int8,
  "gh_login" varchar COLLATE "pg_catalog"."default",
  "gh_url" varchar COLLATE "pg_catalog"."default",
  "gh_html_url" varchar COLLATE "pg_catalog"."default",
  "gh_node_id" varchar COLLATE "pg_catalog"."default",
  "gh_avatar_url" varchar COLLATE "pg_catalog"."default",
  "gh_gravatar_id" varchar COLLATE "pg_catalog"."default",
  "gh_followers_url" varchar COLLATE "pg_catalog"."default",
  "gh_following_url" varchar COLLATE "pg_catalog"."default",
  "gh_gists_url" varchar COLLATE "pg_catalog"."default",
  "gh_starred_url" varchar COLLATE "pg_catalog"."default",
  "gh_subscriptions_url" varchar COLLATE "pg_catalog"."default",
  "gh_organizations_url" varchar COLLATE "pg_catalog"."default",
  "gh_repos_url" varchar COLLATE "pg_catalog"."default",
  "gh_events_url" varchar COLLATE "pg_catalog"."default",
  "gh_received_events_url" varchar COLLATE "pg_catalog"."default",
  "gh_type" varchar COLLATE "pg_catalog"."default",
  "gh_site_admin" varchar COLLATE "pg_catalog"."default",
  "gl_web_url" varchar COLLATE "pg_catalog"."default",
  "gl_avatar_url" varchar COLLATE "pg_catalog"."default",
  "gl_state" varchar COLLATE "pg_catalog"."default",
  "gl_username" varchar COLLATE "pg_catalog"."default",
  "gl_full_name" varchar COLLATE "pg_catalog"."default",
  "gl_id" int8,
  "tool_source" varchar COLLATE "pg_catalog"."default",
  "tool_version" varchar COLLATE "pg_catalog"."default",
  "data_source" varchar COLLATE "pg_catalog"."default",
  "data_collection_date" timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  "cntrb_id" uuid NOT NULL
) PARTITION BY HASH(cntrb_id);

ALTER TABLE "augur_data"."contributors" OWNER TO "augur";
COMMENT ON COLUMN "augur_data"."contributors"."cntrb_login" IS 'Will be a double population with the same value as gh_login for github, but the local value for other systems. ';
COMMENT ON COLUMN "augur_data"."contributors"."cntrb_email" IS 'This needs to be here for matching contributor ids, which are augur, to the commit information. ';
COMMENT ON COLUMN "augur_data"."contributors"."cntrb_type" IS 'Present in another models. It is not currently used in Augur. ';
COMMENT ON COLUMN "augur_data"."contributors"."gh_login" IS 'populated with the github user name for github originated data. ';
COMMENT ON COLUMN "augur_data"."contributors"."gl_web_url" IS '“web_url” value from these API calls to GitLab, all for the same user

https://gitlab.com/api/v4/users?username=computationalmystic
https://gitlab.com/api/v4/users?search=s@goggins.com
https://gitlab.com/api/v4/users?search=outdoors@acm.org

[
  {
    "id": 5481034,
    "name": "sean goggins",
    "username": "computationalmystic",
    "state": "active",
    "avatar_url": "https://secure.gravatar.com/avatar/fb1fb43953a6059df2fe8d94b21d575c?s=80&d=identicon",
    "web_url": "https://gitlab.com/computationalmystic"
  }
]';
COMMENT ON COLUMN "augur_data"."contributors"."gl_avatar_url" IS '“avatar_url” value from these API calls to GitLab, all for the same user

https://gitlab.com/api/v4/users?username=computationalmystic
https://gitlab.com/api/v4/users?search=s@goggins.com
https://gitlab.com/api/v4/users?search=outdoors@acm.org

[
  {
    "id": 5481034,
    "name": "sean goggins",
    "username": "computationalmystic",
    "state": "active",
    "avatar_url": "https://secure.gravatar.com/avatar/fb1fb43953a6059df2fe8d94b21d575c?s=80&d=identicon",
    "web_url": "https://gitlab.com/computationalmystic"
  }
]';
COMMENT ON COLUMN "augur_data"."contributors"."gl_state" IS '“state” value from these API calls to GitLab, all for the same user

https://gitlab.com/api/v4/users?username=computationalmystic
https://gitlab.com/api/v4/users?search=s@goggins.com
https://gitlab.com/api/v4/users?search=outdoors@acm.org

[
  {
    "id": 5481034,
    "name": "sean goggins",
    "username": "computationalmystic",
    "state": "active",
    "avatar_url": "https://secure.gravatar.com/avatar/fb1fb43953a6059df2fe8d94b21d575c?s=80&d=identicon",
    "web_url": "https://gitlab.com/computationalmystic"
  }
]';
COMMENT ON COLUMN "augur_data"."contributors"."gl_username" IS '“username” value from these API calls to GitLab, all for the same user

https://gitlab.com/api/v4/users?username=computationalmystic
https://gitlab.com/api/v4/users?search=s@goggins.com
https://gitlab.com/api/v4/users?search=outdoors@acm.org

[
  {
    "id": 5481034,
    "name": "sean goggins",
    "username": "computationalmystic",
    "state": "active",
    "avatar_url": "https://secure.gravatar.com/avatar/fb1fb43953a6059df2fe8d94b21d575c?s=80&d=identicon",
    "web_url": "https://gitlab.com/computationalmystic"
  }
]';
COMMENT ON COLUMN "augur_data"."contributors"."gl_full_name" IS '“name” value from these API calls to GitLab, all for the same user

https://gitlab.com/api/v4/users?username=computationalmystic
https://gitlab.com/api/v4/users?search=s@goggins.com
https://gitlab.com/api/v4/users?search=outdoors@acm.org

[
  {
    "id": 5481034,
    "name": "sean goggins",
    "username": "computationalmystic",
    "state": "active",
    "avatar_url": "https://secure.gravatar.com/avatar/fb1fb43953a6059df2fe8d94b21d575c?s=80&d=identicon",
    "web_url": "https://gitlab.com/computationalmystic"
  }
]';
COMMENT ON COLUMN "augur_data"."contributors"."gl_id" IS '"id" value from these API calls to GitLab, all for the same user

https://gitlab.com/api/v4/users?username=computationalmystic
https://gitlab.com/api/v4/users?search=s@goggins.com
https://gitlab.com/api/v4/users?search=outdoors@acm.org

[
  {
    "id": 5481034,
    "name": "sean goggins",
    "username": "computationalmystic",
    "state": "active",
    "avatar_url": "https://secure.gravatar.com/avatar/fb1fb43953a6059df2fe8d94b21d575c?s=80&d=identicon",
    "web_url": "https://gitlab.com/computationalmystic"
  }
]';
COMMENT ON TABLE "augur_data"."contributors" IS 'For GitHub, this should be repeated from gh_login. for other systems, it should be that systems login. 
Github now allows a user to change their login name, but their user id remains the same in this case. So, the natural key is the combination of id and login, but there should never be repeated logins. '; 

-- STEP 3: Generate 64 partitions
DO $$
BEGIN
  FOR i IN 0..63 LOOP
    EXECUTE format(
      'CREATE TABLE augur_data.contributors_p%s PARTITION OF augur_data.contributors FOR VALUES WITH (MODULUS 64, REMAINDER %s);',
      i, i
    );
  END LOOP;
END $$;

-- STEP 4: Copy old data
INSERT INTO augur_data.contributors
SELECT * FROM augur_data.contributors_old;

-- (Optional) STEP 5: Drop old table if everything looks good
-- DROP TABLE augur_data.contributors_old;

/*
 Navicat Premium Data Transfer

 Source Server         : chaoss.tv-local
 Source Server Type    : PostgreSQL
 Source Server Version : 120022
 Source Host           : 192.168.1.107:5432
 Source Catalog        : padres
 Source Schema         : augur_data

 Target Server Type    : PostgreSQL
 Target Server Version : 120022
 File Encoding         : 65001

 Date: 14/04/2025 11:25:00
*/


-- ----------------------------
-- Table structure for contributors
-- ----------------------------
-- DROP TABLE IF EXISTS "augur_data"."contributors";


-- ----------------------------
-- Indexes structure for table contributors
-- ----------------------------
CREATE INDEX "cnt-fullname_new" ON "augur_data"."contributors" USING hash (
  "cntrb_full_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops"
);
CREATE INDEX "cntrb-theemail_new" ON "augur_data"."contributors" USING hash (
  "cntrb_email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops"
);
CREATE INDEX "cntrb_canonica-idx11_new" ON "augur_data"."contributors" USING btree (
  "cntrb_canonical" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "cntrb_login_platform_index_new" ON "augur_data"."contributors" USING btree (
  "cntrb_login" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "contributor_worker_email_finder_new" ON "augur_data"."contributors" USING brin (
  "cntrb_email" COLLATE "pg_catalog"."default" "pg_catalog"."text_minmax_ops"
);
CREATE INDEX "contributor_worker_fullname_finder_new" ON "augur_data"."contributors" USING brin (
  "cntrb_full_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_minmax_ops"
);
CREATE INDEX "contributors_idx_cntrb_email3_new" ON "augur_data"."contributors" USING btree (
  "cntrb_email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "gh_login_new" ON "augur_data"."contributors" USING btree (
  "gh_login" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS FIRST
);
CREATE INDEX "login_new" ON "augur_data"."contributors" USING btree (
  "cntrb_login" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "login-contributor-idx_new" ON "augur_data"."contributors" USING btree (
  "cntrb_login" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);


/**
ERROR:  unique constraint on partitioned table must include all partitioning columns
DETAIL:  UNIQUE constraint on table "contributors" lacks column "cntrb_id" which is part of the partition key.
ERROR:  unique constraint on partitioned table must include all partitioning columns
DETAIL:  UNIQUE constraint on table "contributors" lacks column "cntrb_id" which is part of the partition key.

UNIQUEs need to be in any partitioning scheme, and only on column can be used for Hash partitioning. 
**/

-- ----------------------------
-- Uniques structure for table contributors
-- ----------------------------
ALTER TABLE "augur_data"."contributors" ADD CONSTRAINT "GL-UNIQUE-B_new" UNIQUE ("gl_id") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "augur_data"."contributors" ADD CONSTRAINT "GL-UNIQUE-C_new" UNIQUE ("gl_username") DEFERRABLE INITIALLY DEFERRED;

-- ----------------------------
-- Primary Key structure for table contributors
-- ----------------------------
ALTER TABLE "augur_data"."contributors" ADD CONSTRAINT "contributors-pk_new" PRIMARY KEY ("cntrb_id");


/**
select gh_user_id, count(*) as counter 
from contributors
GROUP BY gh_user_id 
order by counter desc; 

select gh_login, count(*) as counter 
from contributors
GROUP BY gh_login 
order by counter desc; 

**/