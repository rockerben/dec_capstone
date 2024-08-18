{{ config(materialized='table') }}

WITH source AS (
    SELECT DISTINCT
        APPLICATIONTYPE AS application_type
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['application_type']) }} AS application_type_id,
    application_type,
    CURRENT_TIMESTAMP() AS created_at
FROM source
