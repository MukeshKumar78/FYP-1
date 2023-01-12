
    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('CREATE_EVENT', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);

    create table permission (
       id  bigserial not null,
        code varchar(255),
        description varchar(255),
        permission varchar(255),
        target varchar(255),
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

    alter table permission 
       add constraint UK_a7ujv987la0i7a0o91ueevchc unique (code);

    alter table role 
       add constraint UK_c36say97xydpmgigg38qv5l2p unique (code);

    alter table roles_permissions 
       add constraint FKboeuhl31go7wer3bpy6so7exi 
       foreign key (permission_id) 
       references permission;

    alter table roles_permissions 
       add constraint FK4hrolwj4ned5i7qe8kyiaak6m 
       foreign key (role_id) 
       references role;
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_PUBLISH', 'permission to publish society events', 'EVENT', 'PUBLISH');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);
