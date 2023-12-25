

-- Orders with Probelms
Select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
From Bikes_Company..orders ord
join Bikes_Company..staffs stf
on ord.staff_id = stf.staff_id
join Bikes_Company..stores st
on st.store_id = ord.store_id
where shipped_date is NULL

--Employee and  the Problem the made
Select store_name,Employee,COUNT(order_id) as Problems
From
(
	select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
	from Bikes_Company..orders ord
	join Bikes_Company..staffs stf
	on ord.staff_id = stf.staff_id
	join Bikes_Company..stores st
	on st.store_id = ord.store_id
	where shipped_date is NULL
)q
Group by store_name,Employee
Order by store_name,Employee


--Employee and  the Problem the made in 2016
Select store_name,Employee,COUNT(order_id) as Problems_2016
From
(
	select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
	from Bikes_Company..orders ord
	join Bikes_Company..staffs stf
	on ord.staff_id = stf.staff_id
	join Bikes_Company..stores st
	on st.store_id = ord.store_id
	where shipped_date is NULL and Year(order_date) = 2016
)q
Group by store_name,Employee
Order by store_name,Employee


--Employee and  the Problem the made in 2017
Select store_name,Employee,COUNT(order_id) as Problems_2017
From
(
	select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
	from Bikes_Company..orders ord
	join Bikes_Company..staffs stf
	on ord.staff_id = stf.staff_id
	join Bikes_Company..stores st
	on st.store_id = ord.store_id
	where shipped_date is NULL and Year(order_date) = 2017
)q
Group by store_name,Employee
Order by store_name,Employee


--Employee and  the Problem the made in 2018
Select store_name,Employee,COUNT(order_id) as Problems_2018
From
(
	select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
	from Bikes_Company..orders ord
	join Bikes_Company..staffs stf
	on ord.staff_id = stf.staff_id
	join Bikes_Company..stores st
	on st.store_id = ord.store_id
	where shipped_date is NULL and Year(order_date) = 2018
)q
Group by store_name,Employee
Order by store_name,Employee

------------------------------------------------------------------------------

SELECT q2.store_name,q2.Employee,Problems_2016,Problems_2017,Problems_2018
FROM
(
	Select store_name,Employee,COUNT(order_id) as Problems_2018
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where shipped_date is NULL and Year(order_date) = 2018
	)q
	Group by store_name,Employee
)q2
join 
(
	Select store_name,Employee,COUNT(order_id) as Problems_2017
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where shipped_date is NULL and Year(order_date) = 2017
	)q
	Group by store_name,Employee
)q3 
on q2.store_name = q3.store_name and q2.Employee = q3.Employee
left join
(
	Select store_name,Employee,COUNT(order_id) as Problems_2016
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where shipped_date is NULL and Year(order_date) = 2016
	)q
	Group by store_name,Employee
)q4
on q3.store_name = q4.store_name and q3.Employee = q4.Employee
Order by q2.store_name,Employee
-----------------------------------------------------------------------------------------------
--Employee orders 
Select store_name,Employee,COUNT(order_id) as Orders
From
(
	select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date,customer_id
	from Bikes_Company..orders ord
	join Bikes_Company..staffs stf
	on ord.staff_id = stf.staff_id
	join Bikes_Company..stores st
	on st.store_id = ord.store_id
)q
Group by store_name,Employee
Order by store_name,Employee
-----------------------------------------------------------------------------------


SELECT q2.store_name,q2.Employee,orders_2016,orders_2017,orders_2018
FROM
(
	Select store_name,Employee,COUNT(order_id) as orders_2018
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where  Year(order_date) = 2018
	)q
	Group by store_name,Employee
)q2
join 
(
	Select store_name,Employee,COUNT(order_id) as orders_2017
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where Year(order_date) = 2017
	)q
	Group by store_name,Employee
)q3 
on q2.store_name = q3.store_name and q2.Employee = q3.Employee
left join
(
	Select store_name,Employee,COUNT(order_id) as orders_2016
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where Year(order_date) = 2016
	)q
	Group by store_name,Employee
)q4
on q3.store_name = q4.store_name and q3.Employee = q4.Employee
Order by q2.store_name,Employee
-------------------------------------------------------------------------------------------
--Employee Customers
Select store_name,Employee,COUNT(distinct customer_id) as Customers
From
(
	select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date,customer_id
	from Bikes_Company..orders ord
	join Bikes_Company..staffs stf
	on ord.staff_id = stf.staff_id
	join Bikes_Company..stores st
	on st.store_id = ord.store_id
)q
Group by store_name,Employee
Order by store_name,Employee
-----------------------------------------------------------------------------------------

SELECT q2.store_name,q2.Employee,customer_id_2016,customer_id_2017,customer_id_2018
FROM
(
	Select store_name,Employee,COUNT(distinct customer_id) as customer_id_2018
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date,customer_id
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where  Year(order_date) = 2018
	)q
	Group by store_name,Employee
)q2
join 
(
	Select store_name,Employee,COUNT(distinct customer_id) as customer_id_2017
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date,customer_id
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where Year(order_date) = 2017
	)q
	Group by store_name,Employee
)q3 
on q2.store_name = q3.store_name and q2.Employee = q3.Employee
left join
(
	Select store_name,Employee,COUNT(distinct customer_id) as customer_id_2016
	From
	(
		select order_id,st.store_name,stf.first_name+' '+stf.last_name as Employee,order_date,shipped_date,customer_id
		from Bikes_Company..orders ord
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		join Bikes_Company..stores st
		on st.store_id = ord.store_id
		where Year(order_date) = 2016
	)q
	Group by store_name,Employee
)q4
on q3.store_name = q4.store_name and q3.Employee = q4.Employee
Order by q2.store_name,Employee
-----------------------------------------------------------------------------------------------
--Good Service
Select *
From
(
	select order_date,st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,stf.first_name+' '+stf.last_name as Employee
	from Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	join Bikes_Company..staffs stf
	on ord.staff_id = stf.staff_id
)q
where Returned != 1

--Good Services in General

SELECT store_name,Employee,COUNT(order_date) as Good_Service
FROM
(
	Select Rank() over(partition by customer_id order by order_date) as 'Rank',customer_id,order_date,store_name,Employee
	From
	(
		select order_date,st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,stf.first_name+' '+stf.last_name as Employee
		from Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
	)q
	where Returned != 1
)q2
Where [Rank] = 1
Group by store_name,Employee
order by store_name,Employee

--Good Service in 2016
SELECT store_name,Employee,COUNT(order_date) as Good_Service_2016
FROM
(
	Select Rank() over(partition by customer_id order by order_date) as 'Rank',order_date,store_name,Employee
	From
	(
		select order_date,st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,stf.first_name+' '+stf.last_name as Employee
		from Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		where Year(order_date) = 2016
	)q
	where Returned != 1
)q2
Where [Rank] = 1
Group by store_name,Employee
order by store_name,Employee
--Good Service in 2017
SELECT store_name,Employee,COUNT(order_date) as Good_Service_2017
FROM
(
	Select Rank() over(partition by customer_id order by order_date) as 'Rank',order_date,store_name,Employee
	From
	(
		select order_date,st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,stf.first_name+' '+stf.last_name as Employee
		from Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		where Year(order_date) = 2017
	)q
	where Returned != 1
)q2
Where [Rank] = 1
Group by store_name,Employee
order by store_name,Employee

--Good Service in 2018
SELECT store_name,Employee,COUNT(order_date) as Good_Service_2018
FROM
(
	Select Rank() over(partition by customer_id order by order_date) as 'Rank',order_date,store_name,Employee
	From
	(
		select order_date,st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,stf.first_name+' '+stf.last_name as Employee
		from Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		where Year(order_date) = 2018
	)q
	where Returned != 1
)q2
Where [Rank] = 1
Group by store_name,Employee
order by store_name,Employee

------------------------------------------------------------------------------------

--Good Service in 2016
SELECT q6.store_name,q6.Employee,Good_Service_2016,Good_Service_2017,Good_Service_2018
FROM
(
	Select 
		CASE
		WHEN q3.store_name is NOT null THEN q3.store_name
		WHEN q4.store_name is NOT null THEN q4.store_name
		END as store_name,
		CASE
		WHEN q3.Employee is NOT null THEN q3.Employee
		WHEN q4.Employee is NOT null THEN q4.Employee
		END as Employee,
		Good_Service_2016,Good_Service_2017
	From
	(
	SELECT store_name,Employee,COUNT(order_date) as Good_Service_2016
	FROM
	(
		Select Rank() over(partition by customer_id order by order_date) as 'Rank',order_date,store_name,Employee
		From
		(
			select order_date,st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,stf.first_name+' '+stf.last_name as Employee
			from Bikes_Company..orders ord
			join Bikes_Company..customers cus
			On ord.customer_id = cus.customer_id
			join Bikes_Company..stores st
			On st.store_id = ord.store_id
			join Bikes_Company..staffs stf
			on ord.staff_id = stf.staff_id
			where Year(order_date) = 2016
		)q
		where Returned != 1
	)q2
	Where [Rank] = 1
	Group by store_name,Employee
	)q3
	full Join
	(
		--Good Service in 2017
		SELECT store_name,Employee,COUNT(order_date) as Good_Service_2017
		FROM
		(
			Select Rank() over(partition by customer_id order by order_date) as 'Rank',order_date,store_name,Employee
			From
			(
				select order_date,st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,stf.first_name+' '+stf.last_name as Employee
				from Bikes_Company..orders ord
				join Bikes_Company..customers cus
				On ord.customer_id = cus.customer_id
				join Bikes_Company..stores st
				On st.store_id = ord.store_id
				join Bikes_Company..staffs stf
				on ord.staff_id = stf.staff_id
				where Year(order_date) = 2017
			)q
			where Returned != 1
		)q2
		Where [Rank] = 1
		Group by store_name,Employee
	)q4
	On q3.store_name = q4.store_name  And q3.Employee = q4.Employee
)q6
left Join
(
--Good Service in 2018
SELECT store_name,Employee,COUNT(order_date) as Good_Service_2018
FROM
(
	Select Rank() over(partition by customer_id order by order_date) as 'Rank',order_date,store_name,Employee
	From
	(
		select order_date,st.store_name,ord.customer_id,count(order_date) over(partition by st.store_name,ord.customer_id) as Returned,stf.first_name+' '+stf.last_name as Employee
		from Bikes_Company..orders ord
		join Bikes_Company..customers cus
		On ord.customer_id = cus.customer_id
		join Bikes_Company..stores st
		On st.store_id = ord.store_id
		join Bikes_Company..staffs stf
		on ord.staff_id = stf.staff_id
		where Year(order_date) = 2018
	)q
	where Returned != 1
)q2
Where [Rank] = 1
Group by store_name,Employee
)q5
On q6.store_name = q5.store_name  And q6.Employee = q5.Employee
order by store_name,Employee
