-- Unsubscribed Users Before/After and Change % by City
WITH city_unsub AS (
    SELECT
        f.city_code,
        d.before_after_5g,
        SUM(f.unsubscribed_users_lakhs) AS unsubscribed_users_lakhs
    FROM fact_atliqo_metrics f
    JOIN dim_date d ON f.date = d.date
    GROUP BY f.city_code, d.before_after_5g
)
SELECT
    c.city_code,
    ci.city_name,
    SUM(CASE WHEN c.before_after_5g = 'Before 5G'
             THEN c.unsubscribed_users_lakhs END) AS unsub_before_5g_lakhs,
    SUM(CASE WHEN c.before_after_5g = 'After 5G'
             THEN c.unsubscribed_users_lakhs END) AS unsub_after_5g_lakhs,
    ROUND(
        (SUM(CASE WHEN c.before_after_5g = 'After 5G'
                  THEN c.unsubscribed_users_lakhs END)
       - SUM(CASE WHEN c.before_after_5g = 'Before 5G'
                  THEN c.unsubscribed_users_lakhs END)
        )
        / NULLIF(SUM(CASE WHEN c.before_after_5g = 'Before 5G'
                          THEN c.unsubscribed_users_lakhs END), 0) * 100,
        2
    ) AS unsubscribed_users_change_pct
FROM city_unsub c
JOIN dim_cities ci ON c.city_code = ci.city_code
GROUP BY c.city_code, ci.city_name
ORDER BY unsubscribed_users_change_pct DESC;
