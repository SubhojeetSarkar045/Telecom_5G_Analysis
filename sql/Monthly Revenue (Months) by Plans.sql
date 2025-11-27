-- Monthly Revenue (Months) by Plans
SELECT
    d.month_name,
    pr.plans,
    SUM(pr.plan_revenue_crores) AS monthly_plan_revenue_crores
FROM fact_plan_revenue pr
JOIN dim_date d ON pr.date = d.date
GROUP BY d.month_name, d.date, pr.plans
ORDER BY d.date, pr.plans;
