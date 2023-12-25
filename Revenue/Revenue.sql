

--Revenue for each transaction
--quantity*it.list_price*(1-discount) as Revenue
Select ord.order_id,store_name,pr.product_name,
quantity,it.list_price,discount,order_date,shipped_date,first_name +' '+last_name as Customer,
cast(quantity as int)*cast(it.list_price as float)*(1-discount) as Revenue
From Bikes_Company..orders ord
join Bikes_Company..customers cus
On ord.customer_id = cus.customer_id
join Bikes_Company..stores st
On st.store_id = ord.store_id
join Bikes_Company..order_items it
On it.order_id = ord.order_id
join Bikes_Company..products pr
on pr.product_id = it.product_id


--Total Revenue
With CTE as
(
	Select ord.order_id,pr.product_name,pr.product_id,quantity,it.list_price,discount,shipped_date,first_name +' '+last_name as Customer,store_name,cast(quantity as int)*cast(it.list_price as float)*(1-discount) as Revenue
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	join Bikes_Company..order_items it
	On it.order_id = ord.order_id
	join Bikes_Company..products pr
	on pr.product_id = it.product_id
)
Select CTE.store_name,Sum(Revenue) as Total_Revenue
From CTE
Group by CTE.store_name


--Total Revenue for year 2016
With CTE as
(
	Select ord.order_id,pr.product_name,pr.product_id,quantity,it.list_price,discount,shipped_date,
	first_name +' '+last_name as Customer,store_name,cast(quantity as int)*cast(it.list_price as float)*(1-discount) as Revenue
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	join Bikes_Company..order_items it
	On it.order_id = ord.order_id
	join Bikes_Company..products pr
	on pr.product_id = it.product_id
	Where Year(order_date) =2016 
)	
Select CTE.store_name,Sum(Revenue) as Total_Revenue_2016
From CTE
Group by CTE.store_name


--Total Revenue for year 2017
With CTE as
(
	Select ord.order_id,pr.product_name,pr.product_id,quantity,it.list_price,discount,shipped_date,
	first_name +' '+last_name as Customer,store_name,cast(quantity as int)*cast(it.list_price as float)*(1-discount) as Revenue
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	join Bikes_Company..order_items it
	On it.order_id = ord.order_id
	join Bikes_Company..products pr
	on pr.product_id = it.product_id
	Where Year(order_date) =2017 
)	
Select CTE.store_name,Sum(Revenue) as Total_Revenue_2017
From CTE
Group by CTE.store_name


--Total Revenue for year 2018
With CTE as
(
	Select ord.order_id,pr.product_name,pr.product_id,quantity,it.list_price,discount,shipped_date,
	first_name +' '+last_name as Customer,store_name,cast(quantity as int)*cast(it.list_price as float)*(1-discount) as Revenue
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	join Bikes_Company..order_items it
	On it.order_id = ord.order_id
	join Bikes_Company..products pr
	on pr.product_id = it.product_id
	Where Year(order_date) =2018
)	
Select CTE.store_name,Sum(Revenue) as Total_Revenue_2018
From CTE
Group by CTE.store_name

------------------------------------------------------------------------------------------------------------------------
With CTE_2016 as
(
	Select ord.order_id,pr.product_name,pr.product_id,quantity,it.list_price,discount,shipped_date,
	first_name +' '+last_name as Customer,store_name,cast(quantity as int)*cast(it.list_price as float)*(1-discount) as Revenue
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	join Bikes_Company..order_items it
	On it.order_id = ord.order_id
	join Bikes_Company..products pr
	on pr.product_id = it.product_id
	Where Year(order_date) =2016 
)
,CTE_2017 as
(
	Select ord.order_id,pr.product_name,pr.product_id,quantity,it.list_price,discount,shipped_date,
	first_name +' '+last_name as Customer,store_name,cast(quantity as int)*cast(it.list_price as float)*(1-discount) as Revenue
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	join Bikes_Company..order_items it
	On it.order_id = ord.order_id
	join Bikes_Company..products pr
	on pr.product_id = it.product_id
	Where Year(order_date) =2017 
),CTE_2018 as
(
	Select ord.order_id,pr.product_name,pr.product_id,quantity,it.list_price,discount,shipped_date,
	first_name +' '+last_name as Customer,store_name,cast(quantity as int)*cast(it.list_price as float)*(1-discount) as Revenue
	From Bikes_Company..orders ord
	join Bikes_Company..customers cus
	On ord.customer_id = cus.customer_id
	join Bikes_Company..stores st
	On st.store_id = ord.store_id
	join Bikes_Company..order_items it
	On it.order_id = ord.order_id
	join Bikes_Company..products pr
	on pr.product_id = it.product_id
	Where Year(order_date) =2018
)
Select q.store_name,Total_Revenue_2016,Total_Revenue_2017,Total_Revenue_2018
From
(
	Select store_name,Sum(Revenue) as Total_Revenue_2016
	From CTE_2016
	Group by store_name
)q
join
(
	--Total Revenue for year 2017
	Select store_name,Sum(Revenue) as Total_Revenue_2017
	From CTE_2017
	Group by store_name
)q2
On q.store_name = q2.store_name
join
(
	--Total Revenue for year 2018
	Select store_name,Sum(Revenue) as Total_Revenue_2018
	From CTE_2018
	Group by store_name
)q3
on q.store_name = q3.store_name







