-- Monthly Average Revenue
SELECT
    SUM(atliqo_revenue_crores) / COUNT(DISTINCT date) AS monthly_avg_revenue_crores
FROM fact_atliqo_metrics;
