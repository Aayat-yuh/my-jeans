/* TRIGGERS */
DELIMITER $$
CREATE TRIGGER `prevent_negative_inventory_sale`
BEFORE INSERT ON `sale_line`
FOR EACH ROW
BEGIN
    DECLARE current_quantity INT DEFAULT 0;
    DECLARE sale_location CHAR(3);

    SELECT `location` INTO sale_location
    FROM `sale`
    WHERE `id` = NEW.`sale_id`;

    SELECT `quantity` INTO current_quantity
    FROM `inventory`
    WHERE `sku` = NEW.`sku` AND `location` = sale_location;

    IF current_quantity - NEW.`quantity` < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient inventory to complete the sale';
    END IF;
END$$
DELIMITER ;
