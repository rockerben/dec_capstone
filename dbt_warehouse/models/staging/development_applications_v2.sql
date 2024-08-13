{{ config(materialized="table")    }}



WITH extracted_council_name AS (
    SELECT 
        Council:CouncilName::string AS CouncilName
    FROM {{ ref('developmentapplications') }}
)

SELECT
    CouncilName
FROM extracted_council_name

    


