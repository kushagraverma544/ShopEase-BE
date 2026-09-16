-- DummyJSON ke pehle 30 products (id 1-30) ka one-time seed — seller_id NULL aur active TRUE,
-- taaki platform ka starter/demo catalog turant browse-able ho, real seller-owned inventory se
-- clearly alag rahe (seller-applied products ka seller_id set hoga aur apply-time pe active FALSE).
-- Explicit product ids hardcode nahi kiye — table pehle se non-empty ho sakti hai (manual testing),
-- isliye har INSERT ke baad LAST_INSERT_ID() se hi uske tags jode hain.

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Essence Mascara Lash Princess', 'Essence', 'beauty', 'The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.', 9.99, 10.48, 99, 48, 'BEA-ESS-ESS-001', 4, 15.14, 13.08, 22.99, '1 week warranty', 'Ships in 3-5 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beauty'), (LAST_INSERT_ID(), 'mascara');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Eyeshadow Palette with Mirror', 'Glamour Beauty', 'beauty', 'The Eyeshadow Palette with Mirror offers a versatile range of eyeshadow shades for creating stunning eye looks. With a built-in mirror, it''s convenient for on-the-go makeup application.', 19.99, 18.19, 34, 20, 'BEA-GLA-EYE-002', 9, 9.26, 22.47, 27.67, '1 year warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beauty'), (LAST_INSERT_ID(), 'eyeshadow');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Powder Canister', 'Velvet Touch', 'beauty', 'The Powder Canister is a finely milled setting powder designed to set makeup and control shine. With a lightweight and translucent formula, it provides a smooth and matte finish.', 14.99, 9.84, 89, 22, 'BEA-VEL-POW-003', 8, 29.27, 27.93, 20.59, '3 months warranty', 'Ships in 1-2 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beauty'), (LAST_INSERT_ID(), 'face powder');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Red Lipstick', 'Chic Cosmetics', 'beauty', 'The Red Lipstick is a classic and bold choice for adding a pop of color to your lips. With a creamy and pigmented formula, it provides a vibrant and long-lasting finish.', 12.99, 12.16, 91, 40, 'BEA-CHI-LIP-004', 1, 18.11, 28.38, 22.17, '3 year warranty', 'Ships in 1 week', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beauty'), (LAST_INSERT_ID(), 'lipstick');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Red Nail Polish', 'Nail Couture', 'beauty', 'The Red Nail Polish offers a rich and glossy red hue for vibrant and polished nails. With a quick-drying formula, it provides a salon-quality finish at home.', 8.99, 11.44, 79, 22, 'BEA-NAI-NAI-005', 8, 21.63, 16.48, 29.84, '1 month warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beauty'), (LAST_INSERT_ID(), 'nail polish');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Calvin Klein CK One', 'Calvin Klein', 'fragrances', 'CK One by Calvin Klein is a classic unisex fragrance, known for its fresh and clean scent. It''s a versatile fragrance suitable for everyday wear.', 49.99, 1.89, 29, 9, 'FRA-CAL-CAL-006', 7, 29.36, 27.76, 20.72, '1 week warranty', 'Ships overnight', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fragrances'), (LAST_INSERT_ID(), 'perfumes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Chanel Coco Noir Eau De', 'Chanel', 'fragrances', 'Coco Noir by Chanel is an elegant and mysterious fragrance, featuring notes of grapefruit, rose, and sandalwood. Perfect for evening occasions.', 129.99, 16.51, 58, 1, 'FRA-CHA-CHA-007', 7, 24.5, 25.7, 25.98, '3 year warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fragrances'), (LAST_INSERT_ID(), 'perfumes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Dior J''adore', 'Dior', 'fragrances', 'J''adore by Dior is a luxurious and floral fragrance, known for its blend of ylang-ylang, rose, and jasmine. It embodies femininity and sophistication.', 89.99, 14.72, 98, 10, 'FRA-DIO-DIO-008', 4, 27.67, 28.28, 11.83, '1 week warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fragrances'), (LAST_INSERT_ID(), 'perfumes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Dolce Shine Eau de', 'Dolce & Gabbana', 'fragrances', 'Dolce Shine by Dolce & Gabbana is a vibrant and fruity fragrance, featuring notes of mango, jasmine, and blonde woods. It''s a joyful and youthful scent.', 69.99, 0.62, 4, 2, 'FRA-DOL-DOL-009', 6, 27.28, 29.88, 18.3, '3 year warranty', 'Ships in 1 month', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fragrances'), (LAST_INSERT_ID(), 'perfumes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Gucci Bloom Eau de', 'Gucci', 'fragrances', 'Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It''s a modern and romantic scent.', 79.99, 14.39, 91, 2, 'FRA-GUC-GUC-010', 7, 20.92, 21.68, 11.2, '6 months warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fragrances'), (LAST_INSERT_ID(), 'perfumes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Annibale Colombo Bed', 'Annibale Colombo', 'furniture', 'The Annibale Colombo Bed is a luxurious and elegant bed frame, crafted with high-quality materials for a comfortable and stylish bedroom.', 1899.99, 8.57, 88, 1, 'FUR-ANN-ANN-011', 10, 28.16, 25.36, 17.28, '1 year warranty', 'Ships in 1 month', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'furniture'), (LAST_INSERT_ID(), 'beds');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Annibale Colombo Sofa', 'Annibale Colombo', 'furniture', 'The Annibale Colombo Sofa is a sophisticated and comfortable seating option, featuring exquisite design and premium upholstery for your living room.', 2499.99, 14.4, 60, 1, 'FUR-ANN-ANN-012', 6, 12.75, 20.55, 19.06, 'Lifetime warranty', 'Ships in 1 week', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'furniture'), (LAST_INSERT_ID(), 'sofas');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Bedside Table African Cherry', 'Furniture Co.', 'furniture', 'The Bedside Table in African Cherry is a stylish and functional addition to your bedroom, providing convenient storage space and a touch of elegance.', 299.99, 19.09, 64, 3, 'FUR-FUR-BED-013', 2, 13.47, 24.99, 27.35, '5 year warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'furniture'), (LAST_INSERT_ID(), 'bedside tables');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Knoll Saarinen Executive Conference Chair', 'Knoll', 'furniture', 'The Knoll Saarinen Executive Conference Chair is a modern and ergonomic chair, perfect for your office or conference room with its timeless design.', 499.99, 2.01, 26, 5, 'FUR-KNO-KNO-014', 10, 13.81, 7.5, 5.62, '2 year warranty', 'Ships overnight', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'furniture'), (LAST_INSERT_ID(), 'office chairs');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Wooden Bathroom Sink With Mirror', 'Bath Trends', 'furniture', 'The Wooden Bathroom Sink with Mirror is a unique and stylish addition to your bathroom, featuring a wooden sink countertop and a matching mirror.', 799.99, 8.8, 7, 2, 'FUR-BAT-WOO-015', 10, 7.98, 8.88, 28.46, '3 year warranty', 'Ships in 3-5 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'furniture'), (LAST_INSERT_ID(), 'bathroom');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple', NULL, 'groceries', 'Fresh and crisp apples, perfect for snacking or incorporating into various recipes.', 1.99, 12.62, 8, 7, 'GRO-BRD-APP-016', 9, 13.66, 11.01, 9.73, '3 year warranty', 'Ships in 2 weeks', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fruits');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Beef Steak', NULL, 'groceries', 'High-quality beef steak, great for grilling or cooking to your preferred level of doneness.', 12.99, 9.61, 86, 43, 'GRO-BRD-BEE-017', 10, 18.9, 5.77, 18.57, '3 year warranty', 'Ships overnight', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'meat');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Cat Food', NULL, 'groceries', 'Nutritious cat food formulated to meet the dietary needs of your feline friend.', 8.99, 9.58, 46, 18, 'GRO-BRD-FOO-018', 10, 18.08, 9.26, 21.86, '1 year warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'pet supplies'), (LAST_INSERT_ID(), 'cat food');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Chicken Meat', NULL, 'groceries', 'Fresh and tender chicken meat, suitable for various culinary preparations.', 9.99, 13.7, 97, 22, 'GRO-BRD-CHI-019', 1, 11.03, 22.11, 16.01, '1 year warranty', 'Ships in 1 month', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'meat');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Cooking Oil', NULL, 'groceries', 'Versatile cooking oil suitable for frying, sauteing, and various culinary applications.', 4.99, 9.33, 10, 46, 'GRO-BRD-COO-020', 5, 19.95, 27.54, 24.86, 'Lifetime warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'cooking essentials');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Cucumber', NULL, 'groceries', 'Crisp and hydrating cucumbers, ideal for salads, snacks, or as a refreshing side.', 1.49, 0.16, 84, 2, 'GRO-BRD-CUC-021', 4, 12.8, 28.38, 21.34, '2 year warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'vegetables');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Dog Food', NULL, 'groceries', 'Specially formulated dog food designed to provide essential nutrients for your canine companion.', 10.99, 10.27, 71, 43, 'GRO-BRD-FOO-022', 10, 16.93, 27.15, 9.29, 'No warranty', 'Ships in 1-2 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'pet supplies'), (LAST_INSERT_ID(), 'dog food');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Eggs', NULL, 'groceries', 'Fresh eggs, a versatile ingredient for baking, cooking, or breakfast.', 2.99, 11.05, 9, 32, 'GRO-BRD-EGG-023', 2, 11.42, 7.44, 16.95, '1 week warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'dairy');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Fish Steak', NULL, 'groceries', 'Quality fish steak, suitable for grilling, baking, or pan-searing.', 14.99, 4.23, 74, 50, 'GRO-BRD-FIS-024', 6, 14.95, 26.31, 11.27, '1 month warranty', 'Ships in 3-5 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'seafood');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Green Bell Pepper', NULL, 'groceries', 'Fresh and vibrant green bell pepper, perfect for adding color and flavor to your dishes.', 1.29, 0.16, 33, 12, 'GRO-BRD-GRE-025', 2, 15.33, 26.65, 14.44, '1 month warranty', 'Ships in 1 week', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'vegetables');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Green Chili Pepper', NULL, 'groceries', 'Spicy green chili pepper, ideal for adding heat to your favorite recipes.', 0.99, 1, 3, 39, 'GRO-BRD-GRE-026', 7, 15.38, 18.12, 19.92, '2 year warranty', 'Ships in 1 week', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'vegetables');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Honey Jar', NULL, 'groceries', 'Pure and natural honey in a convenient jar, perfect for sweetening beverages or drizzling over food.', 6.99, 14.4, 34, 47, 'GRO-BRD-HON-027', 2, 9.28, 21.72, 17.74, '1 month warranty', 'Ships in 1-2 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'condiments');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Ice Cream', NULL, 'groceries', 'Creamy and delicious ice cream, available in various flavors for a delightful treat.', 5.49, 8.69, 27, 42, 'GRO-BRD-CRE-028', 1, 14.83, 15.07, 24.2, '1 month warranty', 'Ships in 2 weeks', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'desserts');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Juice', NULL, 'groceries', 'Refreshing fruit juice, packed with vitamins and great for staying hydrated.', 3.99, 12.06, 50, 25, 'GRO-BRD-JUI-029', 1, 18.56, 21.46, 28.02, '6 months warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beverages');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Kiwi', NULL, 'groceries', 'Nutrient-rich kiwi, perfect for snacking or adding a tropical twist to your dishes.', 2.49, 15.22, 99, 30, 'GRO-BRD-KIW-030', 5, 19.4, 18.67, 17.13, '6 months warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fruits');
