TRUNCATE TABLE realm_smtp_config;

INSERT INTO realm_smtp_config (realm_id, name, value)
VALUES ('example-realm', 'starttls', ''),
       ('example-realm', 'auth', ''),
       ('example-realm', 'ssl', ''),
       ('example-realm', 'host', 'mailhog'),
       ('example-realm', 'port', '1025'),
       ('example-realm', 'from', 'no-reply@example.com'),
       ('example-realm', 'fromDisplayName', 'no-reply@example.com');

SELECT *
FROM realm_smtp_config;
