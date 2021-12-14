SELECT 
    {{dbt_utils.surrogate_key(['open_data_channel_type'])  }} as channel_dim_id,
    open_data_channel_type as channel_type
FROM `cis4400etl.data.311-data`
WHERE open_data_channel_type = 'MOBILE' OR open_data_channel_type = 'PHONE'
OR open_data_channel_type = 'ONLINE' or open_data_channel_type = 'OTHER'