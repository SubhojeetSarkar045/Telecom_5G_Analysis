-- Monthly Average Total Unsubscribed Users
SELECT
    SUM(unsubscribed_users_lakhs) / COUNT(DISTINCT date) AS monthly_avg_unsubscribed_users_lakhs
FROM fact_atliqo_metrics;
