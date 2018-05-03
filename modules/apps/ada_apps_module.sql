#
# IMPORTANT NOTE: run this SQL in the ADA COMMON DATABASE!
#

CREATE TABLE module_oauth2_oauth_clients (client_id VARCHAR(80) NOT NULL, client_secret VARCHAR(80) NOT NULL, redirect_uri VARCHAR(2000) NOT NULL, grant_types VARCHAR(80), scope VARCHAR(100), user_id VARCHAR(80), CONSTRAINT client_id_pk PRIMARY KEY (client_id));
CREATE TABLE module_oauth2_oauth_access_tokens (access_token VARCHAR(40) NOT NULL, client_id VARCHAR(80) NOT NULL, user_id VARCHAR(255), expires TIMESTAMP NOT NULL, scope VARCHAR(2000), CONSTRAINT access_token_pk PRIMARY KEY (access_token));
CREATE TABLE module_oauth2_oauth_authorization_codes (authorization_code VARCHAR(40) NOT NULL, client_id VARCHAR(80) NOT NULL, user_id VARCHAR(255), redirect_uri VARCHAR(2000), expires TIMESTAMP NOT NULL, scope VARCHAR(2000), CONSTRAINT auth_code_pk PRIMARY KEY (authorization_code));
CREATE TABLE module_oauth2_oauth_refresh_tokens (refresh_token VARCHAR(40) NOT NULL, client_id VARCHAR(80) NOT NULL, user_id VARCHAR(255), expires TIMESTAMP NOT NULL, scope VARCHAR(2000), CONSTRAINT refresh_token_pk PRIMARY KEY (refresh_token));
CREATE TABLE module_oauth2_oauth_users (username VARCHAR(255) NOT NULL, password VARCHAR(2000), first_name VARCHAR(255), last_name VARCHAR(255), CONSTRAINT username_pk PRIMARY KEY (username));
CREATE TABLE module_oauth2_oauth_scopes (scope TEXT, is_default BOOLEAN);
CREATE TABLE module_oauth2_oauth_jwt (client_id VARCHAR(80) NOT NULL, subject VARCHAR(80), public_key VARCHAR(2000), CONSTRAINT client_id_pk PRIMARY KEY (client_id));
ALTER TABLE `module_oauth2_oauth_clients` ENGINE=InnoDB;
ALTER TABLE `module_oauth2_oauth_access_tokens` ENGINE=InnoDB;
ALTER TABLE `module_oauth2_oauth_authorization_codes` ENGINE=InnoDB;
ALTER TABLE `module_oauth2_oauth_refresh_tokens` ENGINE=InnoDB;
ALTER TABLE `module_oauth2_oauth_users` ENGINE=InnoDB;
ALTER TABLE `module_oauth2_oauth_scopes` ENGINE=InnoDB;
ALTER TABLE `module_oauth2_oauth_jwt` ENGINE=InnoDB;