#Query7

SELECT 
    P.PRO_ID, P.PRO_NAME
FROM
    `order` AS O,
    supplier_pricing AS SP,
    product AS P
WHERE
    O.pricing_id = SP.PRICING_ID
        AND SP.pro_id = P.pro_id
        AND O.ORD_DATE > '2021-10-05';
    