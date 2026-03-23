
    
  create or replace table `ecommerce`.`dev_intermediate_test`.`int_review_classify`
  
  (
    
      `id_review` string,
    
      `id_order` string,
    
      `ts_review_answer` timestamp,
    
      `category_label` string
    
    
  )

  
    using delta
  
  
  
  CLUSTER BY (ts_review_answer)
  
  
  
  

  