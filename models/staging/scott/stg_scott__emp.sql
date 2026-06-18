with 

source as (

    select * from {{ source('scott', 'emp') }}

),

renamed as (

    select empno AS mitarbeiter_nr, 
    ename AS name, 
    job AS rolle, 
    deptno AS abteilung_nr,
    hiredate AS einstellung_datum

    from source

)

select * from renamed
