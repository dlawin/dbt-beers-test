select
  {{ dbt_utils.star(ref('beers_with_breweries')) }}
from {{ ref('beers_with_breweries') }}
