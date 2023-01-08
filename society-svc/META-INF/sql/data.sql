INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('John', 'Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO app_user (first_name, last_name, email, photo) VALUES ('Mohsin', 'Shaikh', 'mohsinshk4026@gmail.com', 'https://picsum.photos/201');
INSERT INTO tenure (code, description, duration) VALUES ('spring-2023', 'spring 2023', 'Spring 2023');
INSERT INTO society (code, title, description, image, tenure_id, created_at) VALUES ('test', 'a society for test', 'https://picsum.photos/500', 'Test', 1, '2023-01-01 00:00:01-00');
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 2);
INSERT INTO event (code, description, title, text, member_id, created_at, start_date, end_date, published, published_at, registration_link, society_id) VALUES ('test-event', 'test-event', 'Test Event', 'This is a test Event', 1,'2023-01-01 18:00:20-05', '2023-01-01 19:10:25-07', '2023-01-01 20:00:00-00', false, '2023-01-01 21:00:00-00', '/', 1);

