-- % Change in Revenue (After vs Before 5G)
SELECT
    SUM(CASE WHEN d.before_after_5g = 'Before 5G'
             THEN f.atliqo_revenue_crores END) AS revenue_before_5g_crores,
    SUM(CASE WHEN d.before_after_5g = 'After 5G'
             THEN f.atliqo_revenue_crores END) AS revenue_after_5g_crores,
    ROUND(
        (SUM(CASE WHEN d.before_after_5g = 'After 5G'
                  THEN f.atliqo_revenue_crores END)
       - SUM(CASE WHEN d.before_after_5g = 'Before 5G'
                  THEN f.atliqo_revenue_crores END)
        )
        / NULLIF(SUM(CASE WHEN d.before_after_5g = 'Before 5G'
                          THEN f.atliqo_revenue_crores END), 0) * 100,
        2
    ) AS revenue_change_pct
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date;
