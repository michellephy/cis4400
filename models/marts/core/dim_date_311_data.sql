SELECT 
    {{dbt_utils.surrogate_key(['Date1'])  }} as date_dim_id,    
    Date1,
    EXTRACT(month FROM Date1) as month,
    EXTRACT(day FROM Date1) as day,
    EXTRACT (year from Date1) as year
FROM 
(
    SELECT 
        created_date as Date1
    FROM  `cis4400etl.data.311-data`
    UNION ALL
    SELECT 
        inspection_date as Date1
    FROM `cis4400etl.data.restaurant-data` 
)
WHERE Date1 IS NOT NULL