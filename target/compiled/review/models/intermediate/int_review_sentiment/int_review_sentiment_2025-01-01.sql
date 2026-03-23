

WITH base AS (
    SELECT
        id_review,
        id_order,
        ts_review_answer,
        nm_review_message
    FROM 
        (select * from `ecommerce`.`dev_staging_test`.`stg_review` where ts_review_answer >= '2025-01-01 00:00:00+00:00' and ts_review_answer < '2025-01-02 00:00:00+00:00') _dbt_et_filter_subq_stg_review
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