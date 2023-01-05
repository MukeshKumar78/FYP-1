INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_CREATE', 'permission to create event', 'EVENT', 'CREATE');
INSERT INTO permission (code, description, target, permission) VALUES ('EVENT_READ', 'permission to read society events', 'EVENT', 'READ');
INSERT INTO role (code, description, name) VALUES ('HEAD', 'highest role', 'head');
INSERT INTO roles_permissions (permission_id, role_id) VALUES (1, 1);
INSERT INTO roles_permissions (permission_id, role_id) VALUES (2, 1);
