create sequence hibernate_sequence start 1 increment 1

    create table users (
       id int8 not null,
        email varchar(255),
        name varchar(255),
        primary key (id)
    )

    alter table users 
       add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email)
create sequence hibernate_sequence start 1 increment 1

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    )

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    )

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    )

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    )

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code)

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code)

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code)

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure
create sequence hibernate_sequence start 1 increment 1

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    )

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    )

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    )

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    )

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code)

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code)

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code)

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure
create sequence hibernate_sequence start 1 increment 1

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    )

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    )

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    )

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    )

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code)

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code)

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code)

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure
create sequence hibernate_sequence start 1 increment 1

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    )

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    )

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    )

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    )

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code)

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code)

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code)

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure
create sequence hibernate_sequence start 1 increment 1

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    )

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    )

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    )

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    )

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code)

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code)

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code)

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email)

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    create table user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table user 
       add constraint UK_ob8kqyqqgmefl0aco34akdtpe unique (email);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
create sequence hibernate_sequence start 1 increment 1;

    create table event (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        end_date timestamp,
        published boolean,
        rating_count int8,
        rating_sum int8,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society_user 
       add constraint UK_kskcwjhlg1ir3obmwl5gyqbyo unique (email);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
