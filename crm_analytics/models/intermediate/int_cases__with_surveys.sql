with cases as (
    select * from {{ ref('stg_crm__cases') }}
),

surveys_sent as (
    select * from {{ ref('stg_crm__surveys_sent') }}
),

responses as (
    select * from {{ ref('stg_crm__survey_responses') }}
),

joined as (
    select
        c.case_id,
        c.channel,
        c.customer_id,
        c.specialist_id,
        c.opened_at,
        c.closed_at,
        ss.survey_id,
        ss.sent_at,
        r.response_id,
        r.agent_satisfaction_score,
        r.first_contact_resolution,
        r.nps_score,
        r.responded_at
    from cases c
    left join surveys_sent ss
        on c.case_id = ss.case_id
    left join responses r
        on ss.survey_id = r.survey_id
)

select * from joined
