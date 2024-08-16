
{{config(materialized='table')}}

-- models/flattened_location.sql

WITH top_level AS (
    SELECT
        flattened.value:FullAddress::string AS FullAddress,
        flattened.value:Postcode::string AS Postcode,
        flattened.value:State::string AS State,
        flattened.value:StreetName::string AS StreetName,
        flattened.value:StreetNumber1::string AS StreetNumber1,
        flattened.value:StreetType::string AS StreetType,
        flattened.value:Suburb::string AS Suburb,
        flattened.value:X::string AS X,
        flattened.value:Y::string AS Y,
        flattened.value:Lot::variant AS Lot
    FROM
        {{ ref('developmentapplications') }},
        LATERAL FLATTEN(input => {{ ref('developmentapplications') }}.LOCATION) AS flattened
),

-- Flatten the Lot array
lot_level AS (
    SELECT
        top.FullAddress,
        top.Postcode,
        top.State,
        top.StreetName,
        top.StreetNumber1,
        top.StreetType,
        top.Suburb,
        top.X,
        top.Y,
        lot.value:Lot::string AS Lot,
        lot.value:PlanLabel::string AS PlanLabel
    FROM
        top_level AS top,
        LATERAL FLATTEN(input => top.Lot) AS lot
)

-- Final select
SELECT * FROM lot_level
