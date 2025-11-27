-- Market share value (estimated revenue in crores) by companies
SELECT
    company,
    SUM(tmv_city_crores * ms_pct) AS est_company_revenue_crores
FROM fact_market_share
GROUP BY company
ORDER BY est_company_revenue_crores DESC;
