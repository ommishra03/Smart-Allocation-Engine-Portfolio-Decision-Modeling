Select Ticker, Fiscal_Year, Fiscal_Period,
		count(*) as row_count
From dbo.raw_financials
group by Ticker, Fiscal_Year, Fiscal_Period
Having count(*) > 1
order by row_count desc;

DROP TABLE IF EXISTS clean_financials;
GO

WITH ranked_data AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY Ticker, Fiscal_Year, Fiscal_Period
            ORDER BY Publish_Date DESC
        ) AS rn
    FROM raw_financials
)
SELECT
    Ticker,
    Fiscal_Year,
    Fiscal_Period,
    Report_Date,
    Publish_Date,
    Currency,

    Revenue,
    Cost_of_Revenue,
    Gross_Profit,
    Operating_Income,
    Net_Income,

    Profit_Margin,
    Revenue_Growth_YoY,

    Shares_Basic,
    Shares_Diluted
INTO clean_financials
FROM ranked_data
WHERE rn = 1;
GO

SELECT COUNT(*) AS clean_rows FROM clean_financials;

SELECT
    Ticker,
    Fiscal_Year,
    Fiscal_Period,
    COUNT(*)
FROM clean_financials
GROUP BY
    Ticker,
    Fiscal_Year,
    Fiscal_Period
HAVING COUNT(*) > 1;
