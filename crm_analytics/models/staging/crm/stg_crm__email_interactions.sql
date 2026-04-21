with source as (
    select * from {{ ref('raw_email_interactions') }}
),
renamed as (
    select
        interaction_id,
        case_id,
        customer_account,
        specialist_id,
        interaction_direction,
        started_at,
        ended_at,
        duration_seconds
    from source
)
select * from renamed
