INSERT INTO app_user (code, first_name, last_name, email, photo) VALUES ('k191308@nu.edu.pk', 'K191308', 'Mohsin Shaikh', 'k191308@nu.edu.com', 'https://lh3.googleusercontent.com/a/AEdFTp7LUjuE26V7xi7ZqeTsUHCInWG-GSUCKDNkfCo-=s96-c');
INSERT INTO app_user (code, first_name, last_name, email, photo) VALUES ('k190251@nu.edu.pk', 'K190251', 'Mukesh Kumar', 'k190251@nu.edu.pk', 'https://picsum.photos/201');
INSERT INTO app_user (code, first_name, last_name, email, photo) VALUES ('k190127@nu.edu.pk', 'K190127', 'Rooman Asif', 'k190127@nu.edu.pk', 'https://picsum.photos/202');
INSERT INTO tenure (code, description, duration, archived, created_at) VALUES ('spring-2023', 'spring 2023', 'Spring 2023', false, '2023-01-01 18:00:20-05');
INSERT INTO base_society (code, name, full_name, description, image, created_at) VALUES ('test', 'TS', 'Test Society', 'a society for testing', 'TEST_BS_1.jpg', '2023-01-01 00:00:01-00');
INSERT INTO base_society (code, name, full_name, description, image, created_at) VALUES ('test2', 'TS2', 'Test Society 2', 'another society for testing', 'TEST_BS_1.jpg', '2023-03-01 00:00:01-00');
INSERT INTO society (code, name, full_name, description, image, tenure_id, base_id, created_at) VALUES ('test-spring-2023', 'TS', 'Test Society', 'a society for testing', 'TEST_S_1.jpg', 1, 1, '2023-01-01 00:00:01-00');
INSERT INTO society (code, name, full_name, description, image, tenure_id, base_id, created_at) VALUES ('test2-spring-2023', 'TS2', 'Test Society 2', 'another society for testing', 'TEST_S_1.jpg', 1, 2, '2023-03-02 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 3);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event-1', 'test-event-1', 'Test Event 1', 'This is a test Event', 1, '2023-01-01 18:00:20-05', '2023-02-01 19:10:25-07', '2023-02-03 20:00:00-00', true, '2023-02-04 20:00:00-00', '/', 1);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event-2', 'test-event-2', 'Test Event 2', 'This is an unpublished test Event', 1, '2023-01-01 18:00:20-05', '2023-02-01 19:10:25-07', '2023-02-03 20:00:00-00', false, null, '/', 1);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test2-event-1', 'test2-event-1', 'Test2 Event 1', 'This is a published test2 Event', 1, '2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', true, '2023-01-01 21:00:00-00', '/', 2);
INSERT INTO event (code, description, title, text, user_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test2-event-1', 'test2-event-2', 'Test2 Event 2', 'This is an unpublished test2 Event', 1, '2023-03-03 18:00:20-05', '2023-04-02 19:10:25-07', '2023-04-03 20:00:00-00', false, null, '/', 2);
INSERT INTO event_attachment (uri, event_id) VALUES ('TEST_EA_1.jpg', 1);
INSERT INTO post (code, description, title, text, created_at, user_id, event_id) VALUES ('test-post', 'test-post', 'Test Post', 'This is a test Post', '2023-02-05 00:00:01-00', 1, 1);
INSERT INTO post_attachment (uri, post_id) VALUES ('TEST_PA_1.jpg', 1);
