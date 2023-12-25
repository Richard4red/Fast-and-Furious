
--VIP Customers for Each Store
SELECT store_name,customer_id as VIP
FROM
	(
	Select store_name,customer_id,customer,
	CASE
		WHEN customer_id = LEAD(customer_id,2) over(order by customer_id) THEN 'Loyal'
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

--------------------------------------------------------------------------
--Classifying VIP 
Select customer_id,first_name+' '+last_name as Customer,street,city,[state],zip_code,
CASE
    WHEN customer_id in
	(
		SELECT customer_id as VIP
		FROM
		(
			Select store_name,customer_id,customer,
			CASE
				WHEN customer_id = LEAD(customer_id,2) over(order by customer_id) THEN 'Loyal'
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
	)
	THEN 'VIP'
    ELSE 'Ordinary'
END as [Status]
From Bikes_Company..customers
---------------------------------------------------
--Customer Location Store and Status
Select distinct store_name,ord.customer_id,Customer,q.street,q.city,q.[state],q.zip_code,[Status]
From Bikes_Company..orders ord
Join Bikes_Company..stores st
On ord.store_id = st.store_id
Join
(
	Select customer_id,first_name+' '+last_name as Customer,street,city,[state],zip_code,
	CASE
		WHEN customer_id in
		(
			SELECT customer_id as VIP
			FROM
			(
				Select store_name,customer_id,customer,
				CASE
					WHEN customer_id = LEAD(customer_id,2) over(order by customer_id) THEN 'Loyal'
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
		)
		THEN 'VIP'
		ELSE 'Ordinary'
	END as [Status]
	From Bikes_Company..customers
)q
On ord.customer_id = q.customer_id

-------------------------------------------------------
--Seperating VIP and Ordinary Customers
--VIP Locations
SELECT *
FROM
(
	Select distinct store_name,ord.customer_id,Customer,q.street,q.city,q.[state],q.zip_code,[Status]
	From Bikes_Company..orders ord
	Join Bikes_Company..stores st
	On ord.store_id = st.store_id
	Join
	(
		Select customer_id,first_name+' '+last_name as Customer,street,city,[state],zip_code,
		CASE
			WHEN customer_id in
			(
				SELECT customer_id as VIP
				FROM
				(
					Select store_name,customer_id,customer,
					CASE
						WHEN customer_id = LEAD(customer_id,2) over(order by customer_id) THEN 'Loyal'
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
			)
			THEN 'VIP'
			ELSE 'Ordinary'
		END as [Status]
		From Bikes_Company..customers
	)q
	On ord.customer_id = q.customer_id
)q2
Where q2.Status = 'VIP'
------------------------------------------------------
--Ordinary Custmer Locations
SELECT *
FROM
(
	Select distinct store_name,ord.customer_id,Customer,q.street,q.city,q.[state],q.zip_code,[Status]
	From Bikes_Company..orders ord
	Join Bikes_Company..stores st
	On ord.store_id = st.store_id
	Join
	(
		Select customer_id,first_name+' '+last_name as Customer,street,city,[state],zip_code,
		CASE
			WHEN customer_id in
			(
				SELECT customer_id as VIP
				FROM
				(
					Select store_name,customer_id,customer,
					CASE
						WHEN customer_id = LEAD(customer_id,2) over(order by customer_id) THEN 'Loyal'
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
			)
			THEN 'VIP'
			ELSE 'Ordinary'
		END as [Status]
		From Bikes_Company..customers
	)q
	On ord.customer_id = q.customer_id
)q2
Where q2.Status = 'Ordinary'
-----------------------------------------------------------------------------------------------------

--Store Locations
Select store_name,street,city,[state],zip_code
From Bikes_Company..stores
-----------------------------------------------------------------------------------------------------
--Distance Distribution
Select *
From Bikes_Company..Balwin_Customers_Geo

Select *
From Bikes_Company..Baldwin_Distances


Select cus.[Store Name],[Zip Code],cus.Latitude,cus.Longitude,Distance
From Bikes_Company..Balwin_Customers_Geo cus
full join Bikes_Company..Baldwin_Distances dis
On cus.Latitude = dis.Latitude and cus.Longitude = dis.Longitude
order by Distance

--Checking if All Customers Present
SELECT COUNT(1) as customers
FROM
(
	Select cus.[Store Name],[Zip Code],cus.Latitude,cus.Longitude,Distance
	From Bikes_Company..Balwin_Customers_Geo cus
	full join Bikes_Company..Baldwin_Distances dis
	On cus.Latitude = dis.Latitude and cus.Longitude = dis.Longitude
)q








