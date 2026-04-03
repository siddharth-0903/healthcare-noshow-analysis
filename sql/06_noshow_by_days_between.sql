SELECT 
    CASE 
        WHEN days_between = 0          THEN '0 - same day'
        WHEN days_between BETWEEN 1 AND 7   THEN '1-7 days'
        WHEN days_between BETWEEN 8 AND 15  THEN '8-15 days'
        WHEN days_between BETWEEN 16 AND 30 THEN '16-30 days'
        ELSE '30+ days'
    END                                               AS booking_window,
    COUNT(*)                                          AS total_appointments,
    SUM(no_show)                                      AS no_shows,
    ROUND(AVG(no_show::NUMERIC) * 100, 2)             AS no_show_rate_pct
FROM appointments
GROUP BY booking_window
ORDER BY no_show_rate_pct DESC;