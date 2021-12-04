SELECT 
    {{dbt_utils.surrogate_key(['violation_code', 'violation_description', 'score'])  }} as violation_dim_id,
    violation_code,
    violation_description,
    score
FROM `cis4400etl.data.restaurant-data`