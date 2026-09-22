CREATE TABLE seller_application_history (
    id BIGINT NOT NULL AUTO_INCREMENT,
    seller_profile_id BIGINT NOT NULL,
    from_status VARCHAR(20) NULL,
    to_status VARCHAR(20) NOT NULL,
    remark VARCHAR(500) NULL,
    actor VARCHAR(10) NOT NULL,
    occurred_at DATETIME NOT NULL,
    CONSTRAINT pk_seller_application_history PRIMARY KEY (id),
    CONSTRAINT fk_seller_application_history_profile FOREIGN KEY (seller_profile_id) REFERENCES seller_profiles (id)
) ENGINE = InnoDB;

CREATE INDEX idx_seller_application_history_profile_id ON seller_application_history (seller_profile_id);
