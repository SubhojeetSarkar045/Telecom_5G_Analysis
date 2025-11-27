-- Monthly ARPU Trend
SELECT
    d.date,
    d.month_name,
    AVG(f.arpu) AS monthly_arpu
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
GROUP BY d.date, d.month_name
ORDER BY d.date;
