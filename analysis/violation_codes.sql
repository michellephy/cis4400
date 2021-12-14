with codes as (
    select DISTINCT 
        violation_code
FROM {{ref ('dim_violation')}}
order by violation_code desc
LIMIT 10
),

countofviolations as (
    select 
        count(violation_code)
    from {{ref ('dim_violation')  }}
    WHERE count
)
