with evaluations as (
    select * from {{ ref('stg_quality__evaluations') }}
),

questions as (
    select * from {{ ref('stg_quality__evaluation_questions') }}
),

joined as (
    select
        e.evaluation_id,
        e.case_id,
        e.specialist_id,
        e.evaluator_id,
        e.overall_rating,
        e.evaluated_at,
        q.question_id,
        q.question_text,
        q.rating        as question_rating
    from evaluations e
    left join questions q
        on e.evaluation_id = q.evaluation_id
)

select * from joined
