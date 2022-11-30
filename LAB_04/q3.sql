#Query3
SELECT 
    COUNT(OCC.cus_gender) AS TotalNoOfCustomers, OCC.cus_gender
FROM
    (SELECT 
        OC.cus_id, OC.cus_gender, OC.cus_name
    FROM
        (SELECT 
        o.*, c.cus_name, c.cus_gender
    FROM
        `order` o
    INNER JOIN customer c
    WHERE
        o.cus_id = c.cus_id
            AND o.ord_amount >= 3000) AS OC
    GROUP BY OC.cus_id) AS OCC
GROUP BY OCC.cus_gender;