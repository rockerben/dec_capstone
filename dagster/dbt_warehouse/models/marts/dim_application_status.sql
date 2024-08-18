{{ config(materialized='table') }}

WITH source AS (
    SELECT DISTINCT
        APPLICATIONSTATUS AS application_status
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['application_status']) }} AS application_status_id,
    application_status,
    CURRENT_TIMESTAMP() AS created_at
FROM source
