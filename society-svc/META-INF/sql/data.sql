INSERT INTO app_user (name, email, photo) VALUES ('John Doe', 'yeah', 'https://picsum.photos/200');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO member (role, society_id, user_id) VALUES ('HEAD', 1, 1);
