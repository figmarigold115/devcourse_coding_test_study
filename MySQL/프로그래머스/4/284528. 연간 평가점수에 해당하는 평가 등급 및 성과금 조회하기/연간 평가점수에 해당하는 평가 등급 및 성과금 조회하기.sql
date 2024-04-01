SELECT EMP_NO, EMP_NAME, GRADE,
    CASE
        WHEN GRADE = 'S' THEN SAL * 0.2
        WHEN GRADE = 'A' THEN SAL * 0.15
        WHEN GRADE = 'B' THEN SAL * 0.1
        ELSE SAL * 0
    END AS BONUS
FROM (
    SELECT E.EMP_NO, EMP_NAME,
        CASE
            WHEN AVG(SCORE) >= 96 THEN 'S'
            WHEN AVG(SCORE) >= 90 THEN 'A'
            WHEN AVG(SCORE) >= 80 THEN 'B'
            ELSE 'C'
        END AS GRADE,
        SAL
    FROM HR_EMPLOYEES AS E INNER JOIN HR_GRADE AS G
        ON E.EMP_NO = G.EMP_NO
    GROUP BY 1
    ORDER BY 1
) AS N_GRADE