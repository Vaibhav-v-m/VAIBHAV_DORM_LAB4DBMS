#Query5
SELECT 
    supp_id, COUNT(supp_id)
FROM
    supplier_pricing
GROUP BY supp_id;