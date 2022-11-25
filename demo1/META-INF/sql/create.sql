
    create table app_user (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table comment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text varchar(255),
        event_id int8 not null,
        primary key (id)
    );

    create table defined_society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        end_date timestamp,
        end_time time,
        published boolean,
        reg_link TEXT,
        start_date timestamp,
        start_time time,
        sum_of_ratings int8,
        text TEXT,
        title varchar(255),
        total_ratings int8,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        society_id int8 not null,
        user_id int8 not null,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        role_id int8 not null,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table post_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        post_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        defined_society_id int8 not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table team (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        primary key (id)
    );

    create table team_member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        member_id int8 not null,
        role_id int8,
        team_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        duration varchar(64),
        primary key (id)
    );

    alter table app_user 
       add constraint UKblwoswn8lymx57h1m37du2505 unique (code);

    alter table app_user 
       add constraint UK70fxrpev3vghcdjrw6m2fx37k unique (description);

    alter table app_user 
       add constraint UK1j9d9a06i600gd43uu3km82jw unique (email);

    alter table comment 
       add constraint UKa7id1kuyg95ydkx7vrc80v2g1 unique (code);

    alter table comment 
       add constraint UKsxco5i2vnerw5ngg3323j9sjo unique (description);

    alter table defined_society 
       add constraint UKiqqqedk4vbasw6hjvvu4h7m9s unique (code);

    alter table defined_society 
       add constraint UKbovne5rjq818l8hs1owgehylo unique (description);

    alter table event 
       add constraint UK7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table event 
       add constraint UKqxywheq0hkrkclejsv3o2qg4k unique (description);

    alter table event_attachment 
       add constraint UKsbk6uyhgsjrplnugpjg8ymblq unique (code);

    alter table event_attachment 
       add constraint UK6o6dmkptfsu84s2r72ic02t38 unique (description);

    alter table member 
       add constraint UK4khba0d7ikbnm1uilh1po0u0c unique (code);

    alter table member 
       add constraint UKdhm034jl4tiw9ssyqc6y5tw2x unique (description);

    alter table permission 
       add constraint UKa7ujv987la0i7a0o91ueevchc unique (code);

    alter table permission 
       add constraint UKrackm46yf6r4xcaue8l6rt71n unique (description);

    alter table post 
       add constraint UKtojhbicb8m3fuo82limwdqlaj unique (code);

    alter table post 
       add constraint UKpwh7iy9o4qv751bn9mb25fa44 unique (description);

    alter table post_attachment 
       add constraint UKp1p6s8po5kdq1ygfsbqfgfl9j unique (code);

    alter table post_attachment 
       add constraint UKkk6jgy62f8kke10a1w8tfmw7w unique (description);

    alter table role 
       add constraint UKc36say97xydpmgigg38qv5l2p unique (code);

    alter table role 
       add constraint UK2tysw6t5feqb631yj4kdk99i5 unique (description);

    alter table society 
       add constraint UK1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society 
       add constraint UKitpi17vroukh9ijjg07y15gr0 unique (description);

    alter table team 
       add constraint UKrnln7n3qqo11sl7tkpkrqf78i unique (code);

    alter table team 
       add constraint UK1s1a5xfgscux09k2ae1l9tnal unique (description);

    alter table team_member 
       add constraint UKoguf5mbq9756ppu5et17yltna unique (code);

    alter table team_member 
       add constraint UKach13cbhrxyvyck7wlf2sepb6 unique (description);

    alter table tenure 
       add constraint UK13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table tenure 
       add constraint UKhv8k6cd19mimgfofkmb66n7ob unique (description);

    alter table comment 
       add constraint FKhr48nopy5aorw0ta1ii704tpu 
       foreign key (event_id) 
       references event;

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

    alter table permission 
       add constraint FKrvhjnns4bvlh4m1n97vb7vbar 
       foreign key (role_id) 
       references role;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table post_attachment 
       add constraint FKmof1y73w0oea4caub8rpkhlmi 
       foreign key (post_id) 
       references post;

    alter table role 
       add constraint FKb7pdjmsvxc5f6ie2m5a8hndj6 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKe7ncjx414ji5jbyinv3150p2w 
       foreign key (defined_society_id) 
       references defined_society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;

    alter table team_member 
       add constraint FKt5k957ydx0vngjtsljbelmu75 
       foreign key (member_id) 
       references member;

    alter table team_member 
       add constraint FK4plntb5fui8pch4tvi697a000 
       foreign key (role_id) 
       references role;

    alter table team_member 
       add constraint FK9ubp79ei4tv4crd0r9n7u5i6e 
       foreign key (team_id) 
       references team;

    create table app_user (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table comment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text varchar(255),
        event_id int8 not null,
        primary key (id)
    );

    create table defined_society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        end_date timestamp,
        end_time time,
        published boolean,
        reg_link TEXT,
        start_date timestamp,
        start_time time,
        sum_of_ratings int8,
        text TEXT,
        title varchar(255),
        total_ratings int8,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        user_id int8 not null,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        role_id int8 not null,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table post_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        post_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        defined_society_id int8 not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table team (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        primary key (id)
    );

    create table team_member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        member_id int8 not null,
        role_id int8,
        society_id int8 not null,
        team_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        duration varchar(64),
        primary key (id)
    );

    alter table app_user 
       add constraint UKblwoswn8lymx57h1m37du2505 unique (code);

    alter table app_user 
       add constraint UK70fxrpev3vghcdjrw6m2fx37k unique (description);

    alter table app_user 
       add constraint UK1j9d9a06i600gd43uu3km82jw unique (email);

    alter table comment 
       add constraint UKa7id1kuyg95ydkx7vrc80v2g1 unique (code);

    alter table comment 
       add constraint UKsxco5i2vnerw5ngg3323j9sjo unique (description);

    alter table defined_society 
       add constraint UKiqqqedk4vbasw6hjvvu4h7m9s unique (code);

    alter table defined_society 
       add constraint UKbovne5rjq818l8hs1owgehylo unique (description);

    alter table event 
       add constraint UK7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table event 
       add constraint UKqxywheq0hkrkclejsv3o2qg4k unique (description);

    alter table event_attachment 
       add constraint UKsbk6uyhgsjrplnugpjg8ymblq unique (code);

    alter table event_attachment 
       add constraint UK6o6dmkptfsu84s2r72ic02t38 unique (description);

    alter table member 
       add constraint UK4khba0d7ikbnm1uilh1po0u0c unique (code);

    alter table member 
       add constraint UKdhm034jl4tiw9ssyqc6y5tw2x unique (description);

    alter table permission 
       add constraint UKa7ujv987la0i7a0o91ueevchc unique (code);

    alter table permission 
       add constraint UKrackm46yf6r4xcaue8l6rt71n unique (description);

    alter table post 
       add constraint UKtojhbicb8m3fuo82limwdqlaj unique (code);

    alter table post 
       add constraint UKpwh7iy9o4qv751bn9mb25fa44 unique (description);

    alter table post_attachment 
       add constraint UKp1p6s8po5kdq1ygfsbqfgfl9j unique (code);

    alter table post_attachment 
       add constraint UKkk6jgy62f8kke10a1w8tfmw7w unique (description);

    alter table role 
       add constraint UKc36say97xydpmgigg38qv5l2p unique (code);

    alter table role 
       add constraint UK2tysw6t5feqb631yj4kdk99i5 unique (description);

    alter table society 
       add constraint UK1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society 
       add constraint UKitpi17vroukh9ijjg07y15gr0 unique (description);

    alter table team 
       add constraint UKrnln7n3qqo11sl7tkpkrqf78i unique (code);

    alter table team 
       add constraint UK1s1a5xfgscux09k2ae1l9tnal unique (description);

    alter table team_member 
       add constraint UKoguf5mbq9756ppu5et17yltna unique (code);

    alter table team_member 
       add constraint UKach13cbhrxyvyck7wlf2sepb6 unique (description);

    alter table tenure 
       add constraint UK13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table tenure 
       add constraint UKhv8k6cd19mimgfofkmb66n7ob unique (description);

    alter table comment 
       add constraint FKhr48nopy5aorw0ta1ii704tpu 
       foreign key (event_id) 
       references event;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table permission 
       add constraint FKrvhjnns4bvlh4m1n97vb7vbar 
       foreign key (role_id) 
       references role;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table post_attachment 
       add constraint FKmof1y73w0oea4caub8rpkhlmi 
       foreign key (post_id) 
       references post;

    alter table role 
       add constraint FKb7pdjmsvxc5f6ie2m5a8hndj6 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKe7ncjx414ji5jbyinv3150p2w 
       foreign key (defined_society_id) 
       references defined_society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;

    alter table team_member 
       add constraint FKt5k957ydx0vngjtsljbelmu75 
       foreign key (member_id) 
       references member;

    alter table team_member 
       add constraint FK4plntb5fui8pch4tvi697a000 
       foreign key (role_id) 
       references role;

    alter table team_member 
       add constraint FK9hxcsx3v4hfaxlr3g66210emg 
       foreign key (society_id) 
       references society;

    alter table team_member 
       add constraint FK9ubp79ei4tv4crd0r9n7u5i6e 
       foreign key (team_id) 
       references team;

    create table app_user (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table comment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text varchar(255),
        event_id int8 not null,
        primary key (id)
    );

    create table defined_society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        end_date timestamp,
        end_time time,
        published boolean,
        reg_link TEXT,
        start_date timestamp,
        start_time time,
        sum_of_ratings int8,
        text TEXT,
        title varchar(255),
        total_ratings int8,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        user_id int8 not null,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        role_id int8 not null,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table post_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        post_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        defined_society_id int8 not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table team (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        primary key (id)
    );

    create table team_member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        member_id int8 not null,
        role_id int8,
        society_id int8 not null,
        team_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        duration varchar(64),
        primary key (id)
    );

    alter table app_user 
       add constraint UKblwoswn8lymx57h1m37du2505 unique (code);

    alter table app_user 
       add constraint UK70fxrpev3vghcdjrw6m2fx37k unique (description);

    alter table app_user 
       add constraint UK1j9d9a06i600gd43uu3km82jw unique (email);

    alter table comment 
       add constraint UKa7id1kuyg95ydkx7vrc80v2g1 unique (code);

    alter table comment 
       add constraint UKsxco5i2vnerw5ngg3323j9sjo unique (description);

    alter table defined_society 
       add constraint UKiqqqedk4vbasw6hjvvu4h7m9s unique (code);

    alter table defined_society 
       add constraint UKbovne5rjq818l8hs1owgehylo unique (description);

    alter table event 
       add constraint UK7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table event 
       add constraint UKqxywheq0hkrkclejsv3o2qg4k unique (description);

    alter table event_attachment 
       add constraint UKsbk6uyhgsjrplnugpjg8ymblq unique (code);

    alter table event_attachment 
       add constraint UK6o6dmkptfsu84s2r72ic02t38 unique (description);

    alter table member 
       add constraint UK4khba0d7ikbnm1uilh1po0u0c unique (code);

    alter table member 
       add constraint UKdhm034jl4tiw9ssyqc6y5tw2x unique (description);

    alter table permission 
       add constraint UKa7ujv987la0i7a0o91ueevchc unique (code);

    alter table permission 
       add constraint UKrackm46yf6r4xcaue8l6rt71n unique (description);

    alter table post 
       add constraint UKtojhbicb8m3fuo82limwdqlaj unique (code);

    alter table post 
       add constraint UKpwh7iy9o4qv751bn9mb25fa44 unique (description);

    alter table post_attachment 
       add constraint UKp1p6s8po5kdq1ygfsbqfgfl9j unique (code);

    alter table post_attachment 
       add constraint UKkk6jgy62f8kke10a1w8tfmw7w unique (description);

    alter table role 
       add constraint UKc36say97xydpmgigg38qv5l2p unique (code);

    alter table role 
       add constraint UK2tysw6t5feqb631yj4kdk99i5 unique (description);

    alter table society 
       add constraint UK1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society 
       add constraint UKitpi17vroukh9ijjg07y15gr0 unique (description);

    alter table team 
       add constraint UKrnln7n3qqo11sl7tkpkrqf78i unique (code);

    alter table team 
       add constraint UK1s1a5xfgscux09k2ae1l9tnal unique (description);

    alter table team_member 
       add constraint UKoguf5mbq9756ppu5et17yltna unique (code);

    alter table team_member 
       add constraint UKach13cbhrxyvyck7wlf2sepb6 unique (description);

    alter table tenure 
       add constraint UK13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table tenure 
       add constraint UKhv8k6cd19mimgfofkmb66n7ob unique (description);

    alter table comment 
       add constraint FKhr48nopy5aorw0ta1ii704tpu 
       foreign key (event_id) 
       references event;

    alter table event 
       add constraint FKbxnb4cs37m3nd6ta0plpkg6r0 
       foreign key (society_id) 
       references society;

    alter table event_attachment 
       add constraint FKeancy61grkftr0m9g1qkqeoj0 
       foreign key (event_id) 
       references event;

    alter table member 
       add constraint FKotadi1r93k5f9hssprgliq6yc 
       foreign key (user_id) 
       references app_user;

    alter table permission 
       add constraint FKrvhjnns4bvlh4m1n97vb7vbar 
       foreign key (role_id) 
       references role;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table post_attachment 
       add constraint FKmof1y73w0oea4caub8rpkhlmi 
       foreign key (post_id) 
       references post;

    alter table role 
       add constraint FKb7pdjmsvxc5f6ie2m5a8hndj6 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKe7ncjx414ji5jbyinv3150p2w 
       foreign key (defined_society_id) 
       references defined_society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;

    alter table team_member 
       add constraint FKt5k957ydx0vngjtsljbelmu75 
       foreign key (member_id) 
       references member;

    alter table team_member 
       add constraint FK4plntb5fui8pch4tvi697a000 
       foreign key (role_id) 
       references role;

    alter table team_member 
       add constraint FK9hxcsx3v4hfaxlr3g66210emg 
       foreign key (society_id) 
       references society;

    alter table team_member 
       add constraint FK9ubp79ei4tv4crd0r9n7u5i6e 
       foreign key (team_id) 
       references team;

    create table app_user (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table comment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text varchar(255),
        event_id int8 not null,
        primary key (id)
    );

    create table defined_society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        end_date timestamp,
        end_time time,
        published boolean,
        reg_link TEXT,
        start_date timestamp,
        start_time time,
        sum_of_ratings int8,
        text TEXT,
        title varchar(255),
        total_ratings int8,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        society_id int8 not null,
        user_id int8 not null,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        role_id int8 not null,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table post_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        post_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        defined_society_id int8 not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table team (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        society_id int8 not null,
        primary key (id)
    );

    create table team_member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        member_id int8 not null,
        role_id int8,
        team_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        duration varchar(64),
        primary key (id)
    );

    alter table app_user 
       add constraint UKblwoswn8lymx57h1m37du2505 unique (code);

    alter table app_user 
       add constraint UK70fxrpev3vghcdjrw6m2fx37k unique (description);

    alter table app_user 
       add constraint UK1j9d9a06i600gd43uu3km82jw unique (email);

    alter table comment 
       add constraint UKa7id1kuyg95ydkx7vrc80v2g1 unique (code);

    alter table comment 
       add constraint UKsxco5i2vnerw5ngg3323j9sjo unique (description);

    alter table defined_society 
       add constraint UKiqqqedk4vbasw6hjvvu4h7m9s unique (code);

    alter table defined_society 
       add constraint UKbovne5rjq818l8hs1owgehylo unique (description);

    alter table event 
       add constraint UK7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table event 
       add constraint UKqxywheq0hkrkclejsv3o2qg4k unique (description);

    alter table event_attachment 
       add constraint UKsbk6uyhgsjrplnugpjg8ymblq unique (code);

    alter table event_attachment 
       add constraint UK6o6dmkptfsu84s2r72ic02t38 unique (description);

    alter table member 
       add constraint UK4khba0d7ikbnm1uilh1po0u0c unique (code);

    alter table member 
       add constraint UKdhm034jl4tiw9ssyqc6y5tw2x unique (description);

    alter table permission 
       add constraint UKa7ujv987la0i7a0o91ueevchc unique (code);

    alter table permission 
       add constraint UKrackm46yf6r4xcaue8l6rt71n unique (description);

    alter table post 
       add constraint UKtojhbicb8m3fuo82limwdqlaj unique (code);

    alter table post 
       add constraint UKpwh7iy9o4qv751bn9mb25fa44 unique (description);

    alter table post_attachment 
       add constraint UKp1p6s8po5kdq1ygfsbqfgfl9j unique (code);

    alter table post_attachment 
       add constraint UKkk6jgy62f8kke10a1w8tfmw7w unique (description);

    alter table role 
       add constraint UKc36say97xydpmgigg38qv5l2p unique (code);

    alter table role 
       add constraint UK2tysw6t5feqb631yj4kdk99i5 unique (description);

    alter table society 
       add constraint UK1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society 
       add constraint UKitpi17vroukh9ijjg07y15gr0 unique (description);

    alter table team 
       add constraint UKrnln7n3qqo11sl7tkpkrqf78i unique (code);

    alter table team 
       add constraint UK1s1a5xfgscux09k2ae1l9tnal unique (description);

    alter table team_member 
       add constraint UKoguf5mbq9756ppu5et17yltna unique (code);

    alter table team_member 
       add constraint UKach13cbhrxyvyck7wlf2sepb6 unique (description);

    alter table tenure 
       add constraint UK13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table tenure 
       add constraint UKhv8k6cd19mimgfofkmb66n7ob unique (description);

    alter table comment 
       add constraint FKhr48nopy5aorw0ta1ii704tpu 
       foreign key (event_id) 
       references event;

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

    alter table permission 
       add constraint FKrvhjnns4bvlh4m1n97vb7vbar 
       foreign key (role_id) 
       references role;

    alter table post 
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table post_attachment 
       add constraint FKmof1y73w0oea4caub8rpkhlmi 
       foreign key (post_id) 
       references post;

    alter table role 
       add constraint FKb7pdjmsvxc5f6ie2m5a8hndj6 
       foreign key (society_id) 
       references society;

    alter table society 
       add constraint FKe7ncjx414ji5jbyinv3150p2w 
       foreign key (defined_society_id) 
       references defined_society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;

    alter table team 
       add constraint FKbdb6e85gu1abc8a24nblh1n8x 
       foreign key (society_id) 
       references society;

    alter table team_member 
       add constraint FKt5k957ydx0vngjtsljbelmu75 
       foreign key (member_id) 
       references member;

    alter table team_member 
       add constraint FK4plntb5fui8pch4tvi697a000 
       foreign key (role_id) 
       references role;

    alter table team_member 
       add constraint FK9ubp79ei4tv4crd0r9n7u5i6e 
       foreign key (team_id) 
       references team;

    create table app_user (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table comment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text varchar(255),
        event_id int8 not null,
        primary key (id)
    );

    create table defined_society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        end_date timestamp,
        end_time time,
        published boolean,
        reg_link TEXT,
        start_date timestamp,
        start_time time,
        sum_of_ratings int8,
        text TEXT,
        title varchar(255),
        total_ratings int8,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        society_id int8 not null,
        user_id int8 not null,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table post_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        post_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table role_permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        permission_id int8 not null,
        role_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        defined_society_id int8 not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table team (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        society_id int8 not null,
        primary key (id)
    );

    create table team_member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        member_id int8 not null,
        role_id int8,
        team_id int8 not null,
        primary key (id)
    );

    create table team_permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        permission_id int8 not null,
        team_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        duration varchar(64),
        primary key (id)
    );

    alter table app_user 
       add constraint UKblwoswn8lymx57h1m37du2505 unique (code);

    alter table app_user 
       add constraint UK70fxrpev3vghcdjrw6m2fx37k unique (description);

    alter table app_user 
       add constraint UK1j9d9a06i600gd43uu3km82jw unique (email);

    alter table comment 
       add constraint UKa7id1kuyg95ydkx7vrc80v2g1 unique (code);

    alter table comment 
       add constraint UKsxco5i2vnerw5ngg3323j9sjo unique (description);

    alter table defined_society 
       add constraint UKiqqqedk4vbasw6hjvvu4h7m9s unique (code);

    alter table defined_society 
       add constraint UKbovne5rjq818l8hs1owgehylo unique (description);

    alter table event 
       add constraint UK7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table event 
       add constraint UKqxywheq0hkrkclejsv3o2qg4k unique (description);

    alter table event_attachment 
       add constraint UKsbk6uyhgsjrplnugpjg8ymblq unique (code);

    alter table event_attachment 
       add constraint UK6o6dmkptfsu84s2r72ic02t38 unique (description);

    alter table member 
       add constraint UK4khba0d7ikbnm1uilh1po0u0c unique (code);

    alter table member 
       add constraint UKdhm034jl4tiw9ssyqc6y5tw2x unique (description);

    alter table permission 
       add constraint UKa7ujv987la0i7a0o91ueevchc unique (code);

    alter table permission 
       add constraint UKrackm46yf6r4xcaue8l6rt71n unique (description);

    alter table post 
       add constraint UKtojhbicb8m3fuo82limwdqlaj unique (code);

    alter table post 
       add constraint UKpwh7iy9o4qv751bn9mb25fa44 unique (description);

    alter table post_attachment 
       add constraint UKp1p6s8po5kdq1ygfsbqfgfl9j unique (code);

    alter table post_attachment 
       add constraint UKkk6jgy62f8kke10a1w8tfmw7w unique (description);

    alter table role 
       add constraint UKc36say97xydpmgigg38qv5l2p unique (code);

    alter table role 
       add constraint UK2tysw6t5feqb631yj4kdk99i5 unique (description);

    alter table role_permission 
       add constraint UKwmmboc0u0ea8oj2waepbohc7 unique (code);

    alter table role_permission 
       add constraint UKhp8vcag4u2bctxva8sylhglq4 unique (description);

    alter table society 
       add constraint UK1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society 
       add constraint UKitpi17vroukh9ijjg07y15gr0 unique (description);

    alter table team 
       add constraint UKrnln7n3qqo11sl7tkpkrqf78i unique (code);

    alter table team 
       add constraint UK1s1a5xfgscux09k2ae1l9tnal unique (description);

    alter table team_member 
       add constraint UKoguf5mbq9756ppu5et17yltna unique (code);

    alter table team_member 
       add constraint UKach13cbhrxyvyck7wlf2sepb6 unique (description);

    alter table team_permission 
       add constraint UK6ttvyyjgmheygn759cgyrgt79 unique (code);

    alter table team_permission 
       add constraint UK9u23l2gd1uh85a80o08u376ak unique (description);

    alter table tenure 
       add constraint UK13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table tenure 
       add constraint UKhv8k6cd19mimgfofkmb66n7ob unique (description);

    alter table comment 
       add constraint FKhr48nopy5aorw0ta1ii704tpu 
       foreign key (event_id) 
       references event;

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
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table post_attachment 
       add constraint FKmof1y73w0oea4caub8rpkhlmi 
       foreign key (post_id) 
       references post;

    alter table role 
       add constraint FKb7pdjmsvxc5f6ie2m5a8hndj6 
       foreign key (society_id) 
       references society;

    alter table role_permission 
       add constraint FKf8yllw1ecvwqy3ehyxawqa1qp 
       foreign key (permission_id) 
       references permission;

    alter table role_permission 
       add constraint FKa6jx8n8xkesmjmv6jqug6bg68 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKe7ncjx414ji5jbyinv3150p2w 
       foreign key (defined_society_id) 
       references defined_society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;

    alter table team 
       add constraint FKbdb6e85gu1abc8a24nblh1n8x 
       foreign key (society_id) 
       references society;

    alter table team_member 
       add constraint FKt5k957ydx0vngjtsljbelmu75 
       foreign key (member_id) 
       references member;

    alter table team_member 
       add constraint FK4plntb5fui8pch4tvi697a000 
       foreign key (role_id) 
       references role;

    alter table team_member 
       add constraint FK9ubp79ei4tv4crd0r9n7u5i6e 
       foreign key (team_id) 
       references team;

    alter table team_permission 
       add constraint FKl376v9idcbmdd2o3wci7y8hak 
       foreign key (permission_id) 
       references permission;

    alter table team_permission 
       add constraint FK68mlqm85qgg5s2puxpu7e7ppr 
       foreign key (team_id) 
       references team;

    create table app_user (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        primary key (id)
    );

    create table comment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text varchar(255),
        event_id int8 not null,
        primary key (id)
    );

    create table defined_society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        primary key (id)
    );

    create table event (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        end_date timestamp,
        end_time time,
        published boolean,
        reg_link TEXT,
        start_date timestamp,
        start_time time,
        sum_of_ratings int8,
        text TEXT,
        title varchar(255),
        total_ratings int8,
        society_id int8 not null,
        primary key (id)
    );

    create table event_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        society_id int8 not null,
        user_id int8 not null,
        primary key (id)
    );

    create table permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        primary key (id)
    );

    create table post (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        text TEXT,
        event_id int8 not null,
        primary key (id)
    );

    create table post_attachment (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        link TEXT,
        post_id int8 not null,
        primary key (id)
    );

    create table role (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255),
        society_id int8 not null,
        primary key (id)
    );

    create table role_permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        permission_id int8 not null,
        role_id int8 not null,
        primary key (id)
    );

    create table society (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        defined_society_id int8 not null,
        tenure_id int8 not null,
        primary key (id)
    );

    create table team (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        title varchar(255) not null,
        society_id int8 not null,
        primary key (id)
    );

    create table team_member (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        member_id int8 not null,
        role_id int8,
        team_id int8 not null,
        primary key (id)
    );

    create table team_message (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        sent_at timestamp,
        text TEXT,
        sender_id int8 not null,
        primary key (id)
    );

    create table team_permission (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        permission_id int8 not null,
        team_id int8 not null,
        primary key (id)
    );

    create table tenure (
       id  bigserial not null,
        code varchar(255) not null,
        description varchar(255),
        duration varchar(64),
        primary key (id)
    );

    alter table app_user 
       add constraint UKblwoswn8lymx57h1m37du2505 unique (code);

    alter table app_user 
       add constraint UK70fxrpev3vghcdjrw6m2fx37k unique (description);

    alter table app_user 
       add constraint UK1j9d9a06i600gd43uu3km82jw unique (email);

    alter table comment 
       add constraint UKa7id1kuyg95ydkx7vrc80v2g1 unique (code);

    alter table comment 
       add constraint UKsxco5i2vnerw5ngg3323j9sjo unique (description);

    alter table defined_society 
       add constraint UKiqqqedk4vbasw6hjvvu4h7m9s unique (code);

    alter table defined_society 
       add constraint UKbovne5rjq818l8hs1owgehylo unique (description);

    alter table event 
       add constraint UK7a0yrbljlpa8wfiere2aj6c9d unique (code);

    alter table event 
       add constraint UKqxywheq0hkrkclejsv3o2qg4k unique (description);

    alter table event_attachment 
       add constraint UKsbk6uyhgsjrplnugpjg8ymblq unique (code);

    alter table event_attachment 
       add constraint UK6o6dmkptfsu84s2r72ic02t38 unique (description);

    alter table member 
       add constraint UK4khba0d7ikbnm1uilh1po0u0c unique (code);

    alter table member 
       add constraint UKdhm034jl4tiw9ssyqc6y5tw2x unique (description);

    alter table permission 
       add constraint UKa7ujv987la0i7a0o91ueevchc unique (code);

    alter table permission 
       add constraint UKrackm46yf6r4xcaue8l6rt71n unique (description);

    alter table post 
       add constraint UKtojhbicb8m3fuo82limwdqlaj unique (code);

    alter table post 
       add constraint UKpwh7iy9o4qv751bn9mb25fa44 unique (description);

    alter table post_attachment 
       add constraint UKp1p6s8po5kdq1ygfsbqfgfl9j unique (code);

    alter table post_attachment 
       add constraint UKkk6jgy62f8kke10a1w8tfmw7w unique (description);

    alter table role 
       add constraint UKc36say97xydpmgigg38qv5l2p unique (code);

    alter table role 
       add constraint UK2tysw6t5feqb631yj4kdk99i5 unique (description);

    alter table role_permission 
       add constraint UKwmmboc0u0ea8oj2waepbohc7 unique (code);

    alter table role_permission 
       add constraint UKhp8vcag4u2bctxva8sylhglq4 unique (description);

    alter table society 
       add constraint UK1w88acmyl4hl43nbhryps5dsl unique (code);

    alter table society 
       add constraint UKitpi17vroukh9ijjg07y15gr0 unique (description);

    alter table team 
       add constraint UKrnln7n3qqo11sl7tkpkrqf78i unique (code);

    alter table team 
       add constraint UK1s1a5xfgscux09k2ae1l9tnal unique (description);

    alter table team_member 
       add constraint UKoguf5mbq9756ppu5et17yltna unique (code);

    alter table team_member 
       add constraint UKach13cbhrxyvyck7wlf2sepb6 unique (description);

    alter table team_message 
       add constraint UK35trhf2j4yb04uwfa4ky8l0vv unique (code);

    alter table team_message 
       add constraint UK1ucpsap59apvvopaiucwrrrmi unique (description);

    alter table team_permission 
       add constraint UK6ttvyyjgmheygn759cgyrgt79 unique (code);

    alter table team_permission 
       add constraint UK9u23l2gd1uh85a80o08u376ak unique (description);

    alter table tenure 
       add constraint UK13qxpposc3gd1ej7vo2grmcx unique (code);

    alter table tenure 
       add constraint UKhv8k6cd19mimgfofkmb66n7ob unique (description);

    alter table comment 
       add constraint FKhr48nopy5aorw0ta1ii704tpu 
       foreign key (event_id) 
       references event;

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
       add constraint FK3v4llf5c3wukq0k29f522erpe 
       foreign key (event_id) 
       references event;

    alter table post_attachment 
       add constraint FKmof1y73w0oea4caub8rpkhlmi 
       foreign key (post_id) 
       references post;

    alter table role 
       add constraint FKb7pdjmsvxc5f6ie2m5a8hndj6 
       foreign key (society_id) 
       references society;

    alter table role_permission 
       add constraint FKf8yllw1ecvwqy3ehyxawqa1qp 
       foreign key (permission_id) 
       references permission;

    alter table role_permission 
       add constraint FKa6jx8n8xkesmjmv6jqug6bg68 
       foreign key (role_id) 
       references role;

    alter table society 
       add constraint FKe7ncjx414ji5jbyinv3150p2w 
       foreign key (defined_society_id) 
       references defined_society;

    alter table society 
       add constraint FKl6oqyrk514hn9hfhes7n06stx 
       foreign key (tenure_id) 
       references tenure;

    alter table team 
       add constraint FKbdb6e85gu1abc8a24nblh1n8x 
       foreign key (society_id) 
       references society;

    alter table team_member 
       add constraint FKt5k957ydx0vngjtsljbelmu75 
       foreign key (member_id) 
       references member;

    alter table team_member 
       add constraint FK4plntb5fui8pch4tvi697a000 
       foreign key (role_id) 
       references role;

    alter table team_member 
       add constraint FK9ubp79ei4tv4crd0r9n7u5i6e 
       foreign key (team_id) 
       references team;

    alter table team_message 
       add constraint FK50juii8luhos75tsvosebgaot 
       foreign key (sender_id) 
       references team_member;

    alter table team_permission 
       add constraint FKl376v9idcbmdd2o3wci7y8hak 
       foreign key (permission_id) 
       references permission;

    alter table team_permission 
       add constraint FK68mlqm85qgg5s2puxpu7e7ppr 
       foreign key (team_id) 
       references team;
