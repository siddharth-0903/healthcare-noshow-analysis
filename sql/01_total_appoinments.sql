SELECT 
    COUNT(*)                                          AS total_appointments,
    SUM(no_show)                                      AS total_no_shows,
    COUNT(*) - SUM(no_show)                           AS total_shows,
    ROUND(AVG(no_show::NUMERIC) * 100, 2)             AS no_show_rate_pct
FROM appointments;