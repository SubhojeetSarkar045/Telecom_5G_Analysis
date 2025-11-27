-- Atliqo's share of market value by city
SELECT
    ci.city_name,
    SUM(CASE WHEN m.company = 'Atliqo' THEN m.ms_pct * m.tmv_city_crores END) AS atliqo_value_crores,
    SUM(m.tmv_city_crores)                                                    AS total_market_crores,
    ROUND(
        SUM(CASE WHEN m.company = 'Atliqo' THEN m.ms_pct * m.tmv_city_crores END)
        / NULLIF(SUM(m.tmv_city_crores), 0) * 100,
        2
    ) AS atliqo_market_share_pct
FROM fact_market_share m
JOIN dim_cities ci ON m.city_code = ci.city_code
GROUP BY ci.city_name
ORDER BY atliqo_market_share_pct DESC;
