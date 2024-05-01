WITH RECURSIVE P AS (
    SELECT ID, PARENT_ID, 1 AS GEN
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL  # 부모가 없는 1세대로부터 시작
    
    UNION ALL
    
    SELECT E.ID, E.PARENT_ID, (P.GEN + 1)
    FROM ECOLI_DATA AS E INNER JOIN P
        ON E.PARENT_ID = P.ID
)

SELECT COUNT(*) AS COUNT, GEN AS GENERATION
FROM P
WHERE ID NOT IN
    (SELECT PARENT_ID FROM ECOLI_DATA WHERE PARENT_ID IS NOT NULL)
GROUP BY 2
ORDER BY 2