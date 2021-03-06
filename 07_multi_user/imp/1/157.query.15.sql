-- start query 15 in stream 0 using template query15.tpl
select  ca_zip
       ,sum(cs_sales_price)
 from catalog_sales
     ,customer
     ,customer_address
     ,date_dim
 where
        --removed Cloudera cheat
        --cs_sold_date_sk between 2450905 and 2450997
        --and 
        cs_bill_customer_sk = c_customer_sk
        and c_current_addr_sk = ca_address_sk
        and ( substr(ca_zip,1,5) in ('85669', '86197','88274','83405','86475',
                                   '85392', '85460', '80348', '81792')
              or ca_state in ('CA','WA','GA')
              or cs_sales_price > 500)
        and cs_sold_date_sk = d_date_sk
        --removed Cloudera cheat
        --and cs_sold_date_sk between 2450906 and 2450996
        and d_qoy = 2 and d_year = 1998
 group by ca_zip
 order by ca_zip
 limit 100;
