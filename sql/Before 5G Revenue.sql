-- Before 5G Revenue
SELECT
    SUM(f.atliqo_revenue_crores) AS revenue_before_5g_crores
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
WHERE d.before_after_5g = 'Before 5G';
