ALTER TABLE products
    ADD COLUMN seller_id BIGINT NULL,
    ADD COLUMN brand VARCHAR(100) NULL,
    ADD COLUMN category VARCHAR(100) NULL,
    ADD COLUMN description TEXT NULL,
    ADD COLUMN discount_percentage DECIMAL(5, 2) NULL,
    ADD COLUMN minimum_order_quantity INT NULL,
    ADD COLUMN sku VARCHAR(50) NULL,
    ADD COLUMN weight DOUBLE NULL,
    ADD COLUMN width DOUBLE NULL,
    ADD COLUMN height DOUBLE NULL,
    ADD COLUMN depth DOUBLE NULL,
    ADD COLUMN warranty_information VARCHAR(255) NULL,
    ADD COLUMN shipping_information VARCHAR(255) NULL,
    ADD COLUMN return_policy VARCHAR(255) NULL,
    ADD COLUMN active BOOLEAN NOT NULL DEFAULT FALSE;

CREATE INDEX idx_products_seller_id ON products (seller_id);

CREATE TABLE product_tags (
    product_id BIGINT NOT NULL,
    tag VARCHAR(50) NOT NULL,
    CONSTRAINT fk_product_tags_product FOREIGN KEY (product_id) REFERENCES products (id)
) ENGINE = InnoDB;
