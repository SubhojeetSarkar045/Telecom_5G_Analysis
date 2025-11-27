-- Monthly Total Unsubscribed Users Trend
SELECT
    d.date,
    d.month_name,
    SUM(f.unsubscribed_users_lakhs) AS monthly_unsubscribed_users_lakhs
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
GROUP BY d.date, d.month_name
ORDER BY d.date;
