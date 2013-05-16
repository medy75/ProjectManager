CREATE TABLE "issues" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "label" varchar(255), "description" text, "status" varchar(255), "estimate" decimal, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "project_id" integer, "points_estimate" integer);
CREATE TABLE "projects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "projects_users" ("user_id" integer, "project_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "provider" varchar(255), "uid" varchar(255), "username" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "email" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "role" varchar(255));
CREATE TABLE "users_projects" ("user_id" integer, "project_id" integer);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20121025141021');

INSERT INTO schema_migrations (version) VALUES ('20121029194443');

INSERT INTO schema_migrations (version) VALUES ('20121031083814');

INSERT INTO schema_migrations (version) VALUES ('20121031095518');

INSERT INTO schema_migrations (version) VALUES ('20121102090342');

INSERT INTO schema_migrations (version) VALUES ('20121102114315');

INSERT INTO schema_migrations (version) VALUES ('20121114081107');

INSERT INTO schema_migrations (version) VALUES ('20121120082251');

INSERT INTO schema_migrations (version) VALUES ('20121120204109');

INSERT INTO schema_migrations (version) VALUES ('20130227220547');

INSERT INTO schema_migrations (version) VALUES ('20130306211216');