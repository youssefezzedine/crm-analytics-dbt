with source as (
    select * from {{ ref('raw_phone_interactions') }}
),
renamed as (
    select
        interaction_id,
        case_id,
        customer_account,
        customer_phone,
        specialist_id,
        interaction_direction,
        started_at,
        ended_at,
        duration_seconds
    from source
)
select * from renamed
