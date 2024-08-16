{{config(materialized='table')}}


SELECT
    Council,
    Location,
    LodgementDate,
    ApplicationType,
    DevelopmentType,
    NumberOfStoreys,
    SubdivisionType,
    ApplicationStatus,
    CostOfDevelopment,
    DeterminationDate,
    AccompaniedByVPAFlag,
    NumberOfExistingLots,
    NumberOfNewDwellings
FROM {{ ref('developmentapplications') }} 
WHERE LodgementDate >= CURRENT_DATE() - INTERVAL '90 days'





