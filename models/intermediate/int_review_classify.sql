{{config(
    materialized='incremental',
    incremental_strategy='microbatch',
    unique_key='id_review',
    event_time='ts_review_answer',
    batch_size='day',
    begin='2025-01-01',
    full_refresh=false
    )
}}

WITH base AS (
    SELECT
        id_review,
        id_order,
        ts_review_answer,
        nm_review_message
    FROM 
        {{ ref('stg_review') }}
    WHERE 
        in_has_comment IS TRUE
)
SELECT
    id_review,
    id_order,
    ts_review_answer,
    AI_CLASSIFY(
            nm_review_message,
            ARRAY(
                'entrega',
                'produto',
                'atendimento',
                'preço',
                'logística'
            )
        ) AS category_label
FROM
    base