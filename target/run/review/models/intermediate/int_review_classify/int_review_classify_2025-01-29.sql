INSERT INTO `ecommerce`.`intermediate`.`int_review_classify`
 REPLACE WHERE cast(ts_review_answer as TIMESTAMP) >= '2025-01-29 00:00:00+00:00' and cast(ts_review_answer as TIMESTAMP) < '2025-01-30 00:00:00+00:00'
 TABLE `int_review_classify__dbt_tmp_20250129`