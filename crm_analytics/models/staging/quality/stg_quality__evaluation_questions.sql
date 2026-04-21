with source as (
    select * from {{ ref('raw_evaluation_questions') }}
),
renamed as (
    select
        question_id,
        evaluation_id,
        question_text,
        rating
    from source
)
select * from renamed
