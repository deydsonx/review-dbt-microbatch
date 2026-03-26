
  
  
  create or replace view `ecommerce`.`intermediate_staging`.`stg_review`
  
  as (
    WITH source_review AS (
    SELECT
        review_id,
        order_id,
        review_score,
        CAST(review_answer_timestamp AS TIMESTAMP) AS review_answer_timestamp,
        TRIM(review_comment_title)                 AS review_comment_title,
        TRIM(review_comment_message)               AS review_comment_message
    FROM
        `ecommerce`.`bronze`.`reviews`
)
SELECT
    review_id                         AS id_review,
    order_id                          AS id_order,
    review_score                      AS nu_review_score,
    review_answer_timestamp           AS ts_review_answer,
    LOWER(review_comment_title)       AS nm_review_title,
    LOWER(review_comment_message)     AS nm_review_message,
    review_comment_message IS NOT NULL
        AND LENGTH(review_comment_message) > 0
                                      AS in_has_comment
FROM
    source_review
  )
