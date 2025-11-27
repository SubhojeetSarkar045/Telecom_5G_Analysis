-- Market share % by companies (average share)
SELECT
    company,
    ROUND(AVG(ms_pct) * 100, 2) AS avg_market_share_pct
FROM fact_market_share
GROUP BY company
ORDER BY avg_market_share_pct DESC;
