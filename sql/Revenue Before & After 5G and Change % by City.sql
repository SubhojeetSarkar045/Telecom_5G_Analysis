-- Revenue Before/After 5G and Change % by City
WITH city_rev AS (
    SELECT
        f.city_code,
        d.before_after_5g,
        SUM(f.atliqo_revenue_crores) AS revenue_crores
    FROM fact_atliqo_metrics f
    JOIN dim_date d ON f.date = d.date
    GROUP BY f.city_code, d.before_after_5g
)
SELECT
    c.city_code,
    ci.city_name,
    SUM(CASE WHEN c.before_after_5g = 'Before 5G'
             THEN c.revenue_crores END) AS revenue_before_5g_crores,
    SUM(CASE WHEN c.before_after_5g = 'After 5G'
             THEN c.revenue_crores END) AS revenue_after_5g_crores,
    ROUND(
        (SUM(CASE WHEN c.before_after_5g = 'After 5G'
                  THEN c.revenue_crores END)
       - SUM(CASE WHEN c.before_after_5g = 'Before 5G'
                  THEN c.revenue_crores END)
        )
        / NULLIF(SUM(CASE WHEN c.before_after_5g = 'Before 5G'
                          THEN c.revenue_crores END), 0) * 100,
        2
    ) AS revenue_change_pct
FROM city_rev c
JOIN dim_cities ci ON c.city_code = ci.city_code
GROUP BY c.city_code, ci.city_name
ORDER BY revenue_change_pct ASC;
