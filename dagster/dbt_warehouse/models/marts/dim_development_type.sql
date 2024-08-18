{{ config(materialized='table') }}

WITH source AS (
    SELECT
        EXPLODE(DEVELOPMENTTYPE) AS development_type
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['development_type']) }} AS development_type_id,
    development_type,
    CURRENT_TIMESTAMP() AS created_at
FROM source;
