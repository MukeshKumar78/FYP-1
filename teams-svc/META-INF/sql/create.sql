create sequence hibernate_sequence start 1 increment 1;

    create table app_user (
       id int8 not null,
        email varchar(255),
        name varchar(255) not null,
        photo varchar(255),
        primary key (id)
    );

    create table member (
       id int8 not null,
        role_id int8,
        user_id int8,
        primary key (id)
    );

    create table permission (
       id int8 not null,
        code varchar(255),
        description varchar(255),
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

    create table team_chat_message (
       id int8 not null,
        content varchar(255) not null,
        user_id int8 not null,
        primary key (id)
    );

    alter table app_user 
       add constraint UK_1j9d9a06i600gd43uu3km82jw unique (email);

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table member 
       add constraint FK7cm1epoypfx0kcnrp01en2l3m 
       foreign key (role_id) 
       references role;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    alter table team_chat_message 
       add constraint FK553asryh63ytkeg6d03xa9p1v 
       foreign key (user_id) 
       references member;
