SELECT 
    {{dbt_utils.surrogate_key(['complaint_type', 'descriptor'])  }} as complaint_dim_id,
    {{dbt_utils.surrogate_key(['status'])  }} as status_dim_id,
    complaint_type,
    descriptor as complaint_description,
    status
FROM `cis4400etl.data.311-data`
WHERE descriptor IS NOT NULL AND complaint_type IS NOT NULL 