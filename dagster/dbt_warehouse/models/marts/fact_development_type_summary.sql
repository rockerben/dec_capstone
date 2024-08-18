{{ config(materialized='table') }}

WITH source AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['Council:CouncilName']) }} AS council_id,
        {{ dbt_utils.generate_surrogate_key(['DEVELOPMENTTYPE']) }} AS development_type_id,
        {{ dbt_utils.generate_surrogate_key(['SUBDIVISIONTYPE']) }} AS subdivision_type_id,
        {{ dbt_utils.generate_surrogate_key(['DETERMINATIONAUTHORITY']) }} AS determination_authority_id,
        NUMBEROFSTOREYS AS number_of_storeys,
        COSTOFDEVELOPMENT AS cost_of_development
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT
    council_id,
    development_type_id,
    subdivision_type_id,
    determination_authority_id,
    AVG(number_of_storeys) AS avg_number_of_storeys,
    SUM(cost_of_development) AS total_cost_of_development,
    CURRENT_TIMESTAMP() AS created_at
FROM source
GROUP BY
    council_id, development_type_id, subdivision_type_id, determination_authority_id
