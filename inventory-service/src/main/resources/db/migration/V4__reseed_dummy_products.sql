-- Replaces the V3 partial (30-product) seed with the complete DummyJSON catalog.
-- V3's rows are identified the same way they were created: seller_id IS NULL (no real
-- seller exists yet in this environment, so NULL unambiguously means "platform seed data").
DELETE FROM product_tags WHERE product_id IN (SELECT id FROM products WHERE seller_id IS NULL);
DELETE FROM products WHERE seller_id IS NULL;

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
VALUES (NULL, 'Cooking Oil', NULL, 'groceries', 'Versatile cooking oil suitable for frying, sautéing, and various culinary applications.', 4.99, 9.33, 10, 46, 'GRO-BRD-COO-020', 5, 19.95, 27.54, 24.86, 'Lifetime warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
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

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Lemon', NULL, 'groceries', 'Zesty and tangy lemons, versatile for cooking, baking, or making refreshing beverages.', 0.79, 9.7, 31, 29, 'GRO-BRD-LEM-031', 3, 23.77, 9.22, 12.05, 'No warranty', 'Ships in 1 month', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fruits');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Milk', NULL, 'groceries', 'Fresh and nutritious milk, a staple for various recipes and daily consumption.', 3.49, 13.74, 27, 5, 'GRO-BRD-MIL-032', 5, 12.92, 15.76, 11.29, '3 year warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'dairy');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Mulberry', NULL, 'groceries', 'Sweet and juicy mulberries, perfect for snacking or adding to desserts and cereals.', 4.99, 12.87, 99, 43, 'GRO-BRD-MUL-033', 5, 12.8, 18.54, 6.31, '2 year warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fruits');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Nescafe Coffee', NULL, 'groceries', 'Quality coffee from Nescafe, available in various blends for a rich and satisfying cup.', 7.99, 1.59, 57, 8, 'GRO-BRD-NES-034', 6, 20.54, 29.49, 29.2, '1 year warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beverages'), (LAST_INSERT_ID(), 'coffee');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Potatoes', NULL, 'groceries', 'Versatile and starchy potatoes, great for roasting, mashing, or as a side dish.', 2.29, 5.38, 13, 9, 'GRO-BRD-POT-035', 9, 22.65, 9.83, 21.75, '3 year warranty', 'Ships in 3-5 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'vegetables');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Protein Powder', NULL, 'groceries', 'Nutrient-packed protein powder, ideal for supplementing your diet with essential proteins.', 19.99, 7.59, 80, 6, 'GRO-BRD-PRO-036', 9, 9.01, 12.53, 22.35, '1 week warranty', 'Ships in 1 month', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'health supplements');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Red Onions', NULL, 'groceries', 'Flavorful and aromatic red onions, perfect for adding depth to your savory dishes.', 1.99, 9.9, 82, 8, 'GRO-BRD-ONI-037', 9, 16.01, 24.96, 12.74, '1 month warranty', 'Ships in 3-5 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'vegetables');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Rice', NULL, 'groceries', 'High-quality rice, a staple for various cuisines and a versatile base for many dishes.', 5.99, 9.29, 59, 20, 'GRO-BRD-RIC-038', 5, 17.21, 9.88, 17.16, '6 months warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'grains');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Soft Drinks', NULL, 'groceries', 'Assorted soft drinks in various flavors, perfect for refreshing beverages.', 1.99, 17.48, 53, 10, 'GRO-BRD-SOF-039', 9, 19.75, 6.79, 9.33, '6 months warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beverages');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Strawberry', NULL, 'groceries', 'Sweet and succulent strawberries, great for snacking, desserts, or blending into smoothies.', 3.99, 1.12, 46, 12, 'GRO-BRD-STR-040', 1, 28.18, 21.25, 28.54, '1 week warranty', 'Ships in 1-2 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fruits');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Tissue Paper Box', NULL, 'groceries', 'Convenient tissue paper box for everyday use, providing soft and absorbent tissues.', 2.49, 13.28, 86, 44, 'GRO-BRD-TIS-041', 1, 18.75, 17.58, 12.43, 'No warranty', 'Ships in 1-2 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'household essentials');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Water', NULL, 'groceries', 'Pure and refreshing bottled water, essential for staying hydrated throughout the day.', 0.99, 14.92, 53, 28, 'GRO-BRD-WAT-042', 4, 18.43, 7.4, 17.79, '3 months warranty', 'Ships in 1 month', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'beverages');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Decoration Swing', NULL, 'home-decoration', 'The Decoration Swing is a charming addition to your home decor. Crafted with intricate details, it adds a touch of elegance and whimsy to any room.', 59.99, 10.41, 47, 8, 'HOM-BRD-DEC-043', 4, 23.84, 15.19, 26.05, '1 week warranty', 'Ships in 1 month', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'home decor'), (LAST_INSERT_ID(), 'swing');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Family Tree Photo Frame', NULL, 'home-decoration', 'The Family Tree Photo Frame is a sentimental and stylish way to display your cherished family memories. With multiple photo slots, it tells the story of your loved ones.', 29.99, 14.87, 77, 15, 'HOM-BRD-FAM-044', 1, 17.27, 14.81, 29.11, '1 month warranty', 'Ships in 2 weeks', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'home decor'), (LAST_INSERT_ID(), 'photo frame');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'House Showpiece Plant', NULL, 'home-decoration', 'The House Showpiece Plant is an artificial plant that brings a touch of nature to your home without the need for maintenance. It adds greenery and style to any space.', 39.99, 7.46, 28, 3, 'HOM-BRD-HOU-045', 8, 8.55, 14.62, 17.25, '1 year warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'home decor'), (LAST_INSERT_ID(), 'artificial plants');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Plant Pot', NULL, 'home-decoration', 'The Plant Pot is a stylish container for your favorite plants. With a sleek design, it complements your indoor or outdoor garden, adding a modern touch to your plant display.', 14.99, 6.84, 59, 31, 'HOM-BRD-PLA-046', 9, 9.83, 20.28, 13.49, 'Lifetime warranty', 'Ships in 3-5 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'home decor'), (LAST_INSERT_ID(), 'plant accessories');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Table Lamp', NULL, 'home-decoration', 'The Table Lamp is a functional and decorative lighting solution for your living space. With a modern design, it provides both ambient and task lighting, enhancing the atmosphere.', 49.99, 7.09, 9, 2, 'HOM-BRD-TAB-047', 4, 8.98, 13.41, 5.65, '3 months warranty', 'Ships in 1-2 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'home decor'), (LAST_INSERT_ID(), 'lighting');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Bamboo Spatula', NULL, 'kitchen-accessories', 'The Bamboo Spatula is a versatile kitchen tool made from eco-friendly bamboo. Ideal for flipping, stirring, and serving various dishes.', 7.99, 2.84, 37, 29, 'KIT-BRD-BAM-048', 3, 21.32, 23.03, 25.94, '1 month warranty', 'Ships overnight', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'utensils');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Black Aluminium Cup', NULL, 'kitchen-accessories', 'The Black Aluminium Cup is a stylish and durable cup suitable for both hot and cold beverages. Its sleek black design adds a modern touch to your drinkware collection.', 5.99, 15.65, 75, 48, 'KIT-BRD-BLA-049', 7, 5.88, 5.11, 10.03, '1 year warranty', 'Ships overnight', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'drinkware'), (LAST_INSERT_ID(), 'cups');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Black Whisk', NULL, 'kitchen-accessories', 'The Black Whisk is a kitchen essential for whisking and beating ingredients. Its ergonomic handle and sleek design make it a practical and stylish tool.', 9.99, 10.24, 73, 40, 'KIT-BRD-BLA-050', 1, 13.03, 5.99, 20.64, '3 months warranty', 'Ships in 1 month', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'utensils');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Boxed Blender', NULL, 'kitchen-accessories', 'The Boxed Blender is a powerful and compact blender perfect for smoothies, shakes, and more. Its convenient design and multiple functions make it a versatile kitchen appliance.', 39.99, 7.26, 9, 4, 'KIT-BRD-BOX-051', 1, 9.05, 19.45, 17.59, '5 year warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen appliances'), (LAST_INSERT_ID(), 'blenders');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Carbon Steel Wok', NULL, 'kitchen-accessories', 'The Carbon Steel Wok is a versatile cooking pan suitable for stir-frying, sautéing, and deep frying. Its sturdy construction ensures even heat distribution for delicious meals.', 29.99, 6.53, 40, 9, 'KIT-BRD-CAR-052', 2, 27.69, 7.54, 10.11, '2 year warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'cookware'), (LAST_INSERT_ID(), 'woks');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Chopping Board', NULL, 'kitchen-accessories', 'The Chopping Board is an essential kitchen accessory for food preparation. Made from durable material, it provides a safe and hygienic surface for cutting and chopping.', 12.99, 8.03, 14, 5, 'KIT-BRD-CHO-053', 2, 15.6, 6.93, 8.51, '3 months warranty', 'Ships in 2 weeks', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'cutting boards');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Citrus Squeezer Yellow', NULL, 'kitchen-accessories', 'The Citrus Squeezer in Yellow is a handy tool for extracting juice from citrus fruits. Its vibrant color adds a cheerful touch to your kitchen gadgets.', 8.99, 12.1, 22, 38, 'KIT-BRD-CIT-054', 2, 17.16, 26.8, 16.29, '2 year warranty', 'Ships in 3-5 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'juicers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Egg Slicer', NULL, 'kitchen-accessories', 'The Egg Slicer is a convenient tool for slicing boiled eggs evenly. It''s perfect for salads, sandwiches, and other dishes where sliced eggs are desired.', 6.99, 14.76, 40, 32, 'KIT-BRD-SLI-055', 2, 10.81, 19.15, 13.18, '1 week warranty', 'Ships in 1 month', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'slicers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Electric Stove', NULL, 'kitchen-accessories', 'The Electric Stove provides a portable and efficient cooking solution. Ideal for small kitchens or as an additional cooking surface for various culinary needs.', 49.99, 14.04, 21, 8, 'KIT-BRD-ELE-056', 5, 24.17, 22.55, 27.49, '2 year warranty', 'Ships in 1 week', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen appliances'), (LAST_INSERT_ID(), 'cooktops');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Fine Mesh Strainer', NULL, 'kitchen-accessories', 'The Fine Mesh Strainer is a versatile tool for straining liquids and sifting dry ingredients. Its fine mesh ensures efficient filtering for smooth cooking and baking.', 9.99, 3.5, 85, 43, 'KIT-BRD-FIN-057', 9, 18.02, 13.23, 15.92, '1 month warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'strainers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Fork', NULL, 'kitchen-accessories', 'The Fork is a classic utensil for various dining and serving purposes. Its durable and ergonomic design makes it a reliable choice for everyday use.', 3.99, 8.07, 7, 36, 'KIT-BRD-FOR-058', 9, 12.3, 25.91, 22.57, 'No warranty', 'Ships in 1 month', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'utensils');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Glass', NULL, 'kitchen-accessories', 'The Glass is a versatile and elegant drinking vessel suitable for a variety of beverages. Its clear design allows you to enjoy the colors and textures of your drinks.', 4.99, 7.92, 46, 17, 'KIT-BRD-GLA-059', 10, 20.23, 24.56, 26.97, '3 year warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'drinkware'), (LAST_INSERT_ID(), 'glasses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Grater Black', NULL, 'kitchen-accessories', 'The Grater in Black is a handy kitchen tool for grating cheese, vegetables, and more. Its sleek design and sharp blades make food preparation efficient and easy.', 10.99, 3.56, 84, 5, 'KIT-BRD-GRA-060', 3, 6.32, 23.11, 24.64, '1 month warranty', 'Ships in 1 week', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'graters');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Hand Blender', NULL, 'kitchen-accessories', 'The Hand Blender is a versatile kitchen appliance for blending, pureeing, and mixing. Its compact design and powerful motor make it a convenient tool for various recipes.', 34.99, 17.02, 84, 11, 'KIT-BRD-HAN-061', 5, 27.31, 21, 24.27, '1 year warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen appliances'), (LAST_INSERT_ID(), 'blenders');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Ice Cube Tray', NULL, 'kitchen-accessories', 'The Ice Cube Tray is a practical accessory for making ice cubes in various shapes. Perfect for keeping your drinks cool and adding a fun element to your beverages.', 5.99, 0.63, 13, 16, 'KIT-BRD-CUB-062', 3, 26.67, 18.14, 5.31, '1 month warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'ice cube trays');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Kitchen Sieve', NULL, 'kitchen-accessories', 'The Kitchen Sieve is a versatile tool for sifting and straining dry and wet ingredients. Its fine mesh design ensures smooth results in your cooking and baking.', 7.99, 18.91, 68, 5, 'KIT-BRD-KIT-063', 5, 20.68, 6.5, 7.86, '1 month warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'strainers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Knife', NULL, 'kitchen-accessories', 'The Knife is an essential kitchen tool for chopping, slicing, and dicing. Its sharp blade and ergonomic handle make it a reliable choice for food preparation.', 14.99, 18.86, 7, 50, 'KIT-BRD-KNI-064', 3, 25.19, 18.52, 20.5, '1 month warranty', 'Ships in 1 week', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'cutlery');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Lunch Box', NULL, 'kitchen-accessories', 'The Lunch Box is a convenient and portable container for packing and carrying your meals. With compartments for different foods, it''s perfect for on-the-go dining.', 12.99, 10.34, 94, 39, 'KIT-BRD-LUN-065', 9, 12.45, 19.08, 8.24, '5 year warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'storage');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Microwave Oven', NULL, 'kitchen-accessories', 'The Microwave Oven is a versatile kitchen appliance for quick and efficient cooking, reheating, and defrosting. Its compact size makes it suitable for various kitchen setups.', 89.99, 12.13, 59, 4, 'KIT-BRD-MIC-066', 9, 16.31, 27.45, 13.05, '1 year warranty', 'Ships in 1 week', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen appliances'), (LAST_INSERT_ID(), 'microwaves');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Mug Tree Stand', NULL, 'kitchen-accessories', 'The Mug Tree Stand is a stylish and space-saving solution for organizing your mugs. Keep your favorite mugs easily accessible and neatly displayed in your kitchen.', 15.99, 9.25, 88, 45, 'KIT-BRD-TRE-067', 3, 18.99, 27.14, 27.29, '1 year warranty', 'Ships in 1 month', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'organization');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Pan', NULL, 'kitchen-accessories', 'The Pan is a versatile and essential cookware item for frying, sautéing, and cooking various dishes. Its non-stick coating ensures easy food release and cleanup.', 24.99, 3, 90, 17, 'KIT-BRD-PRD-068', 8, 17.14, 21.7, 25.75, '1 year warranty', 'Ships in 3-5 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'cookware'), (LAST_INSERT_ID(), 'pans');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Plate', NULL, 'kitchen-accessories', 'The Plate is a classic and essential dishware item for serving meals. Its durable and stylish design makes it suitable for everyday use or special occasions.', 3.99, 7.31, 66, 6, 'KIT-BRD-PLA-069', 4, 16.46, 5.39, 13.15, '1 year warranty', 'Ships in 1-2 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'dinnerware'), (LAST_INSERT_ID(), 'plates');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Red Tongs', NULL, 'kitchen-accessories', 'The Red Tongs are versatile kitchen tongs suitable for various cooking and serving tasks. Their vibrant color adds a pop of excitement to your kitchen utensils.', 6.99, 14.52, 82, 23, 'KIT-BRD-TON-070', 7, 22.86, 26.2, 17, 'No warranty', 'Ships in 1 week', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'tongs');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Silver Pot With Glass Cap', NULL, 'kitchen-accessories', 'The Silver Pot with Glass Cap is a stylish and functional cookware item for boiling, simmering, and preparing delicious meals. Its glass cap allows you to monitor cooking progress.', 39.99, 5.7, 40, 10, 'KIT-BRD-SIL-071', 7, 21.03, 11.7, 6.69, '1 year warranty', 'Ships in 1 month', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'cookware'), (LAST_INSERT_ID(), 'pots');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Slotted Turner', NULL, 'kitchen-accessories', 'The Slotted Turner is a kitchen utensil designed for flipping and turning food items. Its slotted design allows excess liquid to drain, making it ideal for frying and sautéing.', 8.99, 13.35, 88, 34, 'KIT-BRD-SLO-072', 8, 14.41, 27.15, 14.76, 'Lifetime warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'turners');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Spice Rack', NULL, 'kitchen-accessories', 'The Spice Rack is a convenient organizer for your spices and seasonings. Keep your kitchen essentials within reach and neatly arranged with this stylish spice rack.', 19.99, 12.09, 79, 18, 'KIT-BRD-SPI-073', 7, 28.06, 22.43, 26.34, '1 week warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'organization');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Spoon', NULL, 'kitchen-accessories', 'The Spoon is a versatile kitchen utensil for stirring, serving, and tasting. Its ergonomic design and durable construction make it an essential tool for every kitchen.', 4.99, 1.53, 59, 15, 'KIT-BRD-SPO-074', 6, 8.49, 26.04, 27.78, '1 year warranty', 'Ships in 1-2 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'utensils');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Tray', NULL, 'kitchen-accessories', 'The Tray is a functional and decorative item for serving snacks, appetizers, or drinks. Its stylish design makes it a versatile accessory for entertaining guests.', 16.99, 7.48, 71, 23, 'KIT-BRD-TRA-075', 10, 12.7, 7.52, 9.72, '5 year warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'serveware'), (LAST_INSERT_ID(), 'trays');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Wooden Rolling Pin', NULL, 'kitchen-accessories', 'The Wooden Rolling Pin is a classic kitchen tool for rolling out dough for baking. Its smooth surface and sturdy handles make it easy to achieve uniform thickness.', 11.99, 9.75, 80, 11, 'KIT-BRD-WOO-076', 7, 5.92, 10.87, 19.55, '3 year warranty', 'Ships in 2 weeks', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'baking');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Yellow Peeler', NULL, 'kitchen-accessories', 'The Yellow Peeler is a handy tool for peeling fruits and vegetables with ease. Its bright yellow color adds a cheerful touch to your kitchen gadgets.', 5.99, 12.48, 35, 6, 'KIT-BRD-YEL-077', 7, 9.7, 6.43, 17.93, '1 month warranty', 'Ships in 3-5 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'kitchen tools'), (LAST_INSERT_ID(), 'peelers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple MacBook Pro 14 Inch Space Grey', 'Apple', 'laptops', 'The MacBook Pro 14 Inch in Space Grey is a powerful and sleek laptop, featuring Apple''s M1 Pro chip for exceptional performance and a stunning Retina display.', 1999.99, 4.69, 24, 1, 'LAP-APP-APP-078', 9, 20.03, 9.54, 14.82, '3 year warranty', 'Ships in 2 weeks', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'laptops'), (LAST_INSERT_ID(), 'apple');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Asus Zenbook Pro Dual Screen Laptop', 'Asus', 'laptops', 'The Asus Zenbook Pro Dual Screen Laptop is a high-performance device with dual screens, providing productivity and versatility for creative professionals.', 1799.99, 11.14, 45, 1, 'LAP-ASU-ASU-079', 9, 16.6, 11.49, 10.89, '3 year warranty', 'Ships in 1 month', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'laptops');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Huawei Matebook X Pro', 'Huawei', 'laptops', 'The Huawei Matebook X Pro is a slim and stylish laptop with a high-resolution touchscreen display, offering a premium experience for users on the go.', 1399.99, 9.38, 75, 1, 'LAP-HUA-HUA-080', 9, 18.21, 22.83, 17.26, 'No warranty', 'Ships overnight', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'laptops');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Lenovo Yoga 920', 'Lenovo', 'laptops', 'The Lenovo Yoga 920 is a 2-in-1 convertible laptop with a flexible hinge, allowing you to use it as a laptop or tablet, offering versatility and portability.', 1099.99, 6.55, 40, 1, 'LAP-LEN-LEN-081', 9, 20.84, 22.68, 17.39, '6 months warranty', 'Ships in 2 weeks', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'laptops');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'New DELL XPS 13 9300 Laptop', 'Dell', 'laptops', 'The New DELL XPS 13 9300 Laptop is a compact and powerful device, featuring a virtually borderless InfinityEdge display and high-end performance for various tasks.', 1499.99, 11.89, 74, 1, 'LAP-DEL-DEL-082', 2, 13.76, 29, 21.42, '2 year warranty', 'Ships in 2 weeks', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'laptops');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Blue & Black Check Shirt', 'Fashion Trends', 'mens-shirts', 'The Blue & Black Check Shirt is a stylish and comfortable men''s shirt featuring a classic check pattern. Made from high-quality fabric, it''s suitable for both casual and semi-formal occasions.', 29.99, 15.35, 38, 18, 'MEN-FAS-BLU-083', 4, 27.49, 23.73, 28.61, '3 year warranty', 'Ships in 3-5 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'men''s shirts');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Gigabyte Aorus Men Tshirt', 'Gigabyte', 'mens-shirts', 'The Gigabyte Aorus Men Tshirt is a cool and casual shirt for gaming enthusiasts. With the Aorus logo and sleek design, it''s perfect for expressing your gaming style.', 24.99, 0.94, 90, 16, 'MEN-GIG-GIG-084', 4, 22.31, 26.47, 13.27, '3 year warranty', 'Ships overnight', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'men''s t-shirts');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Man Plaid Shirt', 'Classic Wear', 'mens-shirts', 'The Man Plaid Shirt is a timeless and versatile men''s shirt with a classic plaid pattern. Its comfortable fit and casual style make it a wardrobe essential for various occasions.', 34.99, 19.5, 82, 13, 'MEN-CLA-PLA-085', 3, 9.34, 5.97, 10.85, '1 week warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'men''s shirts');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Man Short Sleeve Shirt', 'Casual Comfort', 'mens-shirts', 'The Man Short Sleeve Shirt is a breezy and stylish option for warm days. With a comfortable fit and short sleeves, it''s perfect for a laid-back yet polished look.', 19.99, 6.83, 2, 4, 'MEN-CAS-SHO-086', 2, 5.02, 16.57, 9.6, '3 year warranty', 'Ships in 2 weeks', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'men''s shirts');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Men Check Shirt', 'Urban Chic', 'mens-shirts', 'The Men Check Shirt is a classic and versatile shirt featuring a stylish check pattern. Suitable for various occasions, it adds a smart and polished touch to your wardrobe.', 27.99, 11.38, 95, 12, 'MEN-URB-CHE-087', 10, 23.48, 7.03, 27.33, 'No warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'men''s shirts');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Nike Air Jordan 1 Red And Black', 'Nike', 'mens-shoes', 'The Nike Air Jordan 1 in Red and Black is an iconic basketball sneaker known for its stylish design and high-performance features, making it a favorite among sneaker enthusiasts and athletes.', 149.99, 4.12, 7, 1, 'MEN-NIK-NIK-088', 3, 17.44, 9.52, 27, '1 year warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'athletic shoes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Nike Baseball Cleats', 'Nike', 'mens-shoes', 'Nike Baseball Cleats are designed for maximum traction and performance on the baseball field. They provide stability and support for players during games and practices.', 79.99, 18.04, 12, 3, 'MEN-NIK-NIK-089', 9, 11.75, 26.65, 19.6, '6 months warranty', 'Ships in 2 weeks', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'sports cleats');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Puma Future Rider Trainers', 'Puma', 'mens-shoes', 'The Puma Future Rider Trainers offer a blend of retro style and modern comfort. Perfect for casual wear, these trainers provide a fashionable and comfortable option for everyday use.', 89.99, 4.2, 90, 10, 'MEN-PUM-PUM-090', 6, 17.45, 15.58, 23.13, '5 year warranty', 'Ships in 1-2 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'casual shoes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Sports Sneakers Off White & Red', 'Off White', 'mens-shoes', 'The Sports Sneakers in Off White and Red combine style and functionality, making them a fashionable choice for sports enthusiasts. The red and off-white color combination adds a bold and energetic touch.', 119.99, 4.97, 17, 5, 'MEN-OFF-SPO-091', 7, 14.37, 23.44, 12.84, '1 week warranty', 'Ships in 3-5 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'athletic shoes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Sports Sneakers Off White Red', 'Off White', 'mens-shoes', 'Another variant of the Sports Sneakers in Off White Red, featuring a unique design. These sneakers offer style and comfort for casual occasions.', 109.99, 0.04, 62, 3, 'MEN-OFF-SPO-092', 9, 21.43, 9.86, 28.5, '3 months warranty', 'Ships overnight', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'casual shoes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Brown Leather Belt Watch', 'Fashion Timepieces', 'mens-watches', 'The Brown Leather Belt Watch is a stylish timepiece with a classic design. Featuring a genuine leather strap and a sleek dial, it adds a touch of sophistication to your look.', 89.99, 5.99, 32, 7, 'MEN-FAS-BRO-093', 10, 16.65, 6.15, 20.18, '1 year warranty', 'Ships in 1 month', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'leather watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Longines Master Collection', 'Longines', 'mens-watches', 'The Longines Master Collection is an elegant and refined watch known for its precision and craftsmanship. With a timeless design, it''s a symbol of luxury and sophistication.', 1499.99, 17.24, 100, 1, 'MEN-LON-LON-094', 4, 15.39, 10.06, 20.32, '1 week warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'luxury watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Rolex Cellini Date Black Dial', 'Rolex', 'mens-watches', 'The Rolex Cellini Date with Black Dial is a classic and prestigious watch. With a black dial and date complication, it exudes sophistication and is a symbol of Rolex''s heritage.', 8999.99, 8.88, 40, 1, 'MEN-ROL-ROL-095', 2, 13.46, 26.1, 17.9, '3 months warranty', 'Ships in 1 week', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'luxury watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Rolex Cellini Moonphase', 'Rolex', 'mens-watches', 'The Rolex Cellini Moonphase is a masterpiece of horology, featuring a moon phase complication and exquisite design. It reflects Rolex''s commitment to precision and elegance.', 12999.99, 17.52, 36, 1, 'MEN-ROL-ROL-096', 2, 26.06, 25.19, 13.17, '6 months warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'luxury watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Rolex Datejust', 'Rolex', 'mens-watches', 'The Rolex Datejust is an iconic and versatile timepiece with a date window. Known for its timeless design and reliability, it''s a symbol of Rolex''s watchmaking excellence.', 10999.99, 3.73, 86, 1, 'MEN-ROL-ROL-097', 4, 23.11, 19.97, 27.04, '2 year warranty', 'Ships in 1 month', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'luxury watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Rolex Submariner Watch', 'Rolex', 'mens-watches', 'The Rolex Submariner is a legendary dive watch with a rich history. Known for its durability and water resistance, it''s a symbol of adventure and exploration.', 13999.99, 5.05, 55, 1, 'MEN-ROL-ROL-098', 4, 17.69, 12.48, 8.75, '5 year warranty', 'Ships in 1 month', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'luxury watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Amazon Echo Plus', 'Amazon', 'mobile-accessories', 'The Amazon Echo Plus is a smart speaker with built-in Alexa voice control. It features premium sound quality and serves as a hub for controlling smart home devices.', 99.99, 12.07, 61, 9, 'MOB-AMA-AMA-099', 5, 12.68, 15.24, 27.46, '6 months warranty', 'Ships in 1 week', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'smart speakers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple Airpods', 'Apple', 'mobile-accessories', 'The Apple Airpods offer a seamless wireless audio experience. With easy pairing, high-quality sound, and Siri integration, they are perfect for on-the-go listening.', 129.99, 15.54, 67, 4, 'MOB-APP-APP-100', 4, 25.79, 18.38, 11.53, '3 year warranty', 'Ships in 3-5 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'wireless earphones');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple AirPods Max Silver', 'Apple', 'mobile-accessories', 'The Apple AirPods Max in Silver are premium over-ear headphones with high-fidelity audio, adaptive EQ, and active noise cancellation. Experience immersive sound in style.', 549.99, 13.67, 59, 1, 'MOB-APP-APP-101', 2, 24.88, 14.9, 27.54, 'No warranty', 'Ships in 2 weeks', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'over-ear headphones');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple Airpower Wireless Charger', 'Apple', 'mobile-accessories', 'The Apple AirPower Wireless Charger provides a convenient way to charge your compatible Apple devices wirelessly. Simply place your devices on the charging mat for effortless charging.', 79.99, 4.48, 1, 7, 'MOB-APP-APP-102', 5, 25.25, 25.44, 10.98, '2 year warranty', 'Ships in 1 week', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'wireless chargers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple HomePod Mini Cosmic Grey', 'Apple', 'mobile-accessories', 'The Apple HomePod Mini in Cosmic Grey is a compact smart speaker that delivers impressive audio and integrates seamlessly with the Apple ecosystem for a smart home experience.', 99.99, 18.1, 27, 8, 'MOB-APP-APP-103', 10, 16.02, 29.2, 19.81, '3 months warranty', 'Ships in 1 month', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'smart speakers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple iPhone Charger', 'Apple', 'mobile-accessories', 'The Apple iPhone Charger is a high-quality charger designed for fast and efficient charging of your iPhone. Ensure your device stays powered up and ready to go.', 19.99, 18.52, 31, 14, 'MOB-APP-APP-104', 1, 13.63, 26.25, 5.95, '1 year warranty', 'Ships in 2 weeks', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'chargers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple MagSafe Battery Pack', 'Apple', 'mobile-accessories', 'The Apple MagSafe Battery Pack is a portable and convenient way to add extra battery life to your MagSafe-compatible iPhone. Attach it magnetically for a secure connection.', 99.99, 17.17, 1, 4, 'MOB-APP-APP-105', 6, 15.4, 11.89, 19.67, '2 year warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'power banks');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Apple Watch Series 4 Gold', 'Apple', 'mobile-accessories', 'The Apple Watch Series 4 in Gold is a stylish and advanced smartwatch with features like heart rate monitoring, fitness tracking, and a beautiful Retina display.', 349.99, 12.02, 33, 3, 'MOB-APP-APP-106', 6, 27.69, 28.03, 7.11, '6 months warranty', 'Ships in 1 month', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'smartwatches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Beats Flex Wireless Earphones', 'Beats', 'mobile-accessories', 'The Beats Flex Wireless Earphones offer a comfortable and versatile audio experience. With magnetic earbuds and up to 12 hours of battery life, they are ideal for everyday use.', 49.99, 5.73, 50, 17, 'MOB-BEA-BEA-107', 8, 17.86, 25.74, 23.09, '1 year warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'wireless earphones');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'iPhone 12 Silicone Case with MagSafe Plum', 'Apple', 'mobile-accessories', 'The iPhone 12 Silicone Case with MagSafe in Plum is a stylish and protective case designed for the iPhone 12. It features MagSafe technology for easy attachment of accessories.', 29.99, 13.85, 69, 4, 'MOB-APP-IPH-108', 7, 12.49, 11.29, 23.52, '3 months warranty', 'Ships in 3-5 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'phone accessories');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Monopod', 'TechGear', 'mobile-accessories', 'The Monopod is a versatile camera accessory for stable and adjustable shooting. Perfect for capturing selfies, group photos, and videos with ease.', 19.99, 8.58, 48, 30, 'MOB-TEC-MON-109', 10, 8.8, 12.93, 21.1, '1 year warranty', 'Ships in 1-2 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'camera accessories');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Selfie Lamp with iPhone', 'GadgetMaster', 'mobile-accessories', 'The Selfie Lamp with iPhone is a portable and adjustable LED light designed to enhance your selfies and video calls. Attach it to your iPhone for well-lit photos.', 14.99, 19.4, 58, 22, 'MOB-GAD-SEL-110', 10, 5.26, 13.84, 22.83, 'Lifetime warranty', 'Ships in 2 weeks', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'selfie accessories');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Selfie Stick Monopod', 'SnapTech', 'mobile-accessories', 'The Selfie Stick Monopod is a extendable and foldable device for capturing the perfect selfie or group photo. Compatible with smartphones and cameras.', 12.99, 19.12, 11, 8, 'MOB-SNA-SEL-111', 2, 24.76, 26.38, 21.39, '3 year warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'selfie accessories');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'TV Studio Camera Pedestal', 'ProVision', 'mobile-accessories', 'The TV Studio Camera Pedestal is a professional-grade camera support system for smooth and precise camera movements in a studio setting. Ideal for broadcast and production.', 499.99, 8.31, 15, 1, 'MOB-PRO-STU-112', 4, 29.84, 11.01, 6.81, '3 months warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'camera accessories');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Generic Motorcycle', 'Generic Motors', 'motorcycle', 'The Generic Motorcycle is a versatile and reliable bike suitable for various riding preferences. With a balanced design, it provides a comfortable and efficient riding experience.', 3999.99, 12.1, 34, 1, 'MOT-GEN-GEN-113', 8, 26.23, 14.04, 17.87, '1 year warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'motorcycles');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Kawasaki Z800', 'Kawasaki', 'motorcycle', 'The Kawasaki Z800 is a powerful and agile sportbike known for its striking design and performance. It''s equipped with advanced features, making it a favorite among motorcycle enthusiasts.', 8999.99, 9.77, 52, 1, 'MOT-KAW-KAW-114', 9, 18.3, 18.27, 16.06, 'Lifetime warranty', 'Ships in 3-5 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'motorcycles'), (LAST_INSERT_ID(), 'sportbikes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'MotoGP CI.H1', 'MotoGP', 'motorcycle', 'The MotoGP CI.H1 is a high-performance motorcycle inspired by MotoGP racing technology. It offers cutting-edge features and precision engineering for an exhilarating riding experience.', 14999.99, 6.92, 10, 1, 'MOT-MOT-MOT-115', 1, 19.33, 17.31, 12.05, '1 month warranty', 'Ships in 3-5 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'motorcycles'), (LAST_INSERT_ID(), 'sportbikes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Scooter Motorcycle', 'ScootMaster', 'motorcycle', 'The Scooter Motorcycle is a practical and fuel-efficient bike ideal for urban commuting. It features a step-through design and user-friendly controls for easy maneuverability.', 2999.99, 6.27, 84, 1, 'MOT-SCO-SCO-116', 7, 27.31, 19.34, 26.72, '5 year warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'motorcycles'), (LAST_INSERT_ID(), 'scooters');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Sportbike Motorcycle', 'SpeedMaster', 'motorcycle', 'The Sportbike Motorcycle is designed for speed and agility, with a sleek and aerodynamic profile. It''s suitable for riders looking for a dynamic and thrilling riding experience.', 7499.99, 11.58, 0, 1, 'MOT-SPE-SPO-117', 10, 22.5, 22.74, 8.38, '5 year warranty', 'Ships in 2 weeks', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'motorcycles'), (LAST_INSERT_ID(), 'sportbikes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Attitude Super Leaves Hand Soap', 'Attitude', 'skin-care', 'Attitude Super Leaves Hand Soap is a natural and nourishing hand soap enriched with the goodness of super leaves. It cleanses and moisturizes your hands, leaving them feeling fresh and soft.', 8.99, 18.49, 94, 41, 'SKI-ATT-ATT-118', 1, 14.05, 8.3, 16.62, '6 months warranty', 'Ships overnight', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'personal care'), (LAST_INSERT_ID(), 'hand soap');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Olay Ultra Moisture Shea Butter Body Wash', 'Olay', 'skin-care', 'Olay Ultra Moisture Shea Butter Body Wash is a luxurious body wash that hydrates and nourishes your skin with the moisturizing power of shea butter. Enjoy a rich lather and silky-smooth skin.', 12.99, 16.39, 34, 33, 'SKI-OLA-OLA-119', 4, 25.23, 28.33, 11.89, '1 year warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'personal care'), (LAST_INSERT_ID(), 'body wash');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Vaseline Men Body and Face Lotion', 'Vaseline', 'skin-care', 'Vaseline Men Body and Face Lotion is a specially formulated lotion designed to provide long-lasting moisture to men''s skin. It absorbs quickly and helps keep the skin hydrated and healthy.', 9.99, 13.39, 95, 9, 'SKI-VAS-VAS-120', 4, 21.83, 17.38, 24.76, 'Lifetime warranty', 'Ships overnight', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'personal care'), (LAST_INSERT_ID(), 'body lotion');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'iPhone 5s', 'Apple', 'smartphones', 'The iPhone 5s is a classic smartphone known for its compact design and advanced features during its release. While it''s an older model, it still provides a reliable user experience.', 199.99, 12.91, 25, 3, 'SMA-APP-IPH-121', 2, 5.29, 18.38, 17.72, 'Lifetime warranty', 'Ships in 1 month', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'apple');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'iPhone 6', 'Apple', 'smartphones', 'The iPhone 6 is a stylish and capable smartphone with a larger display and improved performance. It introduced new features and design elements, making it a popular choice in its time.', 299.99, 6.69, 60, 5, 'SMA-APP-IPH-122', 7, 11, 9.1, 9.67, '1 month warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'apple');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'iPhone 13 Pro', 'Apple', 'smartphones', 'The iPhone 13 Pro is a cutting-edge smartphone with a powerful camera system, high-performance chip, and stunning display. It offers advanced features for users who demand top-notch technology.', 1099.99, 9.37, 56, 1, 'SMA-APP-IPH-123', 8, 12.63, 5.28, 14.29, '3 year warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'apple');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'iPhone X', 'Apple', 'smartphones', 'The iPhone X is a flagship smartphone featuring a bezel-less OLED display, facial recognition technology (Face ID), and impressive performance. It represents a milestone in iPhone design and innovation.', 899.99, 19.59, 37, 2, 'SMA-APP-IPH-124', 1, 21.88, 24.19, 14.19, '3 months warranty', 'Ships in 3-5 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'apple');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Oppo A57', 'Oppo', 'smartphones', 'The Oppo A57 is a mid-range smartphone known for its sleek design and capable features. It offers a balance of performance and affordability, making it a popular choice.', 249.99, 2.43, 19, 3, 'SMA-OPP-OPP-125', 5, 7.2, 10.74, 23.68, 'Lifetime warranty', 'Ships in 3-5 business days', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'oppo');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Oppo F19 Pro Plus', 'Oppo', 'smartphones', 'The Oppo F19 Pro Plus is a feature-rich smartphone with a focus on camera capabilities. It boasts advanced photography features and a powerful performance for a premium user experience.', 399.99, 18.64, 78, 1, 'SMA-OPP-OPP-126', 6, 6.78, 25.17, 8.4, '3 year warranty', 'Ships in 1 week', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'oppo');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Oppo K1', 'Oppo', 'smartphones', 'The Oppo K1 series offers a range of smartphones with various features and specifications. Known for their stylish design and reliable performance, the Oppo K1 series caters to diverse user preferences.', 299.99, 18.29, 55, 5, 'SMA-OPP-OPP-127', 5, 13.89, 10.63, 16.6, '1 month warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'oppo');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Realme C35', 'Realme', 'smartphones', 'The Realme C35 is a budget-friendly smartphone with a focus on providing essential features for everyday use. It offers a reliable performance and user-friendly experience.', 149.99, 15.3, 48, 3, 'SMA-REA-REA-128', 2, 25.28, 8.14, 29.53, '3 year warranty', 'Ships overnight', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'realme');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Realme X', 'Realme', 'smartphones', 'The Realme X is a mid-range smartphone known for its sleek design and impressive display. It offers a good balance of performance and camera capabilities for users seeking a quality device.', 299.99, 6.95, 12, 3, 'SMA-REA-REA-129', 4, 25.59, 21.42, 12.75, '1 month warranty', 'Ships in 3-5 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'realme');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Realme XT', 'Realme', 'smartphones', 'The Realme XT is a feature-rich smartphone with a focus on camera technology. It comes equipped with advanced camera sensors, delivering high-quality photos and videos for photography enthusiasts.', 349.99, 11.51, 80, 3, 'SMA-REA-REA-130', 3, 24.98, 26.73, 6.5, '3 year warranty', 'Ships in 1 month', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'realme');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Samsung Galaxy S7', 'Samsung', 'smartphones', 'The Samsung Galaxy S7 is a flagship smartphone known for its sleek design and advanced features. It features a high-resolution display, powerful camera, and robust performance.', 299.99, 19.55, 67, 1, 'SMA-SAM-SAM-131', 10, 13.55, 24.24, 5.63, '3 months warranty', 'Ships in 3-5 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'samsung galaxy');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Samsung Galaxy S8', 'Samsung', 'smartphones', 'The Samsung Galaxy S8 is a premium smartphone with an Infinity Display, offering a stunning visual experience. It boasts advanced camera capabilities and cutting-edge technology.', 499.99, 19.45, 0, 4, 'SMA-SAM-SAM-132', 6, 23.05, 26.88, 15.73, '2 year warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'samsung galaxy');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Samsung Galaxy S10', 'Samsung', 'smartphones', 'The Samsung Galaxy S10 is a flagship device featuring a dynamic AMOLED display, versatile camera system, and powerful performance. It represents innovation and excellence in smartphone technology.', 699.99, 5.59, 19, 2, 'SMA-SAM-SAM-133', 9, 27.41, 15.26, 27.02, 'No warranty', 'Ships in 2 weeks', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'samsung galaxy');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Vivo S1', 'Vivo', 'smartphones', 'The Vivo S1 is a stylish and mid-range smartphone offering a blend of design and performance. It features a vibrant display, capable camera system, and reliable functionality.', 249.99, 10.17, 50, 1, 'SMA-VIV-VIV-134', 4, 14.06, 11.79, 6.78, '6 months warranty', 'Ships in 3-5 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'vivo');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Vivo V9', 'Vivo', 'smartphones', 'The Vivo V9 is a smartphone known for its sleek design and emphasis on capturing high-quality selfies. It features a notch display, dual-camera setup, and a modern design.', 299.99, 17.67, 82, 2, 'SMA-VIV-VIV-135', 4, 19.85, 21.83, 13.04, '2 year warranty', 'Ships in 1 month', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'vivo');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Vivo X21', 'Vivo', 'smartphones', 'The Vivo X21 is a premium smartphone with a focus on cutting-edge technology. It features an in-display fingerprint sensor, a high-resolution display, and advanced camera capabilities.', 499.99, 17.41, 7, 3, 'SMA-VIV-VIV-136', 10, 22.49, 21.62, 27.88, '1 year warranty', 'Ships in 1-2 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'smartphones'), (LAST_INSERT_ID(), 'vivo');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'American Football', NULL, 'sports-accessories', 'The American Football is a classic ball used in American football games. It is designed for throwing and catching, making it an essential piece of equipment for the sport.', 19.99, 4.93, 53, 1, 'SPO-BRD-AME-137', 2, 6.88, 5.82, 21.96, '6 months warranty', 'Ships in 1 month', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'american football');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Baseball Ball', NULL, 'sports-accessories', 'The Baseball Ball is a standard baseball used in baseball games. It features a durable leather cover and is designed for pitching, hitting, and fielding in the game of baseball.', 8.99, 1.71, 100, 11, 'SPO-BRD-BAS-138', 5, 14.42, 22.65, 15.89, '6 months warranty', 'Ships in 1 week', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'baseball');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Baseball Glove', NULL, 'sports-accessories', 'The Baseball Glove is a protective glove worn by baseball players. It is designed to catch and field the baseball, providing players with comfort and control during the game.', 24.99, 2.9, 22, 8, 'SPO-BRD-BAS-139', 1, 23.84, 11.12, 5.85, 'Lifetime warranty', 'Ships in 2 weeks', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'baseball');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Basketball', NULL, 'sports-accessories', 'The Basketball is a standard ball used in basketball games. It is designed for dribbling, shooting, and passing in the game of basketball, suitable for both indoor and outdoor play.', 14.99, 7.44, 75, 11, 'SPO-BRD-BAS-140', 7, 27.86, 10.64, 18.75, '1 year warranty', 'Ships in 1 week', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'basketball');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Basketball Rim', NULL, 'sports-accessories', 'The Basketball Rim is a sturdy hoop and net assembly mounted on a basketball backboard. It provides a target for shooting and scoring in the game of basketball.', 39.99, 7.74, 43, 9, 'SPO-BRD-BAS-141', 1, 15.83, 20.87, 7.27, '3 months warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'basketball');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Cricket Ball', NULL, 'sports-accessories', 'The Cricket Ball is a hard leather ball used in the sport of cricket. It is bowled and batted in the game, and its hardness and seam contribute to the dynamics of cricket play.', 12.99, 8.63, 30, 11, 'SPO-BRD-CRI-142', 7, 28.51, 20.77, 17.66, '3 year warranty', 'Ships in 3-5 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'cricket');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Cricket Bat', NULL, 'sports-accessories', 'The Cricket Bat is an essential piece of cricket equipment used by batsmen to hit the cricket ball. It is made of wood and comes in various sizes and designs.', 29.99, 3.29, 98, 16, 'SPO-BRD-CRI-143', 10, 27.44, 23.65, 16.62, '1 year warranty', 'Ships in 1-2 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'cricket');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Cricket Helmet', NULL, 'sports-accessories', 'The Cricket Helmet is a protective headgear worn by cricket players, especially batsmen and wicketkeepers. It provides protection against fast bowling and bouncers.', 44.99, 9.64, 10, 4, 'SPO-BRD-CRI-144', 10, 6.34, 6.25, 21.68, 'Lifetime warranty', 'Ships overnight', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'cricket');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Cricket Wicket', NULL, 'sports-accessories', 'The Cricket Wicket is a set of three stumps and two bails, forming a wicket used in the sport of cricket. Batsmen aim to protect the wicket while scoring runs.', 29.99, 16.93, 25, 20, 'SPO-BRD-CRI-145', 5, 15.99, 15.23, 22.81, '3 months warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'cricket');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Feather Shuttlecock', NULL, 'sports-accessories', 'The Feather Shuttlecock is used in the sport of badminton. It features natural feathers and is designed for high-speed play, providing stability and accuracy during matches.', 5.99, 2.95, 95, 30, 'SPO-BRD-FEA-146', 4, 19.63, 23.73, 18.56, '3 year warranty', 'Ships in 1-2 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'badminton');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Football', NULL, 'sports-accessories', 'The Football, also known as a soccer ball, is the standard ball used in the sport of football (soccer). It is designed for kicking and passing in the game.', 17.99, 5.15, 96, 27, 'SPO-BRD-FOO-147', 1, 28.93, 23.01, 11.71, 'Lifetime warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'football');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Golf Ball', NULL, 'sports-accessories', 'The Golf Ball is a small ball used in the sport of golf. It features dimples on its surface, providing aerodynamic lift and distance when struck by a golf club.', 9.99, 17.37, 84, 40, 'SPO-BRD-GOL-148', 3, 24.89, 23.39, 12.47, '1 year warranty', 'Ships in 3-5 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'golf');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Iron Golf', NULL, 'sports-accessories', 'The Iron Golf is a type of golf club designed for various golf shots. It features a solid metal head and is used for approach shots, chipping, and other golfing techniques.', 49.99, 6.53, 90, 8, 'SPO-BRD-IRO-149', 2, 10.15, 19.55, 5.91, '3 months warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'golf');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Metal Baseball Bat', NULL, 'sports-accessories', 'The Metal Baseball Bat is a durable and lightweight baseball bat made from metal alloys. It is commonly used in baseball games for hitting and batting practice.', 29.99, 19.51, 16, 9, 'SPO-BRD-MET-150', 7, 28.43, 14.3, 7.36, '3 year warranty', 'Ships in 1 week', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'baseball');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Tennis Ball', NULL, 'sports-accessories', 'The Tennis Ball is a standard ball used in the sport of tennis. It is designed for bouncing and hitting with tennis rackets during matches or practice sessions.', 6.99, 11.76, 28, 6, 'SPO-BRD-TEN-151', 3, 8.04, 20.35, 12.24, '5 year warranty', 'Ships in 1 week', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'tennis');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Tennis Racket', NULL, 'sports-accessories', 'The Tennis Racket is an essential piece of equipment used in the sport of tennis. It features a frame with strings and a grip, allowing players to hit the tennis ball.', 49.99, 19.61, 6, 5, 'SPO-BRD-TEN-152', 7, 17.7, 16.38, 18.74, '5 year warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'tennis');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Volleyball', NULL, 'sports-accessories', 'The Volleyball is a standard ball used in the sport of volleyball. It is designed for passing, setting, and spiking over the net during volleyball matches.', 11.99, 12.25, 0, 44, 'SPO-BRD-VOL-153', 3, 17.01, 20.05, 9.94, '1 week warranty', 'Ships in 1 week', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sports equipment'), (LAST_INSERT_ID(), 'volleyball');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Black Sun Glasses', 'Fashion Shades', 'sunglasses', 'The Black Sun Glasses are a classic and stylish choice, featuring a sleek black frame and tinted lenses. They provide both UV protection and a fashionable look.', 29.99, 4.94, 60, 17, 'SUN-FAS-BLA-154', 1, 18.51, 15.69, 10.11, 'No warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'eyewear'), (LAST_INSERT_ID(), 'sunglasses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Classic Sun Glasses', 'Fashion Shades', 'sunglasses', 'The Classic Sun Glasses offer a timeless design with a neutral frame and UV-protected lenses. These sunglasses are versatile and suitable for various occasions.', 24.99, 4.94, 1, 18, 'SUN-FAS-CLA-155', 8, 19.87, 16.73, 11.07, '6 months warranty', 'Ships in 1 month', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'eyewear'), (LAST_INSERT_ID(), 'sunglasses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Green and Black Glasses', 'Fashion Shades', 'sunglasses', 'The Green and Black Glasses feature a bold combination of green and black colors, adding a touch of vibrancy to your eyewear collection. They are both stylish and eye-catching.', 34.99, 1.01, 24, 15, 'SUN-FAS-GRE-156', 7, 26.13, 9.8, 25.94, '1 year warranty', 'Ships overnight', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'eyewear'), (LAST_INSERT_ID(), 'sunglasses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Party Glasses', 'Fashion Fun', 'sunglasses', 'The Party Glasses are designed to add flair to your party outfit. With unique shapes or colorful frames, they''re perfect for adding a playful touch to your look during celebrations.', 19.99, 11.22, 86, 39, 'SUN-FAS-PAR-157', 9, 19.59, 22.06, 27.53, '3 months warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'eyewear'), (LAST_INSERT_ID(), 'party glasses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Sunglasses', 'Fashion Shades', 'sunglasses', 'The Sunglasses offer a classic and simple design with a focus on functionality. These sunglasses provide essential UV protection while maintaining a timeless look.', 22.99, 1.51, 27, 8, 'SUN-FAS-SUN-158', 1, 16.15, 24.59, 10.31, '3 year warranty', 'Ships in 3-5 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'eyewear'), (LAST_INSERT_ID(), 'sunglasses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'iPad Mini 2021 Starlight', 'Apple', 'tablets', 'The iPad Mini 2021 in Starlight is a compact and powerful tablet from Apple. Featuring a stunning Retina display, powerful A-series chip, and a sleek design, it offers a premium tablet experience.', 499.99, 3.64, 47, 3, 'TAB-APP-IPA-159', 5, 17.03, 5.34, 29.62, '2 year warranty', 'Ships in 1-2 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'tablets');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Samsung Galaxy Tab S8 Plus Grey', 'Samsung', 'tablets', 'The Samsung Galaxy Tab S8 Plus in Grey is a high-performance Android tablet by Samsung. With a large AMOLED display, powerful processor, and S Pen support, it''s ideal for productivity and entertainment.', 599.99, 13.31, 62, 1, 'TAB-SAM-SAM-160', 1, 6.11, 25.85, 26.85, '3 months warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'tablets');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Samsung Galaxy Tab White', 'Samsung', 'tablets', 'The Samsung Galaxy Tab in White is a sleek and versatile Android tablet. With a vibrant display, long-lasting battery, and a range of features, it offers a great user experience for various tasks.', 349.99, 18.2, 92, 5, 'TAB-SAM-SAM-161', 5, 15.05, 5.37, 11.82, '3 months warranty', 'Ships overnight', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'electronics'), (LAST_INSERT_ID(), 'tablets');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Blue Frock', NULL, 'tops', 'The Blue Frock is a charming and stylish dress for various occasions. With a vibrant blue color and a comfortable design, it adds a touch of elegance to your wardrobe.', 29.99, 12.13, 52, 4, 'TOP-BRD-BLU-162', 5, 24.25, 5.91, 8.79, 'Lifetime warranty', 'Ships in 2 weeks', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'dresses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Girl Summer Dress', NULL, 'tops', 'The Girl Summer Dress is a cute and breezy dress designed for warm weather. With playful patterns and lightweight fabric, it''s perfect for keeping cool and stylish during the summer.', 19.99, 19.2, 43, 46, 'TOP-BRD-GIR-163', 5, 26.19, 20.65, 10.1, 'Lifetime warranty', 'Ships in 1 month', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'girls'' dresses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Gray Dress', NULL, 'tops', 'The Gray Dress is a versatile and chic option for various occasions. With a neutral gray color, it can be dressed up or down, making it a wardrobe staple for any fashion-forward individual.', 34.99, 14.28, 55, 13, 'TOP-BRD-GRA-164', 1, 11.91, 25.72, 18.55, '1 month warranty', 'Ships in 1 month', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'dresses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Short Frock', NULL, 'tops', 'The Short Frock is a playful and trendy dress with a shorter length. Ideal for casual outings or special occasions, it combines style and comfort for a fashionable look.', 24.99, 13.45, 22, 5, 'TOP-BRD-SHO-165', 10, 24.29, 6.79, 28.12, '1 year warranty', 'Ships in 1-2 business days', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'dresses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Tartan Dress', NULL, 'tops', 'The Tartan Dress features a classic tartan pattern, bringing a timeless and sophisticated touch to your wardrobe. Perfect for fall and winter, it adds a hint of traditional charm.', 39.99, 12.95, 73, 1, 'TOP-BRD-TAR-166', 8, 23.14, 12.44, 12.67, '1 month warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'dresses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, '300 Touring', 'Chrysler', 'vehicle', 'The 300 Touring is a stylish and comfortable sedan, known for its luxurious features and smooth performance.', 28999.99, 3.98, 54, 1, 'VEH-CHR-TOU-167', 9, 19.2, 26.17, 17.28, '3 year warranty', 'Ships in 2 weeks', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sedans'), (LAST_INSERT_ID(), 'vehicles');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Charger SXT RWD', 'Dodge', 'vehicle', 'The Charger SXT RWD is a powerful and sporty rear-wheel-drive sedan, offering a blend of performance and practicality.', 32999.99, 8.23, 57, 1, 'VEH-DOD-CHA-168', 6, 16.77, 23.03, 8.18, '1 month warranty', 'Ships in 3-5 business days', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'sedans'), (LAST_INSERT_ID(), 'sports cars'), (LAST_INSERT_ID(), 'vehicles');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Dodge Hornet GT Plus', 'Dodge', 'vehicle', 'The Dodge Hornet GT Plus is a compact and agile hatchback, perfect for urban driving with a touch of sportiness.', 24999.99, 2.63, 82, 1, 'VEH-DOD-DOD-169', 8, 19.89, 9.8, 17.8, '1 year warranty', 'Ships in 1 month', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'hatchbacks'), (LAST_INSERT_ID(), 'compact cars'), (LAST_INSERT_ID(), 'vehicles');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Durango SXT RWD', 'Dodge', 'vehicle', 'The Durango SXT RWD is a spacious and versatile SUV, known for its strong performance and family-friendly features.', 36999.99, 16.44, 95, 1, 'VEH-DOD-DUR-170', 1, 19.02, 29.52, 24.36, '2 year warranty', 'Ships in 1 month', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'suvs'), (LAST_INSERT_ID(), 'vehicles');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Pacifica Touring', 'Chrysler', 'vehicle', 'The Pacifica Touring is a stylish and well-equipped minivan, offering comfort and convenience for family journeys.', 31999.99, 14.76, 53, 1, 'VEH-CHR-PAC-171', 9, 7.11, 15.51, 18.1, '1 month warranty', 'Ships overnight', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'minivans'), (LAST_INSERT_ID(), 'vehicles');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Blue Women''s Handbag', 'Fashionista', 'womens-bags', 'The Blue Women''s Handbag is a stylish and spacious accessory for everyday use. With a vibrant blue color and multiple compartments, it combines fashion and functionality.', 49.99, 17.88, 76, 5, 'WOM-FAS-BLU-172', 7, 14.12, 11.89, 25.69, '1 year warranty', 'Ships in 1 week', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fashion accessories'), (LAST_INSERT_ID(), 'handbags');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Heshe Women''s Leather Bag', 'Heshe', 'womens-bags', 'The Heshe Women''s Leather Bag is a luxurious and high-quality leather bag for the sophisticated woman. With a timeless design and durable craftsmanship, it''s a versatile accessory.', 129.99, 3.87, 99, 5, 'WOM-HES-HES-173', 3, 28.66, 20.56, 6.62, '5 year warranty', 'Ships overnight', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fashion accessories'), (LAST_INSERT_ID(), 'leather bags');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Prada Women Bag', 'Prada', 'womens-bags', 'The Prada Women Bag is an iconic designer bag that exudes elegance and luxury. Crafted with precision and featuring the Prada logo, it''s a statement piece for fashion enthusiasts.', 599.99, 14.09, 75, 1, 'WOM-PRA-PRA-174', 4, 21.84, 22.19, 13.41, '3 year warranty', 'Ships in 1-2 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fashion accessories'), (LAST_INSERT_ID(), 'designer bags');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'White Faux Leather Backpack', 'Urban Chic', 'womens-bags', 'The White Faux Leather Backpack is a trendy and practical backpack for the modern woman. With a sleek white design and ample storage space, it''s perfect for both casual and on-the-go styles.', 39.99, 15.2, 39, 7, 'WOM-URB-WHI-175', 7, 14.31, 23.29, 28.91, '2 year warranty', 'Ships in 1 week', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fashion accessories'), (LAST_INSERT_ID(), 'backpacks');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Women Handbag Black', 'Elegance Collection', 'womens-bags', 'The Women Handbag in Black is a classic and versatile accessory that complements various outfits. With a timeless black color and functional design, it''s a must-have in every woman''s wardrobe.', 59.99, 11.63, 11, 9, 'WOM-ELE-WOM-176', 6, 29.76, 12.34, 15.82, 'Lifetime warranty', 'Ships in 1 month', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fashion accessories'), (LAST_INSERT_ID(), 'handbags');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Black Women''s Gown', NULL, 'womens-dresses', 'The Black Women''s Gown is an elegant and timeless evening gown. With a sleek black design, it''s perfect for formal events and special occasions, exuding sophistication and style.', 129.99, 10.48, 25, 5, 'WOM-BRD-BLA-177', 2, 7.86, 9.02, 25.82, 'Lifetime warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'gowns');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Corset Leather With Skirt', NULL, 'womens-dresses', 'The Corset Leather With Skirt is a bold and edgy ensemble that combines a stylish corset with a matching skirt. Ideal for fashion-forward individuals, it makes a statement at any event.', 89.99, 16.26, 30, 3, 'WOM-BRD-COR-178', 1, 6.01, 12.6, 11.62, '2 year warranty', 'Ships overnight', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'corsets'), (LAST_INSERT_ID(), 'skirts');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Corset With Black Skirt', NULL, 'womens-dresses', 'The Corset With Black Skirt is a chic and versatile outfit that pairs a fashionable corset with a classic black skirt. It offers a trendy and coordinated look for various occasions.', 79.99, 15.06, 33, 5, 'WOM-BRD-COR-179', 7, 17.56, 28.42, 23.95, '1 month warranty', 'Ships in 1 week', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'corsets'), (LAST_INSERT_ID(), 'skirts');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Dress Pea', NULL, 'womens-dresses', 'The Dress Pea is a stylish and comfortable dress with a pea pattern. Perfect for casual outings, it adds a playful and fun element to your wardrobe, making it a great choice for day-to-day wear.', 49.99, 17.68, 6, 6, 'WOM-BRD-DRE-180', 1, 28.51, 20.99, 12.58, '2 year warranty', 'Ships overnight', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'dresses');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Marni Red & Black Suit', NULL, 'womens-dresses', 'The Marni Red & Black Suit is a sophisticated and fashion-forward suit ensemble. With a combination of red and black tones, it showcases a modern design for a bold and confident look.', 179.99, 19.02, 62, 2, 'WOM-BRD-MAR-181', 3, 26.02, 9.93, 25.48, '5 year warranty', 'Ships in 2 weeks', '90 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'clothing'), (LAST_INSERT_ID(), 'suits');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Green Crystal Earring', NULL, 'womens-jewellery', 'The Green Crystal Earring is a dazzling accessory that features a vibrant green crystal. With a classic design, it adds a touch of elegance to your ensemble, perfect for formal or special occasions.', 29.99, 15.24, 54, 15, 'WOM-BRD-GRE-182', 2, 14.61, 22.92, 12.52, '5 year warranty', 'Ships in 3-5 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fashion accessories'), (LAST_INSERT_ID(), 'earrings');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Green Oval Earring', NULL, 'womens-jewellery', 'The Green Oval Earring is a stylish and versatile accessory with a unique oval shape. Whether for casual or dressy occasions, its green hue and contemporary design make it a standout piece.', 24.99, 15.18, 73, 19, 'WOM-BRD-GRE-183', 10, 8.48, 6.24, 5.72, '3 months warranty', 'Ships in 3-5 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fashion accessories'), (LAST_INSERT_ID(), 'earrings');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Tropical Earring', NULL, 'womens-jewellery', 'The Tropical Earring is a fun and playful accessory inspired by tropical elements. Featuring vibrant colors and a lively design, it''s perfect for adding a touch of summer to your look.', 19.99, 0.76, 1, 31, 'WOM-BRD-TRO-184', 3, 14.99, 15.76, 16.09, '3 year warranty', 'Ships in 1-2 business days', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'fashion accessories'), (LAST_INSERT_ID(), 'earrings');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Black & Brown Slipper', 'Comfort Trends', 'womens-shoes', 'The Black & Brown Slipper is a comfortable and stylish choice for casual wear. Featuring a blend of black and brown colors, it adds a touch of sophistication to your relaxation.', 19.99, 3.33, 3, 47, 'WOM-COM-BLA-185', 5, 21.35, 26.21, 17, 'Lifetime warranty', 'Ships in 1 month', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'slippers');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Calvin Klein Heel Shoes', 'Calvin Klein', 'womens-shoes', 'Calvin Klein Heel Shoes are elegant and sophisticated, designed for formal occasions. With a classic design and high-quality materials, they complement your stylish ensemble.', 79.99, 3.19, 93, 6, 'WOM-CAL-CAL-186', 6, 29.12, 20.94, 20.65, '2 year warranty', 'Ships in 1 week', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'heel shoes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Golden Shoes Woman', 'Fashion Diva', 'womens-shoes', 'The Golden Shoes for Women are a glamorous choice for special occasions. Featuring a golden hue and stylish design, they add a touch of luxury to your outfit.', 49.99, 13.93, 88, 7, 'WOM-FAS-GOL-187', 4, 16.38, 20.06, 8.8, '6 months warranty', 'Ships in 2 weeks', '7 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'women''s shoes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Pampi Shoes', 'Pampi', 'womens-shoes', 'Pampi Shoes offer a blend of comfort and style for everyday use. With a versatile design, they are suitable for various casual occasions, providing a trendy and relaxed look.', 29.99, 14.14, 49, 12, 'WOM-PAM-PAM-188', 7, 29.43, 22.65, 16.12, 'No warranty', 'Ships in 1 week', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'casual shoes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Red Shoes', 'Fashion Express', 'womens-shoes', 'The Red Shoes make a bold statement with their vibrant red color. Whether for a party or a casual outing, these shoes add a pop of color and style to your wardrobe.', 34.99, 17.69, 7, 8, 'WOM-FAS-SHO-189', 10, 15.21, 11.62, 22.63, 'No warranty', 'Ships in 1 month', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'footwear'), (LAST_INSERT_ID(), 'women''s shoes');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'IWC Ingenieur Automatic Steel', 'IWC', 'womens-watches', 'The IWC Ingenieur Automatic Steel watch is a durable and sophisticated timepiece. With a stainless steel case and automatic movement, it combines precision and style for watch enthusiasts.', 4999.99, 9.45, 90, 1, 'WOM-IWC-ING-190', 3, 24.77, 24.66, 6.09, '1 year warranty', 'Ships overnight', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'luxury watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Rolex Cellini Moonphase', 'Rolex', 'womens-watches', 'The Rolex Cellini Moonphase watch is a masterpiece of horology. Featuring a moon phase complication, it showcases the craftsmanship and elegance that Rolex is renowned for.', 15999.99, 4.11, 52, 1, 'WOM-ROL-ROL-191', 10, 12.5, 20.63, 25.04, '1 month warranty', 'Ships in 1 week', '30 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'luxury watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Rolex Datejust Women', 'Rolex', 'womens-watches', 'The Rolex Datejust Women''s watch is an iconic timepiece designed for women. With a timeless design and a date complication, it offers both elegance and functionality.', 10999.99, 15.94, 4, 1, 'WOM-ROL-ROL-192', 3, 23.23, 7.19, 28.95, '5 year warranty', 'Ships in 2 weeks', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'luxury watches'), (LAST_INSERT_ID(), 'women''s watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Watch Gold for Women', 'Fashion Gold', 'womens-watches', 'The Gold Women''s Watch is a stunning accessory that combines luxury and style. Featuring a gold-plated case and a chic design, it adds a touch of glamour to any outfit.', 799.99, 18.34, 0, 1, 'WOM-FAS-WAT-193', 1, 18.85, 28.59, 7.21, '2 year warranty', 'Ships in 1-2 business days', '60 days return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'women''s watches');

INSERT INTO products (seller_id, name, brand, category, description, price, discount_percentage, stock, minimum_order_quantity, sku, weight, width, height, depth, warranty_information, shipping_information, return_policy, active)
VALUES (NULL, 'Women''s Wrist Watch', 'Fashion Co.', 'womens-watches', 'The Women''s Wrist Watch is a versatile and fashionable timepiece for everyday wear. With a comfortable strap and a simple yet elegant design, it complements various styles.', 129.99, 12.6, 12, 5, 'WOM-FAS-WOM-194', 1, 26.1, 22.03, 21.61, '1 year warranty', 'Ships in 2 weeks', 'No return policy', TRUE);
INSERT INTO product_tags (product_id, tag) VALUES (LAST_INSERT_ID(), 'watches'), (LAST_INSERT_ID(), 'women''s watches');
