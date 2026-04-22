with cases as (
    select * from {{ ref('int_cases__with_interactions') }}
),

specialists as (
    select * from {{ ref('dim_specialists') }}
)

select
    c.case_id,
    c.channel,
    c.status,
    c.customer_id,
    c.specialist_id,
    s.specialist_name,
    s.team,
    c.opened_at,
    c.closed_at,
    c.interaction_id,
    c.interaction_direction,
    c.duration_seconds,
    datediff(
        'minute',
        c.opened_at,
        c.closed_at
    )                   as case_handle_time_minutes
from cases c
left join specialists s
    on c.specialist_id = s.specialist_id
