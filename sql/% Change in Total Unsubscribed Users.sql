-- % Change in Total Unsubscribed Users
SELECT
    SUM(CASE WHEN d.before_after_5g = 'Before 5G'
             THEN f.unsubscribed_users_lakhs END) AS unsub_before_5g_lakhs,
    SUM(CASE WHEN d.before_after_5g = 'After 5G'
             THEN f.unsubscribed_users_lakhs END) AS unsub_after_5g_lakhs,
    ROUND(
        (SUM(CASE WHEN d.before_after_5g = 'After 5G'
                  THEN f.unsubscribed_users_lakhs END)
       - SUM(CASE WHEN d.before_after_5g = 'Before 5G'
                  THEN f.unsubscribed_users_lakhs END)
        )
        / NULLIF(SUM(CASE WHEN d.before_after_5g = 'Before 5G'
                          THEN f.unsubscribed_users_lakhs END), 0) * 100,
        2
    ) AS unsubscribed_users_change_pct
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date;
