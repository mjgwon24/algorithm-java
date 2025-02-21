WITH RankedFishes AS (
    SELECT ID, FISH_TYPE, LENGTH, 
           RANK() OVER (PARTITION BY FISH_TYPE ORDER BY LENGTH DESC) AS rnk
    FROM FISH_INFO
)

SELECT f.ID, fn.FISH_NAME, f.LENGTH
FROM RankedFishes f
JOIN FISH_NAME_INFO fn ON f.FISH_TYPE = fn.FISH_TYPE
WHERE f.rnk = 1
ORDER BY f.ID;
