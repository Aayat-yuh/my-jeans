/* SAMPLE DATA: JEANS */
INSERT INTO `location` (`code`, `address`, `store_size`, `name`) VALUES
('NYC', '123 Manhattan Ave, New York, NY', 'lg', 'New York Store'),
('LA',  '456 Sunset Blvd, Los Angeles, CA', 'lg', 'Los Angeles Store'),
('CHI', '789 Lakeshore Dr, Chicago, IL', 'md', 'Chicago Store');

INSERT INTO `employee` (`first_name`, `last_name`, `title`, `hire_date`, `home_store`) VALUES
('John', 'Doe', 'Manager', '2020-01-15', 'NYC'),
('Jane', 'Smith', 'Sales Associate', '2021-06-22', 'LA'),
('Alex', 'Johnson', 'Cashier', '2022-03-10', 'CHI');

INSERT INTO `product` (`sku`, `name`, `description`, `msrp`, `sale_price`, `brand`, `fit`, `wash`, `color`, `waist`, `inseam`, `rise`, `stretch_pct`, `gender_category`, `image_url`) VALUES
('JNS001', '501 Original Fit', 'Classic straight-leg denim.', 89.50, 69.99, 'Levi''s', 'straight', 'medium', 'Indigo', 32, 32, 'mid', 1.0, 'M', NULL),
('JNS002', 'Wedgie Straight', 'Vintage-inspired high rise.', 98.00, 79.99, 'Levi''s', 'straight', 'light', 'Light Blue', 27, 28, 'high', 2.0, 'F', NULL),
('JNS003', '510 Skinny', 'Modern skinny silhouette.', 79.50, 59.99, 'Levi''s', 'skinny', 'dark', 'Dark Indigo', 30, 32, 'low', 1.0, 'M', NULL),
('JNS004', 'Relaxed Taper', 'Roomy seat, tapered leg.', 110.00, 89.99, 'Wrangler', 'tapered', 'black', 'Black', 34, 30, 'mid', 0.0, 'U', NULL),
('JNS005', 'Slim Bootcut', 'Slim thigh with bootcut opening.', 99.00, 79.99, 'Lee', 'bootcut', 'grey', 'Grey', 31, 34, 'mid', 1.0, 'U', NULL);

INSERT INTO `inventory` (`sku`, `location`, `quantity`) VALUES
('JNS001', 'NYC', 40),
('JNS002', 'NYC', 20),
('JNS003', 'NYC', 35),
('JNS004', 'NYC', 15),
('JNS005', 'NYC', 18),
('JNS001', 'LA',  25),
('JNS002', 'LA',  30),
('JNS003', 'LA',  10),
('JNS004', 'LA',  22),
('JNS005', 'LA',  16),
('JNS001', 'CHI', 28),
('JNS002', 'CHI', 14),
('JNS003', 'CHI', 20),
('JNS004', 'CHI', 12),
('JNS005', 'CHI', 19);

INSERT INTO `delivery` (`id`, `status`, `date`, `expected_date`, `location`) VALUES
('1671c150-72b8-487a-ab89-a784edc2e988', 'Scheduled', '2024-12-01', '2024-12-10', 'NYC'),
('6faa0baa-e601-47d7-ae69-cb6b8129518a', 'Enroute',   '2024-12-02', '2024-12-12', 'LA'),
('0d292d33-bdb2-40be-91d0-4081f50c0351', 'Scheduled', '2024-12-03', '2024-12-15', 'CHI');

INSERT INTO `delivery_line` (`delivery_id`, `sku`, `quantity`) VALUES
('1671c150-72b8-487a-ab89-a784edc2e988', 'JNS001', 20),
('1671c150-72b8-487a-ab89-a784edc2e988', 'JNS002', 15),
('6faa0baa-e601-47d7-ae69-cb6b8129518a', 'JNS003', 25),
('0d292d33-bdb2-40be-91d0-4081f50c0351', 'JNS004', 30),
('0d292d33-bdb2-40be-91d0-4081f50c0351', 'JNS005', 10);

INSERT INTO `sale` (`id`, `location`, `total`, `employee`, `sale_date`) VALUES
('d2c62158-1019-40ed-98b2-fd70a009356d', 'NYC', 199.97, 10000, '2024-12-01 14:23:00'),
('1dd06aae-cdb6-4e90-a6e7-7e2e2c9f33a6', 'LA',  149.99, 10001, '2024-12-02 16:45:00'),
('3a532684-d71b-416c-88bf-c29dbd1a2cc6', 'CHI',  89.99, 10002, '2024-12-03 10:30:00');

INSERT INTO `sale_line` (`sale_id`, `sku`, `quantity`, `price_at_sale`) VALUES
('d2c62158-1019-40ed-98b2-fd70a009356d', 'JNS001', 1, 69.99),
('d2c62158-1019-40ed-98b2-fd70a009356d', 'JNS003', 1, 59.99),
('d2c62158-1019-40ed-98b2-fd70a009356d', 'JNS005', 1, 69.99),
('1dd06aae-cdb6-4e90-a6e7-7e2e2c9f33a6', 'JNS002', 1, 79.99),
('1dd06aae-cdb6-4e90-a6e7-7e2e2c9f33a6', 'JNS004', 1, 70.00),
('3a532684-d71b-416c-88bf-c29dbd1a2cc6', 'JNS004', 1, 89.99);
