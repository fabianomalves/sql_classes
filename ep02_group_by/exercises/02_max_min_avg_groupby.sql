/*Make a query that presents the average, 
 * maximum and minimum size of the object name 
 * by category
 */
SELECT
	tp.product_category_name AS category,
	AVG(tp.product_name_lenght) AS average_size_product_name,
	MIN(tp.product_name_lenght) AS minimum_size_product_name,
	MAX(tp.product_name_lenght) AS maximum_size_product_name
FROM
	tb_products AS tp
GROUP BY 
	tp.product_category_name;
------------------------------
