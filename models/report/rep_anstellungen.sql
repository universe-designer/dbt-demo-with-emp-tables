WITH report AS (
    SELECT m.*, a.*, z.*, f.ms_anstellung
    FROM {{ ref('fact_anstellung') }} f INNER JOIN {{ ref('dim_zeit') }} z ON f.dim_zeit = z.dim_zeit
    INNER JOIN {{ ref('dim_abteilung') }} a ON f.dim_abteilung_nr = a.abteilung_nr
    INNER JOIN {{ ref('dim_mitarbeiter') }} m ON f.dim_mitarbeiter_nr = m.mitarbeiter_nr 
)
SELECT *
FROM report