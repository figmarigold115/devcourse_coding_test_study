SELECT COUNT(1) AS FISH_COUNT
FROM FISH_INFO AS fi INNER JOIN FISH_NAME_INFO AS fni ON fi.FISH_TYPE = fni.FISH_TYPE
WHERE FISH_NAME = 'BASS' OR FISH_NAME = 'SNAPPER'