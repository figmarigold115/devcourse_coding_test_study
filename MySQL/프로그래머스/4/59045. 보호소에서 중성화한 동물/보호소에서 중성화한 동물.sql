WITH INTACT AS (
    SELECT ANIMAL_ID, ANIMAL_TYPE, NAME
    FROM ANIMAL_INS
    WHERE SEX_UPON_INTAKE LIKE 'Intact%'
),

FINISH AS (
    SELECT ANIMAL_ID, ANIMAL_TYPE, NAME
    FROM ANIMAL_OUTS
    WHERE SEX_UPON_OUTCOME LIKE 'Spayed%'
        OR SEX_UPON_OUTCOME LIKE 'Neutered%'
)

SELECT I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME
FROM INTACT AS I INNER JOIN FINISH AS F
    ON I.ANIMAL_ID = F.ANIMAL_ID
ORDER BY 1