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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
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

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FKb0kh9u5tvvf8yjkij10w65t6y 
       foreign key (society_id) 
       references society;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (id, name, email, photo) VALUES (1, "John Doe", "email", "yeah");
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (id, name, email, photo) VALUES (1, 'John Doe', 'email', 'yeah');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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
       id  bigserial not null,
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (id, name, email, photo) VALUES (1, 'John Doe', 'email', 'yeah');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (id, name, email, photo) VALUES (1, 'John Doe', 'email', 'yeah');
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

    create table hibernate_sequences (
       sequence_name varchar(255) not null,
        next_val int8,
        primary key (sequence_name)
    );

    insert into hibernate_sequences(sequence_name, next_val) values ('default',0);

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (id, name, email, photo) VALUES (1, 'John Doe', 'email', 'yeah');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'email', 'yeah');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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
       id  bigserial not null,
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'email', 'yeah');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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
       id  bigserial not null,
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'email', 'yeah');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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
       id  bigserial not null,
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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
       id  bigserial not null,
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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
       id  bigserial not null,
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
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

    create table member (
       id int8 not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id int8 not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
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
       id  bigserial not null,
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table event (
       id  bigserial not null,
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

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table society_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

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

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKldr0is4x33wmmhp5j5xt2t6no 
       foreign key (user_id) 
       references society_user;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role_id int8,
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        name varchar(255),
        primary key (id)
    );

    create table roles_permissions (
       role_id int8 not null,
        permission_id int8 not null,
        primary key (role_id, permission_id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'email@email.com', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
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
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        role varchar(255),
        society_id int8,
        user_id int8,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        text TEXT not null,
        member_id int8 not null,
        event_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        title varchar(255) not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        duration varchar(255),
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table event 
       add constraint UK_7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table post 
       add constraint UK_tojhbicb8m3fuo82limwdqlaj unique (code);

    alter table society 
       add constraint UK_1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table tenure 
       add constraint UK_13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table event 
       add constraint FKjr5weucc5itt2wrqqdo0obbul 
       foreign key (member_id) 
       references member;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FK7btun19hg3laiolk6afff2yak 
       foreign key (society_id) 
       references society;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table post 
       add constraint FK83s99f4kx8oiqm3ro0sasmpww 
       foreign key (member_id) 
       references member;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;
INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
