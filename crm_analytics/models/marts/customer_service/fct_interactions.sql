with interactions as (
    select * from {{ ref('int_interactions__unified') }}
),

specialists as (
    select * from {{ ref('dim_specialists') }}
)

select
    i.interaction_id,
    i.case_id,
    i.customer_account,
    i.channel,
    i.interaction_direction,
    i.started_at,
    i.ended_at,
    i.duration_seconds,
    i.specialist_id,
    s.specialist_name,
    s.team
from interactions i
left join specialists s
    on i.specialist_id = s.specialist_id
