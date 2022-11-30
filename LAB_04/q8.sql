#Query8
SELECT 
    cus_name, cus_gender
FROM
    customer
WHERE
    (customer.cus_name LIKE 'A%'
        OR customer.cus_name LIKE '%A');


