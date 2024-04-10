SELECT A.APNT_NO, P.PT_NAME, P.PT_NO, A.MCDP_CD, D.DR_NAME, A.APNT_YMD
FROM (SELECT *
      FROM APPOINTMENT
      WHERE APNT_CNCL_YN = 'N'
        AND APNT_YMD LIKE '2022-04-13%'
     ) AS A
    LEFT OUTER JOIN DOCTOR AS D ON A.MDDR_ID = D.DR_ID
    LEFT OUTER JOIN PATIENT AS P ON A.PT_NO = P.PT_NO
WHERE A.MCDP_CD = 'CS'
ORDER BY A.APNT_YMD