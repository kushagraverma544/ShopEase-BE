ALTER TABLE users
    ADD COLUMN keycloak_id VARCHAR(64) NULL,
    ADD COLUMN gender VARCHAR(20) NULL,
    ADD COLUMN date_of_birth DATE NULL,
    ADD COLUMN preferred_language VARCHAR(50) NULL,
    ADD COLUMN mobile_number VARCHAR(20) NULL,
    ADD COLUMN alternate_number VARCHAR(20) NULL,
    ADD COLUMN email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN mobile_verified BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN otp_login_enabled BOOLEAN NOT NULL DEFAULT FALSE,
    ADD CONSTRAINT uk_users_keycloak_id UNIQUE (keycloak_id);
