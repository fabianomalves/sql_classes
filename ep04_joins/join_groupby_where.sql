/* What's the total revenue for each product category?
 * What are the total sales?
 * What's the total of units, and orders?
 */

-- Select products table
SELECT
	*
FROM
	tb_products AS tp
LIMIT 10;
-----------------------------

-- Select orders table 
SELECT
	*
FROM
	tb_orders AS to1
LIMIT 10;
-----------------------------

-- Select orders items table 
SELECT *
FROM tb_order_items AS toi
LIMIT 10;
-----------------------------

/*Making a join and bring only product category name 
 * from the table 2
 */
SELECT
	t1.order_id,
	t1.order_item_id,
	t1.product_id,
	t2.product_category_name,
	t1.price 
FROM
	tb_order_items AS t1
LEFT JOIN tb_products AS t2 
ON
	t1.product_id = t2.product_id
-----------------------------

/*Now using the GROUP BY the product_category_name. 
 * In example, there is the query with join,
 * filtering and bring the 10 best product category, 
 * by revenue
 * */ 
SELECT
	t2.product_category_name,
	SUM(t1.price) AS revenue
FROM
	tb_order_items AS t1
LEFT JOIN tb_products AS t2 
ON
	t1.product_id = t2.product_id
GROUP BY 	
	t2.product_category_name
ORDER BY
	SUM(t1.price) DESC
LIMIT 10;
-----------------------------

--Using a COUNT and exhibiting the counting of total sales items
SELECT
	t2.product_category_name,
	SUM(t1.price) AS revenue,
	COUNT(*) AS total_items_sales
FROM
	tb_order_items AS t1
LEFT JOIN tb_products AS t2 
ON
	t1.product_id = t2.product_id
GROUP BY 	
	t2.product_category_name
ORDER BY
	SUM(t1.price) DESC
-----------------------------

SELECT t2.product_category_name, SUM(t1.price) AS revenue,
-- Using COUNT, to bring all itens sales
COUNT(*) AS total_items_sales,
-- Using a DISTINCT, to bring back only distinct orders
COUNT(DISTINCT t1.order_id) AS quant_orders,
--Dividing the total sales by quantity order and using CAST to
--transform integer into float.
--Using round to limit the number in 2 decimals
ROUND(COUNT(*) / CAST(COUNT(DISTINCT t1.order_id) AS FLOAT), 2) AS average_items_by_orders
FROM tb_order_items AS t1
LEFT JOIN tb_products AS t2 
ON t1.product_id = t2.product_id
GROUP BY 	
	t2.product_category_name
ORDER BY COUNT(*) / CAST(COUNT(DISTINCT t1.order_id) AS FLOAT) DESC
-----------------------------	



	
SELECT
	*
FROM
	tb_orders AS to1;
-----------------------------	

/* What's the total revenue for each product category?
 * What are the total sales?
 * What's the total of units, and orders?
 * Considering only the sales from 2017, and delivered orders 
 */

SELECT t2.product_category_name, SUM(t1.price) AS revenue,
-- Using COUNT, to bring all itens sales
COUNT(*) AS total_items_sales,
-- Using a DISTINCT, to bring back only distinct orders
COUNT(DISTINCT t1.order_id) AS quant_orders,
--Dividing the total sales by quantity order and using CAST to
--transform integer into float.
--Using round to limit the number in 2 decimals
ROUND(COUNT(*) / CAST(COUNT(DISTINCT t1.order_id) AS FLOAT), 2) AS average_items_by_orders
FROM tb_order_items AS t1
LEFT JOIN tb_products AS t2 
ON t1.product_id = t2.product_id
LEFT JOIN tb_orders AS t3
ON t1.order_id = t3.order_id
WHERE t3.order_status = 'delivered'
AND STRFTIME('%Y', t3.order_approved_at) = '2017'
GROUP BY t2.product_category_name
ORDER BY COUNT(*) / CAST( COUNT(DISTINCT t1.order_id) AS FLOAT ) DESC
-----------------------------	

