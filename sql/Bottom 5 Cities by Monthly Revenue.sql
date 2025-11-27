-- Bottom 5 Cities by Monthly Revenue (example: September)
SELECT
    d.month_name,
    ci.city_name,
    SUM(f.atliqo_revenue_crores) AS monthly_revenue_crores
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
JOIN dim_cities ci ON f.city_code = ci.city_code
WHERE d.month_name = 'Sep'
GROUP BY d.month_name, d.date, ci.city_name
ORDER BY monthly_revenue_crores ASC
LIMIT 5;
