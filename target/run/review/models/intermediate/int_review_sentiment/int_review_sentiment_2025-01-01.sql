
    
  create or replace table `ecommerce`.`dev_intermediate_test`.`int_review_sentiment`
  
  (
    
      `id_review` string,
    
      `id_order` string,
    
      `ts_review_answer` timestamp,
    
      `sentiment_label` string
    
    
  )

  
    using delta
  
  
  
  CLUSTER BY (ts_review_answer)
  
  
  
  

  