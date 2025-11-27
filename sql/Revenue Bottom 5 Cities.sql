-- Revenue Bottom 5 Cities
SELECT
    ci.city_name,
    SUM(f.atliqo_revenue_crores) AS total_revenue_crores
FROM fact_atliqo_metrics f
JOIN dim_cities ci ON f.city_code = ci.city_code
GROUP BY ci.city_name
ORDER BY total_revenue_crores ASC
LIMIT 5;
