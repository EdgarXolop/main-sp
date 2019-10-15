create database if not exists s_schema;

use s_schema;

create table if not exists users(
	id_user bigint auto_increment primary key not null,
    user_name varchar(100) not null,
    email varchar(100) not null,
    first_name varchar(200),
    last_name  varchar(200) ,
    date_of_birth timestamp ,
    banned tinyint default 0 ,
    password varchar(500) ,
    phone_number varchar(500) 
)ENGINE = MYISAM;

insert ignore into users(user_name,email,first_name,last_name,date_of_birth,banned,password,phone_number) values('abc','abc@mail.com','abc','123',now(),0,'$2a$08$fL7u5xcvsZl78su29x1ti.dxI.9rYO8t0q5wk2ROJ.1cdR53bmaVG','50212345678');
insert ignore into users(user_name,email,first_name,last_name,date_of_birth,banned,password,phone_number) values('xolop','xolop@mail.com','abc','123',now(),0,'$2a$08$fL7u5xcvsZl78su29x1ti.dxI.9rYO8t0q5wk2ROJ.1cdR53bmaVG','50212345678');


select * from users;

create table if not exists conversations(
    id_conversation bigint auto_increment primary key not null,
    id_user_creator bigint not null,
    id_user_invited bigint not null,
    accepted tinyint default 0,
    standby_mode tinyint default 0,
    uuid varchar(200),
    last_message text,
    updated_at timestamp not null default current_timestamp on update current_timestamp,
    foreign key (id_user_creator) references users(id_user),
    foreign key (id_user_invited) references users(id_user)
)ENGINE = MYISAM;

select * from conversations;


create table if not exists posts(
	id_post bigint auto_increment primary key not null,
    id_user_creator bigint not null,
    deleted_at timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    content text
)ENGINE = MYISAM;



create unique index user_index_email
on users(user_name);

create unique index user_index_user_name
on users(email);