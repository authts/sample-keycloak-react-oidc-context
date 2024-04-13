TRUNCATE TABLE realm_smtp_config;

INSERT INTO realm_smtp_config (realm_id, name, value)
VALUES ('sample-realm', 'starttls', ''),
       ('sample-realm', 'auth', ''),
       ('sample-realm', 'ssl', ''),
       ('sample-realm', 'host', 'mailhog'),
       ('sample-realm', 'port', '1025'),
       ('sample-realm', 'from', 'no-reply@sample.com'),
       ('sample-realm', 'fromDisplayName', 'no-reply@sample.com');

SELECT *
FROM realm_smtp_config;
