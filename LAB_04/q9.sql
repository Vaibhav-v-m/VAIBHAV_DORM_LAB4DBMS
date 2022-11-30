#Query9
SELECT 
    `order`.ORD_ID, `order`.PRICING_ID, rating.RAT_RATSTARS
FROM
    `order`
        INNER JOIN
    rating
WHERE
    `order`.ORD_ID = rating.ORD_ID;
SELECT 
    `order`.PRICING_ID,
    AVG(rating.RAT_RATSTARS) AS rating,
    CASE
        WHEN AVG(rating.RAT_RATSTARS) = 5 THEN 'Excellent Service'
        WHEN AVG(rating.RAT_RATSTARS) > 4 THEN 'Good Service'
        WHEN AVG(rating.RAT_RATSTARS) > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
FROM
    `order`
        INNER JOIN
    rating
WHERE
    `order`.ORD_ID = rating.ORD_ID
GROUP BY `order`.PRICING_ID;

SELECT 
    Y.Final_ID,
    Y.Final_Supp_Name,
    Y.FinalAverage,
    CASE
        WHEN Y.FinalAverage = 5 THEN 'Excellent Service'
        WHEN Y.FinalAverage > 4 THEN 'Good Service'
        WHEN Y.FinalAverage > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
FROM
    (SELECT 
        S.supp_id AS Final_ID,
            supp_name AS Final_Supp_Name,
            X.SupplierAverage AS FinalAverage
    FROM
        SUPPLIER AS S
    INNER JOIN (SELECT 
        ORD_RAT_SP.SUPPLIER_ID,
            AVG(ORD_RAT_SP.RATING_STARS) AS SupplierAverage
    FROM
        (SELECT 
        SP.supp_id AS SUPPLIER_ID,
            ORD_RAT.ORD_ID,
            ORD_RAT.RAT_ID,
            ORD_RAT.rat_ratstars AS RATING_STARS
    FROM
        supplier_pricing AS SP
    INNER JOIN (SELECT 
        O.ORD_ID, O.pricing_id, R.RAT_ID, R.RAT_RATSTARS
    FROM
        `order` O
    INNER JOIN rating R ON O.ord_id = R.ord_id) AS ORD_RAT ON ORD_RAT.pricing_id = SP.pricing_id) AS ORD_RAT_SP
    GROUP BY ORD_RAT_SP.SUPPLIER_ID) AS X ON X.supplier_id = S.supp_Id) AS Y