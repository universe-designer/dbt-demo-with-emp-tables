

{% set manager_roles = ["PRESIDENT", "MANAGER"] %}

with 

stage as (

    select * from {{ ref('stg_scott__emp') }}

),

dimension as (

    select mitarbeiter_nr, 
    CASE 
    {% for manager_role in manager_roles %}
    WHEN rolle = '{{manager_role}}' THEN 1 
    {% endfor %}
    ELSE 0 
    END AS manager_flag,
    name, rolle
    from stage
    WHERE abteilung_nr != 40

)

select * from dimension
