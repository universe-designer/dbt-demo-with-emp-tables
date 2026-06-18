with 

source as (

    select * from {{ source('scott', 'emp') }}

),

renamed as (

    select 
    empno AS dim_mitarbeiter_nr, 
    deptno AS dim_abteilung_nr,
    hiredate AS dim_zeit,
    1 AS ms_anstellung

    from source

)

select * from renamed