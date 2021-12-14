With DimID as(
SELECT
	Complaint_type,
    incident_address,
    Created_Date,
	status
    Resolution_Action_Updated_Date
FROM `cis4400etl.data.311-data`
),

Created_Date1 as (
	select 
		date_dim_id,
		created_date
FROM  {{ ref('dim_date_311_data') }}
),

Complaint_types as(
SELECT 
	complaint_dim_id,
	complaint_type,
	status_dim_id,
	status,
	count(complaint_type) as total_complaints
FROM  {{ ref('dim_311_complaint') }}

group by complaint_type,complaint_dim_id,status_dim_id,status
),


final as (
SELECT	
	Complaint_types.status_dim_id,
	Created_Date1.date_dim_id,
	DimID.Resolution_Action_Updated_Date,
	Complaint_types.complaint_dim_id,
	Location.location_dim_id,
	Complaint_types.total_complaints
from Complaint_types
inner join DimID using (complaint_type)
inner join Created_Date1 using (created_date)
where total_complaints IS NOT NULL 

)

select * from final
