#Query6
SELECT 
    PSP.*, c.cat_name
FROM
    category c
        INNER JOIN
    (SELECT 
        p.pro_id, p.pro_name, p.cat_id, SP.MinProductPrice
    FROM
        product p
    INNER JOIN (SELECT 
        pro_id, MIN(supp_price) AS MinProductPrice
    FROM
        supplier_pricing
    GROUP BY pro_id) AS SP
    WHERE
        SP.pro_id = p.pro_id) AS PSP
WHERE
    PSP.CAT_ID = c.cat_id;