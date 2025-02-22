WITH AVGSCORE AS (
    SELECT REST_ID, FORMAT(AVG(REVIEW_SCORE), 2) AS SCORE
    FROM REST_REVIEW
    GROUP BY 1
)

SELECT R.REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS, SCORE
FROM REST_INFO AS R INNER JOIN AVGSCORE AS A
    ON R.REST_ID = A.REST_ID
WHERE ADDRESS LIKE '서울%'
ORDER BY SCORE DESC, FAVORITES DESC