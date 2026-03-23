

WITH base AS (
    SELECT
        id_review,
        id_order,
        ts_review_answer,
        nm_review_message
    FROM 
        (select * from `ecommerce`.`dev_staging_test`.`stg_review` where ts_review_answer >= '2025-01-27 00:00:00+00:00' and ts_review_answer < '2025-01-28 00:00:00+00:00') _dbt_et_filter_subq_stg_review
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