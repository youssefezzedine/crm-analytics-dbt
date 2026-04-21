with source as (
    select * from {{ ref('raw_surveys_sent') }}
),
renamed as (
    select
        survey_id,
        case_id,
        customer_id,
        specialist_id,
        sent_at
    from source
)
select * from renamed
