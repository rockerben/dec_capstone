{{ config(materialized='table') }}

WITH source AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(['Council:CouncilName']) }} AS council_id,
        {{ dbt_utils.generate_surrogate_key(['APPLICATIONTYPE']) }} AS application_type_id,
        {{ dbt_utils.generate_surrogate_key(['APPLICATIONSTATUS']) }} AS application_status_id,
        {{ dbt_utils.generate_surrogate_key(['DEVELOPMENTTYPE']) }} AS development_type_id,
        {{ dbt_utils.generate_surrogate_key(['SUBDIVISIONTYPE']) }} AS subdivision_type_id,
        {{ dbt_utils.generate_surrogate_key(['DETERMINATIONAUTHORITY']) }} AS determination_authority_id,
        COSTOFDEVELOPMENT AS cost_of_development,
        NUMBEROFSTOREYS AS number_of_storeys,
        NUMBEROFEXISTINGLOTS AS number_of_existing_lots,
        NUMBEROFNEWDWELLINGS AS number_of_new_dwellings,
        NUMBEROFPROPOSEDLOTS AS number_of_proposed_lots,
        ACCOMPANIEDBYVPAFLAG AS accompanied_by_vpa,
        SUBDIVISIONPROPOSEDFLAG AS subdivision_proposed,
        EPIVARIATIONPROPOSEDFLAG AS epi_variation_proposed,
        DEVELOPMENTSUBJECTTOSICFLAG AS development_subject_to_sic
    FROM {{ source('developmentapplications', "onlinedav5") }}
)

SELECT
    council_id,
    application_type_id,
    application_status_id,
    development_type_id,
    subdivision_type_id,
    determination_authority_id,
    SUM(cost_of_development) AS total_cost_of_development,
    AVG(number_of_storeys) AS avg_number_of_storeys,
    SUM(number_of_existing_lots) AS total_existing_lots,
    SUM(number_of_new_dwellings) AS total_new_dwellings,
    SUM(number_of_proposed_lots) AS total_proposed_lots,
    COUNT(accompanied_by_vpa) AS vpa_flag_count,
    COUNT(subdivision_proposed) AS subdivision_proposed_count,
    COUNT(epi_variation_proposed) AS epi_variation_proposed_count,
    COUNT(development_subject_to_sic) AS sic_flag_count,
    CURRENT_TIMESTAMP() AS created_at
FROM source
GROUP BY
    council_id, application_type_id, application_status_id, development_type_id, subdivision_type_id, determination_authority_id
