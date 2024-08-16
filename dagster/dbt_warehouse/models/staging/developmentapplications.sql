{{ config(materialized="table")    }}

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
    NumberOfNewDwellings,
    NumberOfProposedLots,
    DeterminationAuthority,
    SubdivisionProposedFlag,
    EPIVariationProposedFlag,
    AssessmentExhibitionEndDate,
    DevelopmentSubjectToSICFlag,
    AssessmentExhibitionStartDate,
    ModificationApplicationNumber,
    PlanningPortalApplicationNumber
    --VariationToDevelopmentStandardsApprovedFlag




    
FROM {{ source('developmentapplications', "onlinedav5") }}

