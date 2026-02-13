/*
======================================================
Project: Financial Analytics
Smart Allocation Engine — FINAL OPTIMIZED VERSION
======================================================
*/
USE FinancialAnalytics;
GO

/* ======================================================
STEP 1 — CORE METRIC LAYER
====================================================== */

IF OBJECT_ID('tempdb..#metrics_layer') IS NOT NULL
    DROP TABLE #metrics_layer;

SELECT
    ticker,
    COUNT(*) AS total_years,
    SUM(CASE WHEN net_income > 0 THEN 1 ELSE 0 END) AS profitable_years,
    AVG(net_income) AS avg_net_income,
    STDEV(net_income) AS net_income_volatility,
    1.0 * SUM(CASE WHEN net_income > 0 THEN 1 ELSE 0 END) / COUNT(*) 
        AS profit_consistency_ratio
INTO #metrics_layer
FROM clean_financials
GROUP BY ticker
HAVING COUNT(*) >= 5;


/* ======================================================
STEP 2 — GROWTH MOMENTUM LAYER
====================================================== */

IF OBJECT_ID('tempdb..#growth_metrics') IS NOT NULL
    DROP TABLE #growth_metrics;

WITH ordered_financials AS (
    SELECT
        ticker,
        net_income,
        fiscal_year,
        ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY fiscal_year ASC)  AS rn_asc,
        ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY fiscal_year DESC) AS rn_desc
    FROM clean_financials
),

growth_layer AS (
    SELECT
        ticker,
        MAX(CASE WHEN rn_desc = 1 THEN net_income END) AS latest_income,
        MAX(CASE WHEN rn_asc  = 1 THEN net_income END) AS earliest_income
    FROM ordered_financials
    GROUP BY ticker
)

SELECT
    m.*,
    (g.latest_income - g.earliest_income) AS income_growth
INTO #growth_metrics
FROM #metrics_layer m
JOIN growth_layer g
    ON m.ticker = g.ticker;


/* ======================================================
STEP 3 — FINAL SMART ALLOCATION ENGINE TABLE
====================================================== */

IF OBJECT_ID('dbo.smart_allocation_engine') IS NOT NULL
    DROP TABLE dbo.smart_allocation_engine;

WITH scoring_layer AS (
    SELECT
        ticker,
        total_years,
        avg_net_income,
        profit_consistency_ratio,
        net_income_volatility,
        income_growth,

        /* QUALITY SCORE */
        NTILE(5) OVER (ORDER BY profit_consistency_ratio DESC)
            AS quality_score,

        /* STABILITY SCORE */
        NTILE(5) OVER (ORDER BY net_income_volatility ASC)
            AS stability_score,

        /* GROWTH SCORE */
        NTILE(5) OVER (ORDER BY income_growth DESC)
            AS growth_score

    FROM #growth_metrics
)

SELECT
    ticker,
    total_years,
    avg_net_income,
    profit_consistency_ratio,
    net_income_volatility,
    income_growth,
    quality_score,
    stability_score,
    growth_score,

    ROUND(
        quality_score * 0.5 +
        stability_score * 0.3 +
        growth_score * 0.2, 2
    ) AS allocation_score,

    CASE
        WHEN (quality_score * 0.5 + stability_score * 0.3 + growth_score * 0.2) >= 4
            THEN 'Strong Allocation'
        WHEN (quality_score * 0.5 + stability_score * 0.3 + growth_score * 0.2) >= 3
            THEN 'Moderate Allocation'
        ELSE 'Avoid / Monitor'
    END AS portfolio_decision

INTO dbo.smart_allocation_engine
FROM scoring_layer;


/* ======================================================
STEP 4 — EXPORT READY OUTPUT
====================================================== */

SELECT *
FROM dbo.smart_allocation_engine
ORDER BY allocation_score DESC;