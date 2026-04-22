with phone as (
    select
        interaction_id,
        case_id,
        specialist_id,
        customer_account,
        'Phone'             as channel,
        interaction_direction,
        started_at,
        ended_at,
        duration_seconds
    from {{ ref('stg_crm__phone_interactions') }}
),

chat as (
    select
        interaction_id,
        case_id,
        specialist_id,
        customer_account,
        'Chat'              as channel,
        'Inbound'           as interaction_direction,
        started_at,
        ended_at,
        duration_seconds
    from {{ ref('stg_crm__chat_interactions') }}
),

email as (
    select
        interaction_id,
        case_id,
        specialist_id,
        customer_account,
        'Email'             as channel,
        interaction_direction,
        started_at,
        ended_at,
        duration_seconds
    from {{ ref('stg_crm__email_interactions') }}
)

select * from phone
union all
select * from chat
union all
select * from email
