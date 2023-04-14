{% macro delete_attendance_data(month) %}
    DELETE FROM {{ source('attendances','Attendance') }}
    WHERE DATE_PART('month', "EndTime") = {{ month }}
{% endmacro %}