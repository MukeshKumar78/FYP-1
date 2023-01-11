
    create table app_user (
       id  bigserial not null,
        email varchar(255),
        first_name varchar(255) not null,
        last_name varchar(255),
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255),
        created_at timestamp,
        description varchar(255),
        end_date timestamp,
        published boolean,
        published_at timestamp,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        updated_at timestamp,
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        uri varchar(255),
        event_id int8 not null,
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
        created_at timestamp,
        description varchar(255),
        image TEXT,
        title varchar(255) not null,
        updated_at timestamp,
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

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

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
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, title, description, image, tenure_id, created_at) VALUES ('test', 'a society for test', 'https://picsum.photos/500', 'Test', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (1, 'https://picsum.photos/1280/720', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (2, 'https://picsum.photos/1280/720', 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        first_name varchar(255) not null,
        last_name varchar(255),
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255),
        created_at timestamp,
        description varchar(255),
        end_date timestamp,
        published boolean,
        published_at timestamp,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        updated_at timestamp,
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        uri varchar(255),
        event_id int8 not null,
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
        created_at timestamp,
        description varchar(255),
        image TEXT,
        title varchar(255) not null,
        updated_at timestamp,
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

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

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
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, title, description, image, tenure_id, created_at) VALUES ('test', 'a society for test', 'https://picsum.photos/500', 'Test', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (1, 'https://picsum.photos/1280/720', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (2, 'https://picsum.photos/1280/720', 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        first_name varchar(255) not null,
        last_name varchar(255),
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255),
        created_at timestamp,
        description varchar(255),
        end_date timestamp,
        published boolean,
        published_at timestamp,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        updated_at timestamp,
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        uri varchar(255),
        event_id int8 not null,
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
        created_at timestamp,
        description varchar(255),
        image TEXT,
        title varchar(255) not null,
        updated_at timestamp,
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

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

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
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, title, description, image, tenure_id, created_at) VALUES ('test', 'a society for test', 'https://picsum.photos/500', 'Test', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (1, 'https://picsum.photos/1280/720', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (2, 'https://picsum.photos/1280/720', 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        first_name varchar(255) not null,
        last_name varchar(255),
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255),
        created_at timestamp,
        description varchar(255),
        end_date timestamp,
        published boolean,
        published_at timestamp,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        updated_at timestamp,
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        uri varchar(255),
        event_id int8 not null,
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
        created_at timestamp,
        description varchar(255),
        image TEXT,
        title varchar(255) not null,
        updated_at timestamp,
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

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

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
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, title, description, image, tenure_id, created_at) VALUES ('test', 'a society for test', 'https://picsum.photos/500', 'Test', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (1, 'https://picsum.photos/1280/720', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (2, 'https://picsum.photos/1280/720', 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        first_name varchar(255) not null,
        last_name varchar(255),
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255),
        created_at timestamp,
        description varchar(255),
        end_date timestamp,
        published boolean,
        published_at timestamp,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        updated_at timestamp,
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        uri varchar(255),
        event_id int8 not null,
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
        created_at timestamp,
        description varchar(255),
        full_name varchar(255) not null,
        image TEXT,
        name varchar(255) not null,
        updated_at timestamp,
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

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

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
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, name, full_name, description, image, tenure_id, created_at);
VALUES ('test', 'TS', 'Test Society', 'a society for testing', 'https://picsum.photos/500', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (1, 'https://picsum.photos/1280/720', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (2, 'https://picsum.photos/1280/720', 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        first_name varchar(255) not null,
        last_name varchar(255),
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255),
        created_at timestamp,
        description varchar(255),
        end_date timestamp,
        published boolean,
        published_at timestamp,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        updated_at timestamp,
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        uri varchar(255),
        event_id int8 not null,
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
        created_at timestamp,
        description varchar(255),
        full_name varchar(255) not null,
        image TEXT,
        name varchar(255) not null,
        updated_at timestamp,
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

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

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
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, name, full_name, description, image, tenure_id, created_at) VALUES ('test', 'TS', 'Test Society', 'a society for testing', 'https://picsum.photos/500', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (1, 'https://picsum.photos/1280/720', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (2, 'https://picsum.photos/1280/720', 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        first_name varchar(255) not null,
        last_name varchar(255),
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255),
        created_at timestamp,
        description varchar(255),
        end_date timestamp,
        published boolean,
        published_at timestamp,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        updated_at timestamp,
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        uri varchar(255),
        event_id int8 not null,
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
        created_at timestamp,
        description varchar(255),
        full_name varchar(255) not null,
        image TEXT,
        name varchar(255) not null,
        updated_at timestamp,
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

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

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
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, name, full_name, description, image, tenure_id, created_at) VALUES ('test', 'TS', 'Test Society', 'a society for testing', 'https://picsum.photos/500', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (1, 'https://picsum.photos/1280/720', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (2, 'https://picsum.photos/1280/720', 1);

    create table app_user (
       id  bigserial not null,
        email varchar(255),
        first_name varchar(255) not null,
        last_name varchar(255),
        photo varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255),
        created_at timestamp,
        description varchar(255),
        end_date timestamp,
        published boolean,
        published_at timestamp,
        registration_link TEXT,
        start_date timestamp,
        text TEXT not null,
        title varchar(255),
        updated_at timestamp,
        member_id int8 not null,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        uri varchar(255),
        event_id int8 not null,
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
        created_at timestamp,
        description varchar(255),
        full_name varchar(255) not null,
        image TEXT,
        name varchar(255) not null,
        updated_at timestamp,
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

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

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
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, name, full_name, description, image, tenure_id, created_at) VALUES ('test', 'TS', 'Test Society', 'a society for testing', 'https://picsum.photos/500', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (1, 'https://picsum.photos/1280/720', 1);
INSERT INTO event_attachment (id, uri, event_id) VALUES (2, 'https://picsum.photos/1280/720', 1);
