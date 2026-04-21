with source as (
    select * from {{ ref('raw_survey_responses') }}
),
renamed as (
    select
        response_id,
        survey_id,
        case_id,
        customer_id,
        specialist_id,
        agent_satisfaction_score,
        first_contact_resolution,
        nps_score,
        responded_at
    from source
)
select * from renamed
