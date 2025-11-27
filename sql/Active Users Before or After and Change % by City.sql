-- Active Users Before/After and Change % by City
WITH city_active AS (
    SELECT
        f.city_code,
        d.before_after_5g,
        SUM(f.active_users_lakhs) AS active_users_lakhs
    FROM fact_atliqo_metrics f
    JOIN dim_date d ON f.date = d.date
    GROUP BY f.city_code, d.before_after_5g
)
SELECT
    c.city_code,
    ci.city_name,
    SUM(CASE WHEN c.before_after_5g = 'Before 5G'
             THEN c.active_users_lakhs END) AS active_before_5g_lakhs,
    SUM(CASE WHEN c.before_after_5g = 'After 5G'
             THEN c.active_users_lakhs END) AS active_after_5g_lakhs,
    ROUND(
        (SUM(CASE WHEN c.before_after_5g = 'After 5G'
                  THEN c.active_users_lakhs END)
       - SUM(CASE WHEN c.before_after_5g = 'Before 5G'
                  THEN c.active_users_lakhs END)
        )
        / NULLIF(SUM(CASE WHEN c.before_after_5g = 'Before 5G'
                          THEN c.active_users_lakhs END), 0) * 100,
        2
    ) AS active_users_change_pct
FROM city_active c
JOIN dim_cities ci ON c.city_code = ci.city_code
GROUP BY c.city_code, ci.city_name
ORDER BY active_users_change_pct ASC;
