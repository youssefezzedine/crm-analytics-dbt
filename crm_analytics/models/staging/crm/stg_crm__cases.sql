with source as (
    select * from {{ ref('raw_cases') }}
),
renamed as (
    select
        case_id,
        channel,
        status,
        customer_id,
        specialist_id,
        opened_at,
        closed_at
    from source
)
select * from renamed
