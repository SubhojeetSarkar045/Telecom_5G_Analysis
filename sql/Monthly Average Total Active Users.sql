-- Monthly Average Total Active Users
SELECT
    SUM(active_users_lakhs) / COUNT(DISTINCT date) AS monthly_avg_active_users_lakhs
FROM fact_atliqo_metrics;
