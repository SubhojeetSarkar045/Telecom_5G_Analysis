-- Average Revenue Per User (ARPU) Top 5 Cities
SELECT
    ci.city_name,
    AVG(f.arpu) AS avg_arpu
FROM fact_atliqo_metrics f
JOIN dim_cities ci ON f.city_code = ci.city_code
GROUP BY ci.city_name
ORDER BY avg_arpu DESC
LIMIT 5;
