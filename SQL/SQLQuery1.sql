use FinancialAnalytics;
go

DROP TABLE dbo.Worksheet;
GO

CREATE TABLE dbo.Worksheet (
    Ticker NVARCHAR(100) NULL,
    Report_Date NVARCHAR(50) NULL,
    Currency NVARCHAR(50) NULL,
    Fiscal_Year NVARCHAR(20) NULL,
    Fiscal_Period NVARCHAR(20) NULL,
    Revenue_Growth_YoY NVARCHAR(50) NULL,
    Publish_Date NVARCHAR(50) NULL,
    Restated_Date NVARCHAR(50) NULL,
    Shares_Basic NVARCHAR(50) NULL,
    Shares_Diluted NVARCHAR(50) NULL,
    Revenue NVARCHAR(50) NULL,
    Cost_of_Revenue NVARCHAR(50) NULL,
    Gross_Profit NVARCHAR(50) NULL,
    Operating_Expenses NVARCHAR(50) NULL,
    Selling_General_Administrative NVARCHAR(50) NULL,
    Research_Development NVARCHAR(50) NULL,
    Depreciation_Amortization NVARCHAR(50) NULL,
    Operating_Income_Loss NVARCHAR(50) NULL,
    Non_Operating_Income_Loss NVARCHAR(50) NULL,
    Interest_Expense_Net NVARCHAR(50) NULL,
    Pretax_Income_Loss_Adj NVARCHAR(50) NULL,
    Net_Income_Common NVARCHAR(50) NULL,
    Pretax_Income_Loss NVARCHAR(50) NULL,
    Income_Tax_Expense_Benefit_Net NVARCHAR(50) NULL,
    Income_Loss_from_Continuing_Operations NVARCHAR(50) NULL,
    Net_Income NVARCHAR(50) NULL,
    Profit_Margin NVARCHAR(50) NULL,
    column28 NVARCHAR(10) NULL
);
GO

BULK INSERT dbo.Worksheet
FROM 'C:\Users\91914\Desktop\Portfolio Project\SQL\Worksheet.csv'
WITH (
    FIRSTROW = 2,        -- skip header
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',  -- UTF-8
    TABLOCK
);
GO

select count(*) from dbo.Worksheet;

DROP TABLE IF EXISTS raw_financials;
GO

CREATE TABLE raw_financials (
    Ticker NVARCHAR(50),
    Report_Date DATE,
    Publish_Date DATE,
    Restated_Date DATE,
    Currency NVARCHAR(10),
    Fiscal_Year INT,
    Fiscal_Period NVARCHAR(10),

    Shares_Basic FLOAT,
    Shares_Diluted FLOAT,

    Revenue FLOAT,
    Cost_of_Revenue FLOAT,
    Gross_Profit FLOAT,
    Operating_Expenses FLOAT,
    SG_A FLOAT,
    R_D FLOAT,
    Depreciation_Amortization FLOAT,

    Operating_Income FLOAT,
    Non_Operating_Income FLOAT,
    Interest_Expense FLOAT,

    Pretax_Income_Adj FLOAT,
    Pretax_Income FLOAT,
    Income_Tax FLOAT,

    Net_Income_Common FLOAT,
    Net_Income FLOAT,

    Profit_Margin FLOAT,
    Revenue_Growth_YoY FLOAT
);
GO

INSERT INTO raw_financials (
    Ticker,
    Report_Date,
    Publish_Date,
    Restated_Date,
    Currency,
    Fiscal_Year,
    Fiscal_Period,
    Shares_Basic,
    Shares_Diluted,
    Revenue,
    Cost_of_Revenue,
    Gross_Profit,
    Operating_Expenses,
    SG_A,
    R_D,
    Depreciation_Amortization,
    Operating_Income,
    Non_Operating_Income,
    Interest_Expense,
    Pretax_Income_Adj,
    Pretax_Income,
    Income_Tax,
    Net_Income_Common,
    Net_Income,
    Profit_Margin,
    Revenue_Growth_YoY
)
SELECT
    Ticker,
    TRY_CONVERT(date, Report_Date),
    TRY_CONVERT(date, Publish_Date),
    TRY_CONVERT(date, Restated_Date),
    Currency,
    TRY_CONVERT(int, Fiscal_Year),
    Fiscal_Period,

    TRY_CONVERT(float, Shares_Basic),
    TRY_CONVERT(float, Shares_Diluted),

    TRY_CONVERT(float, Revenue),
    TRY_CONVERT(float, Cost_of_Revenue),
    TRY_CONVERT(float, Gross_Profit),
    TRY_CONVERT(float, Operating_Expenses),
    TRY_CONVERT(float, Selling_General_Administrative),
    TRY_CONVERT(float, Research_Development),
    TRY_CONVERT(float, Depreciation_Amortization),

    TRY_CONVERT(float, Operating_Income_Loss),
    TRY_CONVERT(float, Non_Operating_Income_Loss),
    TRY_CONVERT(float, Interest_Expense_Net),

    TRY_CONVERT(float, Pretax_Income_Loss_Adj),
    TRY_CONVERT(float, Pretax_Income_Loss),
    TRY_CONVERT(float, Income_Tax_Expense_Benefit_Net),

    TRY_CONVERT(float, Net_Income_Common),
    TRY_CONVERT(float, Net_Income),

    TRY_CONVERT(float, REPLACE(Profit_Margin, '%', '')),
    TRY_CONVERT(float, REPLACE(Revenue_Growth_YoY, '%', ''))
FROM dbo.Worksheet;

select count(*) from raw_financials;

SELECT TOP 5
    Ticker,
    Fiscal_Year,
    Revenue,
    Operating_Income,
    Net_Income
FROM raw_financials;

