--Customer per store
Select store_name,Count(distinct ord.customer_id) as cusomers
From Bikes_Company..orders ord
join Bikes_Company..customers cus
On ord.customer_id = cus.customer_id
join Bikes_Company..stores st
On st.store_id = ord.store_id
Group by store_name

--Customer per store 2016
Select store_name,Count(distinct ord.customer_id) as cusomers_2016
From Bikes_Company..orders ord
join Bikes_Company..customers cus
On ord.customer_id = cus.customer_id
join Bikes_Company..stores st
On st.store_id = ord.store_id
where Year(order_date) = 2016
Group by store_name


--Customer per store 2017
Select store_name,Count(distinct ord.customer_id) as cusomers_2017
From Bikes_Company..orders ord
join Bikes_Company..customers cus
On ord.customer_id = cus.customer_id
join Bikes_Company..stores st
On st.store_id = ord.store_id
where Year(order_date) = 2017
Group by store_name


--Customer per store 2018
Select store_name,Count(distinct ord.customer_id) as cusomers_2018
From Bikes_Company..orders ord
join Bikes_Company..customers cus
On ord.customer_id = cus.customer_id
join Bikes_Company..stores st
On st.store_id = ord.store_id
where Year(order_date) = 2018
Group by store_name

---------------------------------------------------------------------------------------------
--Customer per store 2016
Select q.store_name,cusomers_2016,cusomers_2017,cusomers_2018
From
(
	Select store_name,Count(distinct ord.customer_id) as cusomers_2016
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2016
	Group by store_name
)q
Join
(
	Select store_name,Count(distinct ord.customer_id) as cusomers_2017
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2017
	Group by store_name
)q2
On q.store_name = q2.store_name
Join
(
	Select store_name,Count(distinct ord.customer_id) as cusomers_2018
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2018
	Group by store_name
)q3
On q.store_name = q3.store_name

-------------------------------
--Customer Retension

SELECT store_name,count(distinct customer_id) as Retension
FROM
(
	Select st.store_name,ord.customer_id,count(distinct order_date)-1 as Returned
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	Group by st.store_name,ord.customer_id
	Having count(distinct order_date) > 0
)q
Group by store_name

----------------------------------------------
--Retension in year 2016
SELECT store_name,count(distinct customer_id) as Retension_2016
FROM
(
	Select st.store_name,ord.customer_id,count(distinct order_date) as Returned
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2016
	Group by st.store_name,ord.customer_id
	Having count(distinct order_date) > 1
)q
Group by store_name


--Retension in year 2017
SELECT store_name,count(distinct customer_id) as Retension_2017
FROM
(
	Select st.store_name,ord.customer_id,count(distinct order_date) as Returned
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2017
	Group by st.store_name,ord.customer_id
	Having count(distinct order_date) > 1
)q
Group by store_name

--Retension in year 2018
SELECT store_name,count(distinct customer_id) as Retension_2018
FROM
(
	Select st.store_name,ord.customer_id,count(distinct order_date) as Returned
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2018
	Group by st.store_name,ord.customer_id
	Having count(distinct order_date) > 1
)q
Group by store_name

-----------------------------------------------------------------------------
--Retension in year 2016

SELECT q2.store_name,Retension_2016,Retension_2017,Retension_2018
FROM
(
	SELECT store_name,count(distinct customer_id) as Retension_2016
	FROM
	(
		Select st.store_name,ord.customer_id,count(distinct order_date) as Returned
		From Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		where Year(order_date) = 2016
		Group by st.store_name,ord.customer_id
		Having count(distinct order_date) > 1
	)q
	Group by store_name
)q2
full join
(
	--Retension in year 2017
	SELECT store_name,count(distinct customer_id) as Retension_2017
	FROM
	(
		Select st.store_name,ord.customer_id,count(distinct order_date) as Returned
		From Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		where Year(order_date) = 2017
		Group by st.store_name,ord.customer_id
		Having count(distinct order_date) > 1
	)q
	Group by store_name
)q3
On q2.store_name = q3.store_name
full join
(
	--Retension in year 2018
	SELECT store_name,count(distinct customer_id) as Retension_2018
	FROM
	(
		Select st.store_name,ord.customer_id,count(distinct order_date) as Returned
		From Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		where Year(order_date) = 2018
		Group by st.store_name,ord.customer_id
		Having count(distinct order_date) > 1
	)q
	Group by store_name
)q4
On q2.store_name = q4.store_name
------------------------------------------------------------------------------------------
--Frequency of Customer Returns

--Gap between Dates
With CTE as
(
	Select st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,order_date
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
)
SELECT store_name,DATEDIFF(day,order_date,Return_date) as gap
FROM
(
	Select q.store_name,q.customer_id,q.order_date,q.Returned,q2.order_date as Return_date
	From CTE q
	join CTE as q2
	On q.customer_id = q2.customer_id And q.order_date<q2.order_date
	Where q.Returned!=1
)q3
Order by store_name


--Average Gap 
With CTE as
(
	Select st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,order_date
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
)
SELECT store_name,AVG(DATEDIFF(month,order_date,Return_date)) as Frequancy
FROM
(
	Select q.store_name,q.customer_id,q.order_date,q.Returned,q2.order_date as Return_date
	From CTE q
	join CTE as q2
	On q.customer_id = q2.customer_id And q.order_date<q2.order_date
	Where q.Returned!=1
)q3
Group by store_name
Order by store_name

--Average Gap in 2016
With CTE as
(
	Select st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,order_date
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2016
)
SELECT store_name,AVG(DATEDIFF(month,order_date,Return_date)) as Frequancy_2016
FROM
(
	Select q.store_name,q.customer_id,q.order_date,q.Returned,q2.order_date as Return_date
	From CTE q
	join CTE as q2
	On q.customer_id = q2.customer_id And q.order_date<q2.order_date
	Where q.Returned!=1
)q3
Group by store_name
Order by store_name

--Average Gap in 2017
With CTE as
(
	Select st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,order_date
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2017
)
SELECT store_name,AVG(DATEDIFF(month,order_date,Return_date)) as Frequancy_2017
FROM
(
	Select q.store_name,q.customer_id,q.order_date,q.Returned,q2.order_date as Return_date
	From CTE q
	join CTE as q2
	On q.customer_id = q2.customer_id And q.order_date<q2.order_date
	Where q.Returned!=1
)q3
Group by store_name
Order by store_name

--Average Gap in 2018
With CTE as
(
	Select st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,order_date
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2018
)
SELECT store_name,AVG(DATEDIFF(month,order_date,Return_date)) as Frequancy_2018
FROM
(
	Select q.store_name,q.customer_id,q.order_date,q.Returned,q2.order_date as Return_date
	From CTE q
	join CTE as q2
	On q.customer_id = q2.customer_id And q.order_date<q2.order_date
	Where q.Returned!=1
)q3
Group by store_name
Order by store_name
-----------------------------------------------------------------------------------
With CTE as
(
	Select st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,order_date
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2016
),
CTE2 as
(
	Select st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,order_date
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2017
),
CTE3 as
(
	Select st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,order_date
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where Year(order_date) = 2018
)
SELECT q4.store_name,Frequancy_2016,Frequancy_2017,Frequancy_2018
FROM
(
	Select store_name,AVG(DATEDIFF(month,order_date,Return_date)) as Frequancy_2016
	From
	(
		select q.store_name,q.customer_id,q.order_date,q.Returned,q2.order_date as Return_date
		from CTE q
		join CTE as q2
		On q.customer_id = q2.customer_id And q.order_date<q2.order_date
		Where q.Returned!=1
	)q3
	Group by store_name
)q4
left Join
(
	--Average Gap in 2017
	SELECT store_name,AVG(DATEDIFF(month,order_date,Return_date)) as Frequancy_2017
	FROM
	(
		Select q.store_name,q.customer_id,q.order_date,q.Returned,q2.order_date as Return_date
		From CTE2 q
		join CTE2 as q2
		On q.customer_id = q2.customer_id And q.order_date<q2.order_date
		Where q.Returned!=1
	)q3
	Group by store_name
)q5
on q4.store_name = q5.store_name
join
(
	--Average Gap in 2018
	SELECT store_name,AVG(DATEDIFF(month,order_date,Return_date)) as Frequancy_2018
	FROM
	(
		Select q.store_name,q.customer_id,q.order_date,q.Returned,q2.order_date as Return_date
		From CTE3 q
		join CTE3 as q2
		On q.customer_id = q2.customer_id And q.order_date<q2.order_date
		Where q.Returned!=1
	)q3
	Group by store_name
)q6
on q4.store_name = q6.store_name
---------------------------------------------------------------------------------------------------

--Retension over years
Select Distinct st.store_name,cast (ord.customer_id as int),cus.first_name+' '+cus.last_name as customer, Year(ord.order_date) as First_time,Year(n_ord.order_date) as Returned
From Bikes_Company..orders ord
join Bikes_Company..customers cus
On ord.customer_id = cus.customer_id
join Bikes_Company..stores st
On st.store_id = ord.store_id
Join Bikes_Company..orders n_ord
On ord.customer_id = n_ord.customer_id 
And YEAR(ord.order_date)<YEAR(n_ord.order_date)
order by cast (ord.customer_id as int)


--Loyal Customers
SELECT store_name,customer_id,customer,
CASE
    WHEN customer_id = LEAD(customer_id,(Select count(distinct Year(order_date))
From Bikes_Company..orders)-1) 
	over(order by customer_id) THEN 'Loyal'
END as Loyalty
FROM
(
	Select Distinct st.store_name,ord.customer_id,cus.first_name+' '+cus.last_name as customer, Year(ord.order_date) as First_time,Year(n_ord.order_date) as Returned
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	Join Bikes_Company..orders n_ord
	On ord.customer_id = n_ord.customer_id 
	And YEAR(ord.order_date)<YEAR(n_ord.order_date)
)q
order by cast (customer_id as int)




--VIP Customers per Store
SELECT store_name,Count(customer_id) as VIP
FROM
	(
	Select store_name,customer_id,customer,
	CASE
		WHEN customer_id = LEAD(customer_id,
		(Select count(distinct Year(order_date)) From Bikes_Company..orders)-1) 
		over(order by customer_id) THEN 'Loyal'
	END as Loyalty
	From
	(
		select Distinct st.store_name,ord.customer_id,cus.first_name+' '+cus.last_name as customer, Year(ord.order_date) as First_time,Year(n_ord.order_date) as Returned
		from Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		Join Bikes_Company..orders n_ord
		On ord.customer_id = n_ord.customer_id 
		And YEAR(ord.order_date)<YEAR(n_ord.order_date)
	)q
)q2
where Loyalty = 'Loyal'
Group by store_name


--VIP Customers IDs for Each Store
SELECT store_name,customer_id as VIP_ID
FROM
	(
	Select store_name,customer_id,customer,
	CASE
		WHEN customer_id = LEAD(customer_id,
		(Select count(distinct Year(order_date))
		From Bikes_Company..orders)-1) 
		over(order by customer_id) THEN 'Loyal'
	END as Loyalty
	From
	(
		select Distinct st.store_name,ord.customer_id,cus.first_name+' '+cus.last_name as customer, Year(ord.order_date) as First_time,Year(n_ord.order_date) as Returned
		from Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		Join Bikes_Company..orders n_ord
		On ord.customer_id = n_ord.customer_id 
		And YEAR(ord.order_date)<YEAR(n_ord.order_date)
	)q
)q2
where Loyalty = 'Loyal'
order by store_name
-------------------------------------------------------------------
--New Customers Annual

--New Customers 2016 
Select store_name,count(distinct customer_id) as new_customers
From Bikes_Company..orders ord
join Bikes_Company..stores st
On st.store_id = ord.store_id
where year(order_date) = 2016
Group by store_name

--Record of customers visited prior the current year
Select distinct store_name, customer_id as new_customers
From Bikes_Company..orders ord
join Bikes_Company..stores st
On st.store_id = ord.store_id
where year(order_date) < 2017

--New Customers 2017
Select st.store_name,count(distinct ord.customer_id) as new_customers
From Bikes_Company..orders ord
join Bikes_Company..stores st
On st.store_id = ord.store_id
Left Join
(
	Select distinct st2.store_name, ord2.customer_id
	From Bikes_Company..orders ord2
	join Bikes_Company..stores st2
	On st2.store_id = ord2.store_id
	where year(ord2.order_date) < 2017
)q
on ord.customer_id = q.customer_id
where year(ord.order_date) = 2017
AND q.customer_id IS NULL
Group by st.store_name

--New Customers 2018
Select st.store_name,count(distinct ord.customer_id) as new_customers
From Bikes_Company..orders ord
join Bikes_Company..stores st
On st.store_id = ord.store_id
Left Join
(
	Select distinct st2.store_name, ord2.customer_id
	From Bikes_Company..orders ord2
	join Bikes_Company..stores st2
	On st2.store_id = ord2.store_id
	where year(ord2.order_date) < 2018
)q
on ord.customer_id = q.customer_id
where year(ord.order_date) = 2018
AND q.customer_id IS NULL
Group by st.store_name

-------------------------------------------
Select q.store_name,q.new_customers_2016,q2.new_customers_2017,q3.new_customers_2018
From
(
	Select store_name,count(distinct customer_id) as new_customers_2016
	From Bikes_Company..orders ord
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	where year(order_date) = 2016
	Group by store_name
)q
Join
(
	Select st.store_name,count(distinct ord.customer_id) as new_customers_2017
	From Bikes_Company..orders ord
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	Left Join
	(
		Select distinct st2.store_name, ord2.customer_id
		From Bikes_Company..orders ord2
		join Bikes_Company..stores st2
		On st2.store_id = ord2.store_id
		where year(ord2.order_date) < 2017
	)q
	on ord.customer_id = q.customer_id
	where year(ord.order_date) = 2017
	AND q.customer_id IS NULL
	Group by st.store_name
)q2
On q.store_name = q2.store_name
Join
(
	Select st.store_name,count(distinct ord.customer_id) as new_customers_2018
	From Bikes_Company..orders ord
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	Left Join
	(
		Select distinct st2.store_name, ord2.customer_id
		From Bikes_Company..orders ord2
		join Bikes_Company..stores st2
		On st2.store_id = ord2.store_id
		where year(ord2.order_date) < 2018
	)q
	on ord.customer_id = q.customer_id
	where year(ord.order_date) = 2018
	AND q.customer_id IS NULL
	Group by st.store_name
)q3
On q.store_name = q3.store_name
