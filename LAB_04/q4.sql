#Query4
SELECT 
    `order`.*, product.pro_name
FROM
    `order`,
    supplier_pricing,
    product
WHERE
    `order`.PRICING_ID = supplier_pricing.pricing_id
        AND supplier_pricing.pro_id = product.pro_id
        AND `order`.cus_id = 2;