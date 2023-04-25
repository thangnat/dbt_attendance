{{
    config(
        materialized='incremental',
        pre_hook= delete_attendance_data( var('month'), var('year'))
    )
}}
select uuid_generate_v4() as "Id", 
      b."UserId" as "UserId", 
      'Office' as "WorkType", 
      "StartTime",
      "EndTime",
      null as "CreatedBy", 
      null as "UpdatedBy", 
      Now() as "CreatedAt", 
      Now() as "UpdatedAt"
from (select "Employ ID", 
            MIN("Time"::timestamp) as "StartTime", 
            CONCAT(DATE("Time"::timestamp),'T18:00')::timestamp as "EndTime"
    from  {{ source('attendances','attendance_excel') }} 
    group by "Employ ID", DATE("Time"::timestamp)) a 
    join {{ source('attendances','UserMapper') }} b
    on a."Employ ID"::text = b."RecordUserId"


