drop table pricing_plans;
drop table plan_balances;
drop table users;
drop table contents;

create table pricing_plans(
	id int not null,
	pricing_plan_name varchar(255) not null,
	promo_message varchar(255) null,
	is_promo bit not null,
	is_featured bit not null,
	is_enabled bit not null,
	show_on_site bit not null,
	plan_charge decimal(28, 4) null,
	plan_recurrance varchar(255) null,
	number_of_songs int null,
	number_of_invited_users int null,
	number_of_catalog_admins int null,
	custom_contactus bit not null,
	custom_siteprofile bit not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)	
)
	
create table plan_balances(
	id int not null auto_increment,
	pricing_plan_id int not null,
	number_of_songs int not null,
	number_of_invited_users int not null,
	number_of_catalog_admins int not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)	
)

create table roles(
	id int not null,
	role_name varchar(255) not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)	
)

create table users(
	id int not null auto_increment,
	user_name varchar(255) not null,
	password varchar(255) not null,
	first_name varchar(255) null,
	last_name varchar(255) null,
	parent_user_id int null,
	plan_user_id int not null,
	role_id int not null,
	site_profile_id int not null,
	pricing_plan_id int not null,
	plan_balance_id int not null,
	invitation_id binary(36)  null,
	registered_on datetime not null,
	signature varchar(1000) null,
	show_debug_info bit null,
	append_signature_to_title bit not null,
	has_agreed_to_privacy_policy bit not null,
	has_allowed_communication bit not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table catalogs(
	id int not null auto_increment,
	catalog_name varchar(100) not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table contents(
	id int not null auto_increment,
	catalog_id int not null,
	is_controlled_allin bit not null,
	title varchar(300) not null,
	artist varchar(300) not null,
	writers varchar(500) null,
	pop int null,
	country int null,
	release_year int null,
	record_label varchar(300) null,
	lyrics varchar(5000) null,
	lyrics_index varchar(5000) null,
	notes varchar(5000) null,
	keywords varchar(5000) null,
	similar_songs varchar(5000) null,
	licensing_notes varchar(5000) null,
	sounds_like varchar(5000) null,
	instruments varchar(5000) null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table representations(
	id int not null auto_increment,
	content_id int not null,
	rights_type_id int not null,
	representation_share decimal(28, 4) not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)	
)

create table media(
	id int not null,
	content_id int not null,
	media_version int not null,
	media_date datetime not null,
	is_remote bit not null,
	mediat_ype varchar(5) null,
	media_bitrate int null,
	media_size bigint null,
	media_length bigint null,
	created_at datetime,
	updated_at datetime,
	primary key (id)	
	)

create table lists(
	id int not null auto_increment,
	user_id int not null,
	list_name varchar(255) not null,
	number_items int null,
	compressed_size decimal(28, 4) null,
	archive_name varchar(256) null,
	is_last_processed bit null,
	created_at datetime,
	updated_at datetime,
	primary key (id)	
)

create table lists_contents(
	list_id int not null,
	content_id int not null,
	primary key (list_id, content_id)	
)

create table invitations(
	id binary(36) not null,
	invitation_email_address varchar(255) not null,
	expiration_date datetime not null,
	invitation_status smallint not null,
	invited_by_user_id int not null,
	is_plan_invitation bit not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table contacts(
	id int not null auto_increment,
	user_id int not null,
	contact_type_id int not null,
	is_default bit not null,
	contact_name varchar(100) null,
	company_name varchar(100) null,
	address_1 varchar(100) null,
	address_2 varchar(100) null,
	city varchar(100) null,
	state_region varchar(50) null,
	postal_code varchar(50) null,
	country varchar(50) null,
	phone_1 varchar(50) null,
	phone_2 varchar(50) null,
	fax varchar(50) null,
	email varchar(250) null,
	admin_email varchar(250) null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table site_profiles(
	id  int not null,
	profile_name varchar(50) not null,
	company_name varchar(100) not null,
	contact_address_1 varchar(100) not null,
	contact_address_2 varchar(100) null,
	contact_city varchar(100) not null,
	contact_state_region varchar(50) not null,
	contact_postal_code varchar(50) not null,
	contact_country varchar(50) not null,
	contact_phone varchar(50) not null,
	contact_fax varchar(50) null,
	contact_email varchar(250) not null,
	admin_email varchar(250) not null,
	has_profile_logo bit not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table search_properties(
	id int not null,
	property_name varchar(50) not null,
	display_name varchar(100) not null,
	short_name varchar(50) not null,
	search_group varchar(50) null,
	search_menu_order int not null,
	search_type_id smallint null,
	search_predicate varchar(50) null,
	property_type varchar(50) not null,
	lookup_name varchar(50) null,
	list_name varchar(10) null,
	access_level smallint not null,
	is_listable bit not null,
	is_cacheable bit not null,
	is_indexable bit not null,
	include_in_search_menu bit not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table territories(
	id int not null auto_increment,
	territory_code varchar(50) not null,
	territory_name varchar(100) not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table representations_territories(
	representation_id int not null,
	territory_id int not null,
	primary key(representation_id, territory_id)
)

create table tags(
	id int not null auto_increment,
	tag_name varchar(100) not null,
	tag_type_id int not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)

create table contents_tags(
	content_id int not null,
	tag_id int not null,
	primary key(content_id, tag_id)
)

create table users_roles(
	user_id int not null,
	catalog_id int not null,
	role_id int not null,
	primary key(user_id, catalog_id)
)

create table subscriptions(
	id int not null auto_increment,
	pricing_plan_id int not null,
	user_id int not null,
	subscription_start_date datetime not null,
	subscription_end_date datetime null,
	plan_charge decimal(28, 4) not null,
	created_at datetime,
	updated_at datetime,
	primary key (id)
)
;