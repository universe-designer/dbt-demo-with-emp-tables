with 

stage as (

    select * from {{ ref('stg_scott__dept') }}

),

dimension as (

    select abteilung_nr,
           abteilung_name,
           ort
    from stage
    WHERE abteilung_nr != 40

)

select * from dimension