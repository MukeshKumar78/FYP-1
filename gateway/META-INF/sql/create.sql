create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table user 
       add constraint FKn82ha3ccdebhokx3a8fgdqeyy 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table role (
       id int8 not null,
        description varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        role_id int8,
        primary key (id)
    );

    alter table role 
       add constraint UK_8sewwnpamngi6b1dwaa88askk unique (name);

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table "user" 
       add constraint FKdl9dqp078pc03g6kdnxmnlqpc 
       foreign key (role_id) 
       references role;
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
create sequence hibernate_sequence start 1 increment 1;

    create table "user" (
       id int8 not null,
        email varchar(255) not null,
        image varchar(255),
        name varchar(255) not null,
        primary key (id)
    );

    alter table "user" 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);
