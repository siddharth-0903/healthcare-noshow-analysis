SELECT 
    sms_received,
    COUNT(*)                                          AS total_appointments,
    SUM(no_show)                                      AS no_shows,
    ROUND(AVG(no_show::NUMERIC) * 100, 2)             AS no_show_rate_pct
FROM appointments
GROUP BY sms_received
ORDER BY sms_received;