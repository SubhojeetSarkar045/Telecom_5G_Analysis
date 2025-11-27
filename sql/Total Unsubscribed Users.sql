-- Total Unsubscribed Users (in lakhs)
SELECT
    SUM(unsubscribed_users_lakhs) AS total_unsubscribed_users_lakhs
FROM fact_atliqo_metrics;
