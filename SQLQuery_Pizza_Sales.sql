
select * from pizza_sales

-----1.Total Revenue-----------------------

select sum(total_price) as Total_Revenue from pizza_sales

-----2.Average Order Value---------------------

select sum(total_price)/COUNT(distinct order_id) as Average_Order_Value from pizza_sales

-----3.Total Pizzas Sold----------------------------
 
select sum(quantity) as Total_Pizzas_Sold from pizza_sales

------4.Total Orders-------------------------

select COUNT(distinct order_id) as Total_Orders_Placed from pizza_sales

-----5.Average Pizzas Per Order----------

select sum(quantity)*1.0/ COUNT(distinct order_id) as Average_Pizzas_Per_Order from pizza_sales

------6.Daily Trend For Total Orders------------

select DATENAME(WEEKDAY,order_date) as Order_Day,COUNT(distinct order_id) as Total_Orders from pizza_sales
group by  DATENAME(WEEKDAY,order_date)

-----7.Monthly Trend for Total Orders-------

select DATENAME(MONTH,order_date) as Month_Name,COUNT(distinct order_id) as Total_Orders from pizza_sales
group by  DATENAME(MONTH,order_date)

----8.% of Sales By Pizza Category------

select pizza_category,round(sum(total_price),2) as total_revenue ,round(SUM(total_price)*100/(select sum(total_price) from pizza_sales),2) as PCT from pizza_sales
group by pizza_category

-----9.% of Sales By Pizza Size------------

select pizza_size,round(sum(total_price),2) as total_revenue ,round(SUM(total_price)*100/(select sum(total_price) from pizza_sales),2) as PCT from pizza_sales
group by pizza_size
order by pizza_size

------10.Total Pizza Sold by Pizza Category--------

select pizza_category, sum(quantity) as Total_Quantity_Sold from pizza_sales
group by pizza_category
order by Total_Quantity_Sold desc

------11.Top 5 Pizzas By Revenue-----------

select top 5 pizza_name ,round(sum(total_price),2) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc

-----12.Bottom 5 Pizzas By Revenue---------

select top 5 pizza_name ,round(sum(total_price),2) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue asc

------13.Top 5 Pizzas By Quantity-----------
select top 5 pizza_name ,SUM(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity desc

----14.Bottom 5 Pizzas By Quantity---------

select top 5 pizza_name ,SUM(quantity) as Total_Quantity from pizza_sales 
group by pizza_name
order by Total_Quantity asc

------15.Top 5 Pizzas By Total Orders-----------

select top 5 pizza_name ,count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders desc

----16.Bottom 5 Pizzas By Total Orders---------

select top 5 pizza_name ,count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by Total_Orders asc




