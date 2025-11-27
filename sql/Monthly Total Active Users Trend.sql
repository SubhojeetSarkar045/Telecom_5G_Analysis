-- Monthly Total Active Users Trend
SELECT
    d.date,
    d.month_name,
    SUM(f.active_users_lakhs) AS monthly_active_users_lakhs
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
GROUP BY d.date, d.month_name
ORDER BY d.date;
