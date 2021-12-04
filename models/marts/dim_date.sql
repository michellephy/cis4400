SELECT 
    {{dbt_utils.surrogate_key(['date0'])  }} as date_dim_id,    
    date0,
    EXTRACT(month FROM date0) as month,
    EXTRACT(day FROM date0) as day,
    EXTRACT (year from date0) as year
FROM 
(
    SELECT 
        created_date as date0
    FROM  `cis4400etl.data.311-data`
    UNION ALL
    SELECT 
        inspection_date as date0
    FROM `cis4400etl.data.restaurant-data` 
)
WHERE date0 IS NOT NULL