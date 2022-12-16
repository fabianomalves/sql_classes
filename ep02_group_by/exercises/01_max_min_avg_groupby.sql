/* Make a query that presents the average, 
 * maximum and minimum size of the object description 
 * by category
 */
SELECT
	tp.product_category_name AS category,
	AVG(tp.product_description_lenght) AS average_product_size,
	MIN(tp.product_description_lenght) AS minimun_product_size,
	MAX(tp.product_description_lenght) AS maximum_product_size
FROM
	tb_products AS tp
GROUP BY
	tp.product_category_name;
------------------------------