{% macro delete_attendance_data(month, year) %}
    DELETE FROM {{ source('attendances','Attendance') }}
    WHERE DATE_PART('month', "EndTime") = {{ month }} AND DATE_PART('year', "EndTime") = {{ year }}
{% endmacro %}