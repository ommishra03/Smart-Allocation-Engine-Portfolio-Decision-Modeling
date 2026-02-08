--Which companies are consistently profitable?
select 
	ticker,
	count(*) as total_years,
	sum(case when net_income > 0 then 1 else 0 end) as profitable_years,
	round( 1.0 * sum(case when net_income > 0 then 1 else 0 end) / count(*), 2) as profit_consistency_ratio
	--sum(case when net_income > 0 then 1 else 0 end) / count(*)
from clean_financials
group by ticker 
having count(*) >= 5
order by profitable_years desc, profit_consistency_ratio desc;

/*
How to read the output?
profit_consistency_ratio = 1.0 ? always profitable
profit_consistency_ratio ? 0.8 ? strong long-term profitability
profit_consistency_ratio < 0.5 ? unstable business
*/

--Which companies show earnings volatility?
select 
	ticker,
	count(*) as total_years,
	round(avg(net_income),2) as avg_net_income,
	round(stdev(net_income),2) as net_income_volatility
from clean_financials
group by ticker
having count(*) >=5
order by net_income_volatility desc;

/* 
Interpretation:-
High STDEV ? unpredictable earnings
Low STDEV ? stable operations
*/