-- Active User Bottom 5 Cities
SELECT
    ci.city_name,
    SUM(f.active_users_lakhs) AS total_active_users_lakhs
FROM fact_atliqo_metrics f
JOIN dim_cities ci ON f.city_code = ci.city_code
GROUP BY ci.city_name
ORDER BY total_active_users_lakhs ASC
LIMIT 5;
