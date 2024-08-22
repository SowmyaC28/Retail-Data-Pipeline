
  
    

    create or replace table `retail-data-pipeline-432716`.`retail`.`report_product_invoices`
    
    

    OPTIONS()
    as (
      -- report_product_invoices.sql
SELECT
  p.product_id,
  p.stock_code,
  p.description,
  SUM(fi.quantity) AS total_quantity_sold
FROM `retail-data-pipeline-432716`.`retail`.`fct_invoices` fi
JOIN `retail-data-pipeline-432716`.`retail`.`dim_product` p ON fi.product_id = p.product_id
GROUP BY p.product_id, p.stock_code, p.description
ORDER BY total_quantity_sold DESC
LIMIT 10
    );
  