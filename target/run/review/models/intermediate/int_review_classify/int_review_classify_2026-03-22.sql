INSERT INTO `ecommerce`.`default_intermediate_test`.`int_review_classify`
 REPLACE WHERE cast(ts_review_answer as TIMESTAMP) >= '2026-03-22 00:00:00+00:00' and cast(ts_review_answer as TIMESTAMP) < '2026-03-23 00:00:00+00:00'
 TABLE `int_review_classify__dbt_tmp_20260322`