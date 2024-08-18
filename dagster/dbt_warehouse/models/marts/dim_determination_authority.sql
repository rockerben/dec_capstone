{{ config(materialized='table') }}

WITH source AS (
    SELECT DISTINCT
        DETERMINATIONAUTHORITY AS determination_authority
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['determination_authority']) }} AS determination_authority_id,
    determination_authority,
    CURRENT_TIMESTAMP() AS created_at
FROM source
