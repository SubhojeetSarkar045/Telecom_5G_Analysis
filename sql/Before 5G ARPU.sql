-- Before 5G ARPU
SELECT
    AVG(f.arpu) AS arpu_before_5g
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date
WHERE d.before_after_5g = 'Before 5G';
