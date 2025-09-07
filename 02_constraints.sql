/* TABLE CONSTRAINTS */
ALTER TABLE `delivery_line`
  ADD CONSTRAINT `delivery_line_id_foreign` FOREIGN KEY(`delivery_id`) REFERENCES `delivery`(`id`);

ALTER TABLE `sale_line`
  ADD CONSTRAINT `sale_line_sku_foreign` FOREIGN KEY(`sku`) REFERENCES `product`(`sku`);

ALTER TABLE `sale`
  ADD CONSTRAINT `sale_location_foreign` FOREIGN KEY(`location`) REFERENCES `location`(`code`);

ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_location_foreign` FOREIGN KEY(`location`) REFERENCES `location`(`code`);

ALTER TABLE `delivery_line`
  ADD CONSTRAINT `delivery_line_sku_foreign` FOREIGN KEY(`sku`) REFERENCES `product`(`sku`);

ALTER TABLE `sale`
  ADD CONSTRAINT `sale_employee_foreign` FOREIGN KEY(`employee`) REFERENCES `employee`(`id`);

ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_location_foreign` FOREIGN KEY(`location`) REFERENCES `location`(`code`);

ALTER TABLE `employee`
  ADD CONSTRAINT `employee_home_store_foreign` FOREIGN KEY(`home_store`) REFERENCES `location`(`code`);

ALTER TABLE `sale_line`
  ADD CONSTRAINT `sale_line_id_foreign` FOREIGN KEY(`sale_id`) REFERENCES `sale`(`id`);

ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_sku_foreign` FOREIGN KEY(`sku`) REFERENCES `product`(`sku`);

/* CHECKS */
ALTER TABLE `inventory`
  ADD CONSTRAINT `check_positive_inventory` CHECK (`quantity` >= 0);

ALTER TABLE `sale_line`
  ADD CONSTRAINT `check_positive_quantity` CHECK (`quantity` >= 0);
