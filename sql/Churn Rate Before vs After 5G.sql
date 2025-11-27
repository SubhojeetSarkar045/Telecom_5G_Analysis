-- Churn Rate Before vs After 5G
SELECT
    d.before_after_5g,
    SUM(f.unsubscribed_users_lakhs)                                  AS total_unsub_lakhs,
    SUM(f.active_users_lakhs + f.unsubscribed_users_lakhs)           AS total_base_lakhs,
    ROUND(
        SUM(f.unsubscribed_users_lakhs)
        / NULLIF(SUM(f.active_users_lakhs + f.unsubscribed_users_lakhs), 0) * 100,
        2
    ) AS churn_rate_pct
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
GROUP BY d.before_after_5g;
