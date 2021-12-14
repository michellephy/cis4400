With inspection as(
SELECT
	INSPECTION_DATE,
    INSPECTION_TYPE,
    zipcode,
    violation_code
FROM `cis4400etl.data.restaurant-data`
),

Violation_type as(
SELECT  
    violation_dim_id,
	violation_code,
    count(violation_code) as Total_Number_of_Violations
FROM  {{ ref('dim_violation') }}

group by violation_code,violation_dim_id


),

final as (
SELECT 
    inspection.INSPECTION_DATE,
	violation_type.violation_dim_id,
	Violation_type.Total_Number_of_Violations
from violation_type 
inner join inspection using (violation_code)
)

select * from final
