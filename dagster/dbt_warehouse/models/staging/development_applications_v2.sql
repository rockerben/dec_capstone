{{ config(materialized="table")    }}



WITH extracted_fields AS (
    SELECT 
        Council:CouncilName::string AS CouncilName,
        LOCATION[0]:FullAddress::string AS FullAddress,
        LOCATION[0]:Postcode::string AS Postcode,
        LOCATION[0]:State::string AS State,
        LOCATION[0]:StreetName::string AS StreetName,
        LOCATION[0]:StreetNumber1::string AS StreetNumber1,
        LOCATION[0]:StreetType::string AS StreetType,
        LOCATION[0]:Suburb::string AS Suburb,
        LOCATION[0]:X::string AS X,
        LOCATION[0]:Y::string AS Y


    FROM {{ ref('developmentapplications') }}
)

SELECT
    CouncilName,
    FullAddress,
    Postcode,
    State,
    StreetName,
    StreetNumber1,
    StreetType,
    Suburb,
    X,
    Y
FROM extracted_fields

    


