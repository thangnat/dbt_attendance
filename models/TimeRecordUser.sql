{{
    config(
        materialized='incremental',
    )
}}
select 
      "macc" as "RecordUserId", 
      "tennv" as "FullName", 
      null as "CreatedBy", 
      null as "UpdatedBy", 
      Now() as "CreatedAt", 
      Now() as "UpdatedAt"
from {{ source('attendances','record_user') }}
