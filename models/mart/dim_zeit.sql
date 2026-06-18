WITH 

emp_min AS (
            SELECT MIN(hiredate) min_datum
            FROM {{ source('scott', 'emp') }}
),


dim_zeit AS (
    SELECT 
        DATEADD(DAY, 
                ROW_NUMBER() OVER (ORDER BY 1) - 1, 
                (SELECT min_datum
                 FROM emp_min) - 10) AS dim_zeit,
        QUARTER(dim_zeit) AS quartal,
        week(dim_zeit) AS woche,
        DAY(dim_zeit) AS tag,
        MONTH(dim_zeit) AS monat,
        YEAR(dim_zeit) AS jahr
        
    FROM TABLE(GENERATOR(ROWCOUNT => 365*10))
)
SELECT *
FROM dim_zeit