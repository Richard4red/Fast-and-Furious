
--VIP Customers IDs for Each Store
SELECT store_name,customer_id as VIP_ID
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
-------------------------------------------------------

--VIP Orders
SELECT store_name,q2.customer_id as VIP_ID,ord.order_id
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
join orders ord
On ord.customer_id = q2.customer_id
where Loyalty = 'Loyal'

---------------------------------------------------------------

--VIP Order Purchases
SELECT store_name,q2.customer_id as VIP_ID,count(ord.order_id) as purchases
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
join orders ord
On ord.customer_id = q2.customer_id
where Loyalty = 'Loyal'
Group by store_name,q2.customer_id
--------------------------------------------------------------------------
--Categories VIPs buy

--One order can purchase alot of products
SELECT store_name,cat.category_name,COUNT(category_name) as Purchases
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
join orders ord
On ord.customer_id = q2.customer_id
join order_items it 
On it.order_id = ord.order_id
join products prd
On prd.product_id = it.product_id
join categories cat
On cat.category_id = prd.category_id
where Loyalty = 'Loyal'
Group by store_name,cat.category_name
order by store_name,cat.category_name
------------------------------------------------------------------
--Brands VIPs buy

SELECT store_name,br.brand_name,COUNT(br.brand_name) as Purchases
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
join orders ord
On ord.customer_id = q2.customer_id
join order_items it 
On it.order_id = ord.order_id
join products prd
On prd.product_id = it.product_id
join brands br
On br.brand_id = prd.brand_id
where Loyalty = 'Loyal'
Group by store_name,br.brand_name
order by store_name,br.brand_name
-------------------------------------------------------
