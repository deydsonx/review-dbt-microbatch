{{ config( 
    materialized='table', 
    liquid_clustered_by=['ts_review_answer'],
    tblproperties={
      'delta.autoOptimize.optimizeWrite': 'true',
      'delta.autoOptimize.autoCompact': 'true'
    }
    ) 
}}

SELECT
    av.id_review,
    av.id_order,
    av.nu_review_score,
    av.ts_review_answer,
    av.nm_review_title,
    av.nm_review_message,
    av.in_has_comment,
    st.sentiment_label,
    ct.category_label
FROM 
    {{ ref('stg_review') }}             AS av
LEFT JOIN 
    {{ ref('int_review_classify') }}    AS ct 
    USING (id_review, id_order, ts_review_answer)
LEFT JOIN 
    {{ ref('int_review_sentiment') }}   AS st
    USING (id_review, id_order, ts_review_answer)