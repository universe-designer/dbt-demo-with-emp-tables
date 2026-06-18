with 

stage as (

    select * from {{ ref('stg_scott__emp') }}

),

dimension as (

    select mitarbeiter_nr, name, rolle
    from stage
    WHERE abteilung_nr != 40

)

select * from dimension