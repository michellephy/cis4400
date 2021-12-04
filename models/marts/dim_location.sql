SELECT 
    {{dbt_utils.surrogate_key(['incident_address', 'borough', 'zipcode'])  }} as location_dim_id,    
    incident_address, 
    borough,
    zipcode
FROM 
(
    SELECT 
        incident_address,
        borough,
        CAST(incident_zip AS INT) as zipcode
    FROM  `cis4400etl.data.311-data`
    WHERE incident_zip <> 'NA' AND incident_zip <>'NY' AND incident_zip <> 'N/A' 
    UNION ALL
    SELECT 
        street as incident_address,
        boro as borough,
        CAST(zipcode as INT)  as zipcode
    FROM `cis4400etl.data.restaurant-data` 
    WHERE zipcode is not null
)
WHERE borough = 'Queens' or borough = 'Brooklyn' or borough = 'Manhattan' or borough = 'Bronx' or borough = 'Staten Island' 
