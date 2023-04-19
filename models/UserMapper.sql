{{
    config(
        materialized='table',
    )
}}
select uuid_generate_v4() as "UserId", 
      "macc"::text as "RecordUserId", 
      null as "CreatedBy", 
      null as "UpdatedBy", 
      Now() as "CreatedAt", 
      Now() as "UpdatedAt"
from {{ source('attendances','record_user') }}
