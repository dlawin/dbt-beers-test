SELECT
    beer_id,
    ibu
FROM {{ ref('stg_beers' )}}
WHERE ibu < 0 OR ibu > 140
