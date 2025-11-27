-- ARPU Before/After and Change % by City
WITH city_arpu AS (
    SELECT
        f.city_code,
        d.before_after_5g,
        AVG(f.arpu) AS arpu
    FROM fact_atliqo_metrics f
    JOIN dim_date d ON f.date = d.date
    GROUP BY f.city_code, d.before_after_5g
)
SELECT
    c.city_code,
    ci.city_name,
    AVG(CASE WHEN c.before_after_5g = 'Before 5G'
             THEN c.arpu END) AS arpu_before_5g,
    AVG(CASE WHEN c.before_after_5g = 'After 5G'
             THEN c.arpu END) AS arpu_after_5g,
    ROUND(
        (AVG(CASE WHEN c.before_after_5g = 'After 5G'
                  THEN c.arpu END)
       - AVG(CASE WHEN c.before_after_5g = 'Before 5G'
                  THEN c.arpu END)
        )
        / NULLIF(AVG(CASE WHEN c.before_after_5g = 'Before 5G'
                          THEN c.arpu END), 0) * 100,
        2
    ) AS arpu_change_pct
FROM city_arpu c
JOIN dim_cities ci ON c.city_code = ci.city_code
GROUP BY c.city_code, ci.city_name
ORDER BY arpu_change_pct ASC;
