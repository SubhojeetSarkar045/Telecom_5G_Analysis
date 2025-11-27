-- After 5G Total Unsubscribed Users
SELECT
    SUM(f.unsubscribed_users_lakhs) AS unsub_after_5g_lakhs
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
WHERE d.before_after_5g = 'After 5G';
