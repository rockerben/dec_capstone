{{ config(materialized='table') }}

WITH source AS (
    SELECT
        EXPLODE(LOCATION) AS location
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['location']) }} AS location_id,
    location,
    CURRENT_TIMESTAMP() AS created_at
FROM source;
