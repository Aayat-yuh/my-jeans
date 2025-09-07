-- Receipt for a sale (jeans)
SELECT s.`id` as `id`,
    s.`sale_date` as `date`, 
    CONCAT(e.`first_name`, ' ', e.`last_name`) as `employee`,
    l.`name` as `location`,
    s.`total` as `total`,
    p.`name` as `product`,
    p.`sku` as `sku`,
    sl.`quantity` as `quantity`,
    sl.`price_at_sale` as `price`,
    (sl.`quantity` * sl.`price_at_sale`) as `line_total`
FROM `sale` s
JOIN `employee` e ON s.`employee` = e.`id`
JOIN `location` l ON s.`location` = l.`code`
JOIN `sale_line` sl ON s.`id` = sl.`sale_id`
JOIN `product` p ON sl.`sku` = p.`sku`
WHERE s.`id` = 'd2c62158-1019-40ed-98b2-fd70a009356d';

-- Total revenue by product.
SELECT p.`sku` as `sku`,
    p.`name` as `product`,
    SUM(sl.`quantity` * sl.`price_at_sale`) as `revenue`
FROM `sale_line` sl
JOIN `product` p ON sl.`sku` = p.`sku`
GROUP BY p.`sku`, p.`name`;

-- Stock levels by location.
SELECT l.`name` as `location`, p.`name` as `product`, p.`sku` as `sku`, i.`quantity` as `stock`
FROM `inventory` i
JOIN `location` l ON i.`location` = l.`code`
JOIN `product` p ON i.`sku` = p.`sku`;

-- Top 10 products by quantity sold.
SELECT p.`sku` as `sku`,
    p.`name` as `product`,
    SUM(sl.`quantity`) as `total_sold`
FROM `sale_line` sl
JOIN `product` p ON sl.`sku` = p.`sku`
GROUP BY `sku`
ORDER BY `total_sold` DESC
LIMIT 10;

-- Next delivery ETA for a product at a location.
SELECT dl.`sku` as `sku`,
    p.`name` as `product`,
    d.`expected_date` as `expected_date`,
    dl.`quantity` as `quantity`
FROM `delivery_line` dl
JOIN `product` p ON dl.`sku` = p.`sku`
JOIN `delivery` d ON dl.`delivery_id` = d.`id`
WHERE d.`status` IN ('Scheduled', 'Enroute')
  AND d.location = 'CHI'
  AND dl.`sku` = 'JNS001'
ORDER BY `expected_date` ASC
LIMIT 1;
