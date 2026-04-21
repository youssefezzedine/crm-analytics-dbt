with source as (
    select * from {{ ref('raw_evaluations') }}
),
renamed as (
    select
        evaluation_id,
        case_id,
        specialist_id,
        evaluator_id,
        overall_rating,
        evaluated_at
    from source
)
select * from renamed
