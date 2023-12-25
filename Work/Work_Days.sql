---------------------------------------------------------
--Working Days

select st.store_name,count(distinct order_date) as Work_days
from Bikes_Company..orders ord
join Bikes_Company..stores st
on ord.store_id = st.store_id
Group by store_name

--Working Days in 2016
select st.store_name,count(distinct order_date) as Work_days_2016
from Bikes_Company..orders ord
join Bikes_Company..stores st
on ord.store_id = st.store_id
where Year(order_date) = 2016
Group by store_name


--Working Days in 2017
select st.store_name,count(distinct order_date) as Work_days_2017
from Bikes_Company..orders ord
join Bikes_Company..stores st
on ord.store_id = st.store_id
where Year(order_date) = 2017
Group by store_name


--Working Days in 2018
select st.store_name,count(distinct order_date) as Work_days_2018
from Bikes_Company..orders ord
join Bikes_Company..stores st
on ord.store_id = st.store_id
where Year(order_date) = 2018
Group by store_name
--------------------------------------------------------------------------------

SELECT q.store_name,Work_days_2016,Work_days_2017,Work_days_2018
FROM
(
	--Working Days in 2016
	select st.store_name,count(distinct order_date) as Work_days_2016
	from Bikes_Company..orders ord
	join Bikes_Company..stores st
	on ord.store_id = st.store_id
	where Year(order_date) = 2016
	Group by store_name
)q
join
(
	--Working Days in 2017
	select st.store_name,count(distinct order_date) as Work_days_2017
	from Bikes_Company..orders ord
	join Bikes_Company..stores st
	on ord.store_id = st.store_id
	where Year(order_date) = 2017
	Group by store_name
)q2
on q.store_name = q2.store_name
join
(
	--Working Days in 2018
	select st.store_name,count(distinct order_date) as Work_days_2018
	from Bikes_Company..orders ord
	join Bikes_Company..stores st
	on ord.store_id = st.store_id
	where Year(order_date) = 2018
	Group by store_name
)q3
on q.store_name = q3.store_name
---------------------------------------------
--Work Days to check Work by Weekday In Tableau
select distinct st.store_name, order_date 
from Bikes_Company..orders ord
join Bikes_Company..stores st
on ord.store_id = st.store_id
where Year(order_date) = 2016
Order by store_name,order_date

select distinct st.store_name, order_date 
from Bikes_Company..orders ord
join Bikes_Company..stores st
on ord.store_id = st.store_id
where Year(order_date) = 2017
Order by store_name,order_date


select distinct st.store_name, order_date 
from Bikes_Company..orders ord
join Bikes_Company..stores st
on ord.store_id = st.store_id
where Year(order_date) = 2018
Order by store_name,order_date

