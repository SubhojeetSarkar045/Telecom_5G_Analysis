-- Total Unsubscribed User Top 5 Cities
SELECT
    ci.city_name,
    SUM(f.unsubscribed_users_lakhs) AS total_unsubscribed_users_lakhs
FROM fact_atliqo_metrics f
JOIN dim_cities ci ON f.city_code = ci.city_code
GROUP BY ci.city_name
ORDER BY total_unsubscribed_users_lakhs DESC
LIMIT 5;
