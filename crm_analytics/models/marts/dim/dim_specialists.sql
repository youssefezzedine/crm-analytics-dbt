with employees as (
    select * from {{ ref('stg_hr__employees') }}
)

select
    employee_id         as specialist_id,
    full_name           as specialist_name,
    email               as specialist_email,
    department,
    role,
    team,
    hire_date
from employees
where role = 'Specialist'
