-- Ek dev/test fixture — user id 8 ("seller 2") ko already-approved seller banaya, taaki seller-side
-- features test kiye ja sakein bina poore apply->approve flow se manually guzre. productId=225
-- inventory-service mein already banaya + activate kiya hua "Boat Rockerz 450" product hai.
INSERT INTO seller_profiles (user_id, store_name, business_name, business_type, business_email,
    business_phone, sells_only_books, registration_number, pan_number, bank_account_holder_name,
    bank_account_number, ifsc_code, pickup_address_line1, pickup_address_line2, pickup_city,
    pickup_state, pickup_pincode, product_id, status, rejection_reason, applied_at, reviewed_at)
VALUES (8, 'Seller2 Gadget Hub', 'Seller2 Enterprises', 'PROPRIETORSHIP', 'seller2@shopease.net',
    '9876500002', FALSE, NULL, 'ABCPE1234F', 'Seller Two', '11122233344', 'HDFC0001234',
    'MG Road', 'Near City Mall', 'Bengaluru', 'Karnataka', '560001', 225, 'APPROVED', NULL,
    DATE_SUB(NOW(), INTERVAL 2 DAY), NOW());

INSERT INTO seller_profile_categories (seller_profile_id, category) VALUES (LAST_INSERT_ID(), 'Electronic');
