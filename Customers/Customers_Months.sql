
--Helping Query
Select DATENAME(MONTH, order_date) AS extracted_month
From orders
-----------------------------------------------------------------
--2016 Months
SELECT st.store_name,pivot_table.*
FROM 
(
	SELECT order_id,store_id,DATENAME(MONTH, order_date) as month_name
	FROM orders
	WHERE year(order_date) = 2016
)q
PIVOT 
(
	COUNT(order_id) FOR  month_name IN 
	(
		[January],
		[February],
		[March],
		[April],
		[May],
		[June],
		[July],
		[August],
		[September],
		[October],
		[November],
		[December]
	)
) AS pivot_table
Join stores st 
On st.store_id = pivot_table.store_id
Order by st.store_name
-----------------------------------------------------------------
--2017 Months
SELECT st.store_name,pivot_table.*
FROM 
(
	SELECT order_id,store_id,DATENAME(MONTH, order_date) as month_name
	FROM orders
	WHERE year(order_date) = 2017
)q
PIVOT 
(
	COUNT(order_id) FOR  month_name IN 
	(
		[January],
		[February],
		[March],
		[April],
		[May],
		[June],
		[July],
		[August],
		[September],
		[October],
		[November],
		[December]
	)
) AS pivot_table
Join stores st 
On st.store_id = pivot_table.store_id
Order by st.store_name
-----------------------------------------------------------------
--2018 Months
SELECT st.store_name,pivot_table.*
FROM 
(
	SELECT order_id,store_id,DATENAME(MONTH, order_date) as month_name
	FROM orders
	WHERE year(order_date) = 2018
)q
PIVOT 
(
	COUNT(order_id) FOR  month_name IN 
	(
		[January],
		[February],
		[March],
		[April],
		[May],
		[June],
		[July],
		[August],
		[September],
		[October],
		[November],
		[December]
	)
) AS pivot_table
Join stores st 
On st.store_id = pivot_table.store_id
Order by st.store_name
-------------------------------------------------
--example
WITH DateCTE AS (
    SELECT CAST('2016-01-01' AS DATE) AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateCTE
    WHERE DateValue < '2017-01-01'
)

SELECT DateValue
FROM DateCTE;
-----------------------------------------------------
--New Customers Per Year,Month for each store

--Year 2016
--2016/01
Select store_name,count(distinct customer_id) as January_2016
From
(
	select store_id,customer_id,order_date
	from orders
	where month(order_date)<2 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/02
Select store_name,count(distinct customer_id) as February_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 2 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<2 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/03
Select store_name,count(distinct customer_id) as March_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 3 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<3 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/04
Select store_name,count(distinct customer_id) as April_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 4 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<4 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/05
Select store_name,count(distinct customer_id) as May_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 5 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<5 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/06
Select store_name,count(distinct customer_id) as June_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 6 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<6 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/07
Select store_name,count(distinct customer_id) as July_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 7 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<7 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/08
Select store_name,count(distinct customer_id) as August_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 8 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<8 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/09
Select store_name,count(distinct customer_id) as September_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 9 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<9 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/10
Select store_name,count(distinct customer_id) as October_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 10 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<10 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/11
Select store_name,count(distinct customer_id) as November_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 11 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<11 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2016/12
Select store_name,count(distinct customer_id) as December_2016
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 12 and year(order_date) = 2016
Except
	select store_id,customer_id
	from orders
	where month(order_date)<12 and year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

-------------------------------------------------------------------
--Year 2017
--2017/01
Select store_name,count(distinct customer_id) as January_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 1 and year(order_date) = 2017
Except
	select store_id,customer_id
	from orders
	where year(order_date) = 2016
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/02
Select store_name,count(distinct customer_id) as February_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 2 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<2 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/03
Select store_name,count(distinct customer_id) as March_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 3 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<3 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name


--2017/04
Select store_name,count(distinct customer_id) as April_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 4 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<4 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/05
Select store_name,count(distinct customer_id) as May_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 5 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<5 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/06
Select store_name,count(distinct customer_id) as June_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 6 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<6 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/07
Select store_name,count(distinct customer_id) as July_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 7 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<7 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/08
Select store_name,count(distinct customer_id) as August_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 8 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<8 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/09
Select store_name,count(distinct customer_id) as September_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 9 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<9 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/10
Select store_name,count(distinct customer_id) as October_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 10 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<10 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/11
Select store_name,count(distinct customer_id) as November_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 11 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<11 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2017/12
Select store_name,count(distinct customer_id) as December_2017
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 12 and year(order_date) = 2017
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) = 2016
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<12 and year(order_date) = 2017
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

-------------------------------------------------------------------
--Year 2018
--2018/01
Select store_name,count(distinct customer_id) as January_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 1 and year(order_date) = 2018
Except
	select store_id,customer_id
	from orders
	where year(order_date) < 2018
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/02
Select store_name,count(distinct customer_id) as February_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 2 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<2 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/03
Select store_name,count(distinct customer_id) as March_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 3 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<3 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name


--2018/04
Select store_name,count(distinct customer_id) as April_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 4 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<4 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/05
Select store_name,count(distinct customer_id) as May_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 5 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<5 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/06
Select store_name,count(distinct customer_id) as June_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 6 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<6 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/07
Select store_name,count(distinct customer_id) as July_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 7 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<7 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/08
Select store_name,count(distinct customer_id) as August_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 8 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<8 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/09
Select store_name,count(distinct customer_id) as September_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 9 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<9 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/10
Select store_name,count(distinct customer_id) as October_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 10 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<10 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/11
Select store_name,count(distinct customer_id) as November_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 11 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<11 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

--2018/12
Select store_name,count(distinct customer_id) as December_2018
From
(
	select store_id,customer_id
	from orders
	where month(order_date) = 12 and year(order_date) = 2018
Except
	(
		select store_id,customer_id
		from orders
		where year(order_date) < 2018
		Union All
		select store_id,customer_id
		from orders
		where month(order_date)<12 and year(order_date) = 2018
	)
)q
Join stores st
On q.store_id = st.store_id
Group by store_name

