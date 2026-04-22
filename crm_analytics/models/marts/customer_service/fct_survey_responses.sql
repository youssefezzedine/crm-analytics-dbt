with surveys as (
    select * from {{ ref('int_cases__with_surveys') }}
),

specialists as (
    select * from {{ ref('dim_specialists') }}
)

select
    s.case_id,
    s.channel,
    s.customer_id,
    s.specialist_id,
    sp.specialist_name,
    sp.team,
    s.survey_id,
    s.sent_at,
    s.response_id,
    s.agent_satisfaction_score,
    s.first_contact_resolution,
    s.nps_score,
    s.responded_at,
    s.closed_at
from surveys s
left join specialists sp
    on s.specialist_id = sp.specialist_id
