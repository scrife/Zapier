with dates as (select distinct date(date) reporting_date from source_data.tasks_used_da)

, activities as (select distinct user_id, date(date) activity_date from source_data.tasks_used_da where sum_tasks_used > 0)

, max_dates as
	(
	select distinct user_id, dt.reporting_date, max(activity_date) activity_date 
	from dates dt left join activities act on dt.reporting_date >= act.activity_date
	group by 1, 2
	)
	
select 
	distinct reporting_date
	, count(distinct (case when (reporting_date - activity_date)::int between 0 and 28 then user_id end)) as active_customers
	, count(distinct (case when (reporting_date - activity_date)::int between 29 and 56 then user_id end)) as churned_customers
	, count(distinct (case when (reporting_date - activity_date)::int > 56 then user_id end)) as dorment_customers
	, count(distinct user_id) total_customers
from max_dates
group by 1
order by 1