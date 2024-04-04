SELECT CATEGORY, PRICE, PRODUCT_NAME
FROM (
    SELECT CATEGORY, PRICE, PRODUCT_NAME, 
        RANK() OVER (PARTITION BY CATEGORY ORDER BY PRICE DESC) AS EXP
    FROM FOOD_PRODUCT
    WHERE CATEGORY = '과자' OR CATEGORY = '국' OR CATEGORY = '김치' OR CATEGORY = '식용유'
) AS PRICE_RANK
WHERE EXP = 1
ORDER BY 2 DESC