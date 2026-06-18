WITH cube AS (
    
    SELECT *
    FROM {{ ref('rep_anstellungen') }}
    
),
report AS (
    SELECT jahr, rolle, SUM(ms_anstellung) AS total_ms_anstellung
    FROM cube
    GROUP BY jahr, rolle
    ORDER BY jahr, rolle
)
SELECT *
FROM report