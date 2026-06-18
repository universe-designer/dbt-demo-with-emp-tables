with 

source as (

    select * from {{ source('scott', 'dept') }}

),

renamed as (

    select
        deptno AS abteilung_nr,
        dname AS abteilung_name,
        loc AS ort

    from source

)

select * from renamed