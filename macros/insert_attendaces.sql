INSERT INTO Attendance
  ("Id","EmployeeId", "WorkType", "StartTime", "EndTime", "CreatedAt", "UpdatedAt")
SELECT  "_airbyte_ab_id", "Employ ID",'Office' as WorkType, "Time", null as EndTime, Now(), Now()
FROM {{ ref('select_attendaces') }}
