
SELECT *
FROM {{ ref('stg_beers') }} beers
JOIN {{ ref('stg_breweries') }} breweries USING (brewery_id)
