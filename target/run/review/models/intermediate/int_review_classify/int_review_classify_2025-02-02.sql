INSERT INTO `ecommerce`.`intermediate`.`int_review_classify`
 REPLACE WHERE cast(ts_review_answer as TIMESTAMP) >= '2025-02-02 00:00:00+00:00' and cast(ts_review_answer as TIMESTAMP) < '2025-02-03 00:00:00+00:00'
 TABLE `int_review_classify__dbt_tmp_20250202`