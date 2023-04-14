{{
    config(
        materialized='incremental',
        pre_hook= delete_attendance_data(4)
    )
}}
select uuid_generate_v4() as "Id", 
      "Employ ID" as "UserId", 
      'Office' as "WorkType", 
      MIN("Time"::timestamp) as "StartTime", 
      MAX("Time"::timestamp) as "EndTime", 
      null as "CreatedBy", 
      null as "UpdatedBy", 
      Now() as "CreatedAt", 
      Now() as "UpdatedAt"
from {{ source('attendances','attendance_csv') }}
group by "Employ ID", DATE("Time"::timestamp)