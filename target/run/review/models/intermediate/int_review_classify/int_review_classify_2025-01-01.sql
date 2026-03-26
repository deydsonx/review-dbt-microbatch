
    
  create or replace table `ecommerce`.`intermediate`.`int_review_classify`
  
  (
    
      `id_review` string,
    
      `id_order` string,
    
      `ts_review_answer` timestamp,
    
      `category_label` string
    
    
  )

  
    using delta
  
  
  
  
  
  
  
  

  