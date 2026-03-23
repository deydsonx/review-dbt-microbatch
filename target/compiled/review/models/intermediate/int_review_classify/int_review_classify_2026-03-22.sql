

WITH base AS (
    SELECT
        id_review,
        id_order,
        ts_review_answer,
        nm_review_message
    FROM 
        (select * from `ecommerce`.`default_staging_test`.`stg_review` where ts_review_answer >= '2026-03-22 00:00:00+00:00' and ts_review_answer < '2026-03-23 00:00:00+00:00') _dbt_et_filter_subq_stg_review
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