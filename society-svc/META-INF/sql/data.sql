INSERT INTO society_user (name, email, photo) VALUES ('John Doe', 'yeah', 'nope');
INSERT INTO tenure (code, duration) VALUES ('spring', 'Spring');
INSERT INTO society (code, title, tenure_id) VALUES ('test', 'Test', 1);
INSERT INTO permission (code) VALUES ('EVENTS_WRITE');
INSERT INTO role (code, name) VALUES ('mod', 'Mod');
INSERT INTO roles_permissions (role_id, permission_id) VALUES (1, 1);
INSERT INTO member (role_id, society_id, user_id) VALUES (1, 1, 1);
