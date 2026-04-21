with source as (
    select * from {{ ref('raw_employees') }}
),
renamed as (
    select
        employee_id,
        full_name,
        email,
        department,
        role,
        team,
        hire_date
    from source
)
select * from renamed
