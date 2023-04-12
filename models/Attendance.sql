{{
    config(
        materialized='incremental',
    )
}}
select "_airbyte_ab_id" as "Id", "Employ ID" as "EmployeeId", 'Office' as "WorkType", Now() as "StartTime", Now() as "EndTime", 
null as "CreatedBy", null as "UpdatedBy", Now() as "CreatedAt", Now() as "UpdatedAt"
from {{ source('attendances','attendances') }}
