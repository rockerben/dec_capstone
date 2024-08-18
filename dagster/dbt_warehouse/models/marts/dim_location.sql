{{ config(materialized='table') }}

WITH source AS (
    SELECT
        location[0]:FullAddress::STRING AS full_address,
        location[0]:Lot[0]:Lot::STRING AS lot_number,
        location[0]:Lot[0]:PlanLabel::STRING AS plan_label,
        location[0]:Postcode::STRING AS postcode,
        location[0]:State::STRING AS state,
        location[0]:StreetName::STRING AS street_name,
        location[0]:StreetNumber1::STRING AS street_number,
        location[0]:StreetType::STRING AS street_type,
        location[0]:Suburb::STRING AS suburb,
        location[0]:X::STRING AS longitude,
        location[0]:Y::STRING AS latitude
    FROM {{ source('developmentapplications', 'onlinedav5') }}
)

SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key([
        'full_address', 'lot_number', 'plan_label', 'postcode', 'state',
        'street_name', 'street_number', 'street_type', 'suburb'
    ]) }} AS location_id,
    full_address,
    lot_number,
    plan_label,
    postcode,
    state,
    street_name,
    street_number,
    street_type,
    suburb,
    longitude,
    latitude,
    CURRENT_TIMESTAMP() AS created_at
FROM source
