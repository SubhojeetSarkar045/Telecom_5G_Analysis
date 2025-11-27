-- Total Active Users (in lakhs)
SELECT
    SUM(active_users_lakhs) AS total_active_users_lakhs
FROM fact_atliqo_metrics;
