WITH CNTR AS (
    SELECT MEMBER_ID, DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS R
    FROM REST_REVIEW
    GROUP BY 1
),

1ST AS (
    SELECT C.MEMBER_ID, MEMBER_NAME
    FROM CNTR AS C INNER JOIN MEMBER_PROFILE AS M
        ON C.MEMBER_ID = M.MEMBER_ID
    WHERE R = 1
)

SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM 1ST INNER JOIN REST_REVIEW AS R
    ON 1ST.MEMBER_ID = R.MEMBER_ID
ORDER BY 3, 2