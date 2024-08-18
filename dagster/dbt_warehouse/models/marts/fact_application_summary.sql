{{ config(materialized='table') }}

WITH source AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['Council:CouncilName']) }} AS council_id,
        {{ dbt_utils.generate_surrogate_key(['APPLICATIONTYPE']) }} AS application_type_id,
        {{ dbt_utils.generate_surrogate_key(['APPLICATIONSTATUS']) }} AS application_status_id,
        COSTOFDEVELOPMENT AS cost_of_development,
        NUMBEROFNEWDWELLINGS AS number_of_new_dwellings,
        NUMBEROFEXISTINGLOTS AS number_of_existing_lots,
        NUMBEROFPROPOSEDLOTS AS number_of_proposed_lots
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT
    council_id,
    application_type_id,
    application_status_id,
    SUM(cost_of_development) AS total_cost_of_development,
    SUM(number_of_new_dwellings) AS total_new_dwellings,
    SUM(number_of_existing_lots) AS total_existing_lots,
    SUM(number_of_proposed_lots) AS total_proposed_lots,
    CURRENT_TIMESTAMP() AS created_at
FROM source
GROUP BY
    council_id, application_type_id, application_status_id
