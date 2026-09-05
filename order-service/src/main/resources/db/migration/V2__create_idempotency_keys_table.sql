CREATE TABLE idempotency_keys (
    id BIGINT NOT NULL AUTO_INCREMENT,
    idempotency_key VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL,
    response_body TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_idempotency_keys PRIMARY KEY (id),
    CONSTRAINT uk_idempotency_keys_key UNIQUE (idempotency_key)
) ENGINE = InnoDB;
