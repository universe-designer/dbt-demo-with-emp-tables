with 

source as (

    select * from {{ ref('stg_scott__emp') }}


),

renamed as (

    select 
    mitarbeiter_nr AS dim_mitarbeiter_nr, 
    abteilung_nr AS dim_abteilung_nr,
    einstellung_datum AS dim_zeit,
    1 AS ms_anstellung

    from source

)

select * from renamed
