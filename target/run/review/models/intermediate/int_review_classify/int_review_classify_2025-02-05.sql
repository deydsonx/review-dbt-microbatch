INSERT INTO `ecommerce`.`default_intermediate_test`.`int_review_classify`
 REPLACE WHERE cast(ts_review_answer as TIMESTAMP) >= '2025-02-05 00:00:00+00:00' and cast(ts_review_answer as TIMESTAMP) < '2025-02-06 00:00:00+00:00'
 TABLE `int_review_classify__dbt_tmp_20250205`