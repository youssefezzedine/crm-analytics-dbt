with cases as (
    select * from {{ ref('stg_crm__cases') }}
),

interactions as (
    select * from {{ ref('int_interactions__unified') }}
),

joined as (
    select
        c.case_id,
        c.channel,
        c.status,
        c.customer_id,
        c.specialist_id,
        c.opened_at,
        c.closed_at,
        i.interaction_id,
        i.interaction_direction,
        i.started_at,
        i.ended_at,
        i.duration_seconds
    from cases c
    left join interactions i
        on c.case_id = i.case_id
)

select * from joined
