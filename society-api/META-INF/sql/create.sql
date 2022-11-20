create sequence hibernate_sequence start 1 increment 1

    create table users (
       id int8 not null,
        email varchar(255),
        name varchar(255),
        primary key (id)
    )

    alter table users 
       add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email)
