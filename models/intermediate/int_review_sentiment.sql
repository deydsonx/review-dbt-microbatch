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
        AND ts_review_answer IS NOT NULL
)
SELECT
    id_review,
    id_order,
    ts_review_answer,
    AI_ANALYZE_SENTIMENT(nm_review_message)  AS sentiment_label
FROM
    base