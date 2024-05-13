create database pizza_sales;

use pizza_sales;

select * from [pizza_sales (6) - pizza_sales.csv];

--1. Total Revenue: The sum of the total price of all pizza orders ?---

SELECT ROUND(SUM(total_price),2) AS Total_Revenue
FROM[pizza_sales (6) - pizza_sales.csv];

--2. Average Order Value: The average amount spent per order, calculated by dividing
the total revenue by the total number of orders.

SELECT round(SUM(total_price) / COUNT(order_id),2) AS Average_order_value
FROM [pizza_sales (6) - pizza_sales.csv];--3 Total Pizzas Sold: The sum of the quantities of all pizza sold.--

SELECT SUM(quantity) AS Total_pizzas_sold
FROM [pizza_sales (6) - pizza_sales.csv];

--4 Total Orders: The total number of orders placed.--

SELECT COUNT(order_id) AS Total_orders
fROM [pizza_sales (6) - pizza_sales.csv];

--5 Average Pizza Per Order: The average number of pizzas sold per order, calculated by
dividing the total number of pizzas sold by the total number of orders--

SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2)AS Average_pizza_per_order
FROM [pizza_sales (6) - pizza_sales.csv];

--1. Daily trend for total Orders: Create a bar chart that displays the daily trend of total
orders over a specific time period.--

SELECT order_date , sum(total_price) AS total_pricess
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY order_date;

--#2) Monthly Trend for Total Orders: Create a line chart that illustrates the hourly trend of total
orders throughout that day. This chart will allow us to identify
# peak hours or periods of high order activity.---

SELECT DATEPART(HOUR, order_time) AS HourOfDay,
       COUNT(*) AS TotalOrders
FROM [pizza_sales (6) - pizza_sales.csv]
WHERE pizza_category='Classic'
    
GROUP BY DATEPART(HOUR, order_time)
ORDER BY HourOfDay;

--3 Percentage of Sales by Pizza Category: Create a pie that shows the distribution of sales
across different pizza categories. This chart will provide insights into
# that popularity of various pizza categories and their contribution to overall sales.--

SELECT pizza_category FROM [pizza_sales (6) - pizza_sales.csv];
SELECT pizza_category, SUM(total_price) AS category_sales
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_category;

-- 5. Total Pizza Sold by Pizza Category: Create a funnel chart that presents the total number of
pizzas sold for each pizza category. This chart will allow us to
# compare the sales performance of different pizza categories.
# pizza_categories--

SELECT pizza_category, SUM(quantity) AS pizzas_sold
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_category;#size wise --
SELECT pizza_size, SUM(quantity) AS pizzas_sold
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_size-- 6. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders: Create a bar chart
highlighting the top 5 best-selling pizza based on the Revenue, Total
# Quantity, Total Orders. This chart will help us identify the most popular pizza options.

# Top 5 Best Sellers by Revenue
SELECT pizza_name AS pizza_name, SUM(total_price) AS revenue
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_name
ORDER BY revenue DESC;


# Total Quantity:
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_name
ORDER BY total_quantity DESC;


# Total Orders:
SELECT pizza_name, COUNT(order_id) AS total_orders
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_name
ORDER BY total_orders DESC;

--7. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders: Create a bar chart
showcasing the bottom 5 worst – selling pizzas based on the Revenue,
# Total Quantity, Total Orders. This chart will enable us to identify underperforming or less
popular pizza options.
# Top 5 Best Sellers by Revenue

SELECT pizza_name AS pizza_name, SUM(total_price) AS revenue
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_name
ORDER BY revenue DESC

# Total Quantity:
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_name
ORDER BY total_quantity DESC

# Total Orders:
SELECT pizza_name, COUNT(order_id) AS total_orders
FROM [pizza_sales (6) - pizza_sales.csv]
GROUP BY pizza_name
ORDER BY total_orders DESC
