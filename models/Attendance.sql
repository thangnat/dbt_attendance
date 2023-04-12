{{
    config(
        materialized='incremental',
        pre_hook= delete_attendance_data(4)
    )
}}
select uuid_generate_v4() as "Id", 
      "Employ ID" as "UserId", 
      'Office' as "WorkType", 
      MIN(TO_TIMESTAMP("Time",'MM/DD/YYYY HH24:MI') ) as "StartTime", 
      MAX(TO_TIMESTAMP("Time",'MM/DD/YYYY HH24:MI') ) as "EndTime", 
      null as "CreatedBy", 
      null as "UpdatedBy", 
      Now() as "CreatedAt", 
      Now() as "UpdatedAt"
from {{ source('attendances','attendance_csv') }}
group by "Employ ID", DATE(TO_TIMESTAMP("Time",'MM/DD/YYYY HH24:MI') )
