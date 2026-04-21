with source as (
    select * from {{ ref('raw_evaluation_types') }}
),
renamed as (
    select
        evaluation_type_id,
        evaluation_type_name,
        description
    from source
)
select * from renamed
