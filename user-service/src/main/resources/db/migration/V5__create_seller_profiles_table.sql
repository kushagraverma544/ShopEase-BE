CREATE TABLE seller_profiles (
    id BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    store_name VARCHAR(150) NOT NULL,
    business_name VARCHAR(150) NOT NULL,
    business_type VARCHAR(30) NOT NULL,
    business_email VARCHAR(150) NOT NULL,
    business_phone VARCHAR(20) NOT NULL,
    sells_only_books BOOLEAN NOT NULL DEFAULT FALSE,
    registration_number VARCHAR(50) NULL,
    pan_number VARCHAR(20) NOT NULL,
    bank_account_holder_name VARCHAR(150) NOT NULL,
    bank_account_number VARCHAR(30) NOT NULL,
    ifsc_code VARCHAR(15) NOT NULL,
    pickup_address_line1 VARCHAR(255) NOT NULL,
    pickup_address_line2 VARCHAR(255) NULL,
    pickup_city VARCHAR(100) NOT NULL,
    pickup_state VARCHAR(100) NOT NULL,
    pickup_pincode VARCHAR(10) NOT NULL,
    product_id BIGINT NULL,
    status VARCHAR(20) NOT NULL,
    rejection_reason VARCHAR(500) NULL,
    applied_at DATETIME NOT NULL,
    reviewed_at DATETIME NULL,
    CONSTRAINT pk_seller_profiles PRIMARY KEY (id),
    CONSTRAINT fk_seller_profiles_user FOREIGN KEY (user_id) REFERENCES users (id)
) ENGINE = InnoDB;

CREATE INDEX idx_seller_profiles_user_id ON seller_profiles (user_id);
CREATE INDEX idx_seller_profiles_status ON seller_profiles (status);

CREATE TABLE seller_profile_categories (
    seller_profile_id BIGINT NOT NULL,
    category VARCHAR(100) NOT NULL,
    CONSTRAINT fk_seller_profile_categories FOREIGN KEY (seller_profile_id) REFERENCES seller_profiles (id)
) ENGINE = InnoDB;
