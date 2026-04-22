with evaluations as (
    select * from {{ ref('int_evaluations__with_scores') }}
),

specialists as (
    select * from {{ ref('dim_specialists') }}
),

employees as (
    select * from {{ ref('stg_hr__employees') }}
)

select
    e.evaluation_id,
    e.case_id,
    e.specialist_id,
    sp.specialist_name,
    sp.team,
    e.evaluator_id,
    ev.full_name        as evaluator_name,
    e.overall_rating,
    e.evaluated_at,
    e.question_id,
    e.question_text,
    e.question_rating
from evaluations e
left join specialists sp
    on e.specialist_id = sp.specialist_id
left join employees ev
    on e.evaluator_id = ev.employee_id
