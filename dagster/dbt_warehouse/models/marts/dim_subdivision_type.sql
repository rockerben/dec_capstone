{{ config(materialized='table') }}

WITH source AS (
    SELECT
        EXPLODE(SUBDIVISIONTYPE) AS subdivision_type
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['subdivision_type']) }} AS subdivision_type_id,
    subdivision_type,
    CURRENT_TIMESTAMP() AS created_at
FROM source;
