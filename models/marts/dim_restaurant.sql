SELECT 
    {{dbt_utils.surrogate_key(['DBA', 'cuisine_description'])  }} as restaurant_dim_id,   
    DBA as restaurant_name, 
    cuisine_description as cuisine
FROM `cis4400etl.data.restaurant-data`