/* Drop Tables related to OAUTH2 */  
drop table if exists oauth_client_details;
drop table if exists oauth_access_token;
drop table if exists oauth_refresh_token;
drop table if exists oauth_client_token;
drop table if exists oauth_code;

/*Drop Tables related users and granted authorities*/
drop table if exists authorities;  
drop table if exists users;  


/* Create Tables related users and granted authorities*/
create table if not exists  users(
	username varchar(50) not null primary key,
	password varchar(50) not null,
	enabled boolean not null
);  

create table if not exists  authorities (
	username varchar(50) not null,
	authority varchar(50) not null,
	constraint fk_authorities_users foreign key(username) references users(username),
	unique index ix_auth_username (username,authority)
);


/* Create Tables related to OAUTH2 */  
create table if not exists oauth_client_details (
	client_id VARCHAR(128) PRIMARY KEY,
	resource_ids VARCHAR(128),
	client_secret VARCHAR(128),
	scope VARCHAR(128),
	authorized_grant_types VARCHAR(128),
	web_server_redirect_uri VARCHAR(128),
	authorities VARCHAR(128),
	access_token_validity INTEGER,
	refresh_token_validity INTEGER,
	additional_information VARCHAR(128)
);

create table if not exists oauth_access_token (
	token_id VARCHAR(256),
	token longblob,
	authentication_id VARCHAR(256),
	user_name VARCHAR(256),
	client_id VARCHAR(256),
	authentication longblob,
	refresh_token VARCHAR(256)
);

create table if not exists oauth_refresh_token (
	token_id VARCHAR(256),
	token longblob,
	authentication longblob
);

create table if not exists oauth_client_token (
	token_id VARCHAR(256),
	token longblob,
	authentication_id VARCHAR(256),
	user_name VARCHAR(256),
	client_id VARCHAR(256)
);

create table if not exists oauth_code (
	code VARCHAR(256), authentication longblob
);


/* Sample Insertion Scripts */
insert into oauth_client_details values (
	'client1',
	 null,
	 null,
	 'read,write,delete',
	 'password,authorization_code,refresh_token,implicit',
	 null,
	 'ROLE_CLIENT, ROLE_TRUSTED_CLIENT',
	 null,
	 null,
	 null
);

insert into users values ('a','a',1);
insert into users values ('b','b',1);
insert into users values ('c','c',1);
insert into users values ('d','d',1);

insert into authorities values ('a','ROLE_USER');
insert into authorities values ('a','ROLE_CLIENT');

insert into authorities values ('b','ROLE_USER') ;
insert into authorities values ('b','ROLE_CLIENT');

insert into authorities values ('c','ROLE_ADMIN');
insert into authorities values ('c','ROLE_TRUSTED_CLIENT');

insert into authorities values ('d','ROLE_USER');
insert into authorities values ('d','ROLE_CLIENT');

commit;