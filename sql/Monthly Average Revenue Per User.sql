-- Monthly Average Revenue Per User (ARPU per month, then overall avg)
SELECT
    AVG(monthly_arpu) AS monthly_avg_arpu
FROM (
    SELECT
        date,
        AVG(arpu) AS monthly_arpu
    FROM fact_atliqo_metrics
    GROUP BY date
) AS t;
