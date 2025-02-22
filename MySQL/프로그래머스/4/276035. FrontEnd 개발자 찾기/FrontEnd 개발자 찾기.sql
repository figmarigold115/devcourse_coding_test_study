WITH FSKILL AS (
    SELECT *
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End'
)

SELECT DISTINCT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM FSKILL AS F INNER JOIN DEVELOPERS AS D
    ON D.SKILL_CODE | F.CODE = D.SKILL_CODE
ORDER BY 1