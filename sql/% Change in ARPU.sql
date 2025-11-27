-- % Change in ARPU
SELECT
    AVG(CASE WHEN d.before_after_5g = 'Before 5G'
             THEN f.arpu END) AS arpu_before_5g,
    AVG(CASE WHEN d.before_after_5g = 'After 5G'
             THEN f.arpu END) AS arpu_after_5g,
    ROUND(
        (AVG(CASE WHEN d.before_after_5g = 'After 5G'
                  THEN f.arpu END)
       - AVG(CASE WHEN d.before_after_5g = 'Before 5G'
                  THEN f.arpu END)
        )
        / NULLIF(AVG(CASE WHEN d.before_after_5g = 'Before 5G'
                          THEN f.arpu END), 0) * 100,
        2
    ) AS arpu_change_pct
FROM fact_atliqo_metrics f
JOIN dim_date d ON f.date = d.date;
