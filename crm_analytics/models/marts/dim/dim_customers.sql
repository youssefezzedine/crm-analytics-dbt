with cases as (
    select distinct
        customer_id
    from {{ ref('stg_crm__cases') }}
)

select
    customer_id
from cases
