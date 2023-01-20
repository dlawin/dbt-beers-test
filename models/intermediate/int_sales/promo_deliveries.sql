SELECT customer_id,
       'Hoppy' AS promo,
       COUNT(DISTINCT b.beer_name) AS cnt_beers_purchased    
  FROM {{ ref('stg_orders') }} o
  JOIN {{ ref('stg_order_lines') }} ol
  USING (order_no)
  JOIN {{ ref('stg_beers') }} b
  USING(beer_id)
  GROUP BY 1
  HAVING COUNT(CASE WHEN b.bitterness = 'Hoppy' THEN 1 END)
         >
         COUNT(CASE WHEN b.bitterness = 'Malty' THEN 1 END)

UNION

SELECT customer_id,
       'Malty' AS promo,
       COUNT(DISTINCT b.beer_name) AS cnt_beers_purchased
  FROM {{ ref('stg_orders') }} o
  JOIN {{ ref('stg_order_lines') }} ol
  USING (order_no)
  JOIN {{ ref('stg_beers') }} b
  USING(beer_id)
  GROUP BY 1
  HAVING COUNT(CASE WHEN b.bitterness = 'Malty' THEN 1 END)
         >
         COUNT(CASE WHEN b.bitterness = 'Hoppy' THEN 1 END)
