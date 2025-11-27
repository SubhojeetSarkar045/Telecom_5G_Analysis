-- Monthly Revenue Trend
SELECT
    d.date,
    d.month_name,
    SUM(f.atliqo_revenue_crores) AS monthly_revenue_crores
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
GROUP BY d.date, d.month_name
ORDER BY d.date;
