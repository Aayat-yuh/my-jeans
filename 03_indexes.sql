/* INDEXES */
CREATE INDEX `idx_inventory_sku_location` ON `inventory`(`sku`, `location`);
CREATE INDEX `idx_saleline_sku_saleid` ON `sale_line`(`sku`, `sale_id`);
CREATE INDEX `idx_deliveryline_sku_deliveryid` ON `delivery_line`(`sku`, `delivery_id`);
CREATE INDEX `idx_saleline_sku` ON `sale_line`(`sku`);
CREATE INDEX `idx_sales_employee` ON `sale`(`employee`);
CREATE INDEX `idx_delivery_location` ON `delivery`(`location`);
CREATE INDEX `idx_inventory_location` ON `inventory`(`location`);
