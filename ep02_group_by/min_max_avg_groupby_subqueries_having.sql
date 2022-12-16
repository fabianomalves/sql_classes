-- Using select in initial querie with the table tb_products
SELECT
	*
FROM
	tb_products AS tp
LIMIT 10;
------------------------------

/* What is the heaviest product? 
 * What is the lightest product?
 * What is the product average?
 */

SELECT
	MAX(tp.product_weight_g) AS heaviest_product,
	-- Using MAX function to return the largest value
	MIN(tp.product_weight_g) AS lightest_product,
	-- Using MIN function to return the smallest value
	AVG(tp.product_weight_g) AS average_weight_product
	-- Using AVG function to return the average value of a numeric column
FROM
	tb_products AS tp
WHERE
	tp.product_category_name = 'artes'
	------------------------------

SELECT
	MAX(tp.product_weight_g) AS heaviest_product,
	MIN(tp.product_weight_g) AS lightest_product,
	AVG(tp.product_weight_g) AS average_weight_product
FROM
	tb_products AS tp
WHERE
	tp.product_category_name = 'beleza_saude';
------------------------------

SELECT
	tp.product_category_name AS category,
	MAX(tp.product_weight_g) AS heaviest_weight_product,
	MIN(tp.product_weight_g) AS lightest_weight_product,
	AVG(tp.product_weight_g) AS average_weight_product
FROM
	tb_products AS tp
GROUP BY
	tp.product_category_name;
------------------------------

-- Using the COUNT function to count the quantity of products
SELECT
	tp.product_category_name AS category,
	COUNT(*) AS quant_products,
	MAX(tp.product_weight_g) AS heaviest_weight_product,
	MIN(tp.product_weight_g) AS lightest_weight_product,
	AVG(tp.product_weight_g) AS average_weight_product
FROM
	tb_products AS tp
GROUP BY
	tp.product_category_name;
------------------------------

/* Using the WHERE clause to remove the NULL fields.
 * The WHERE is using before the GROUP BY.
 */ 
SELECT
	tp.product_category_name AS category,
	COUNT(*) AS quant_products,
	MAX(tp.product_weight_g) AS heaviest_weight_product,
	MIN(tp.product_weight_g) AS lightest_weight_product,
	AVG(tp.product_weight_g) AS average_weight_product
FROM
	tb_products AS tp
WHERE
	tp.product_category_name IS NOT NULL
GROUP BY
	tp.product_category_name;
------------------------------

SELECT
	tp.product_category_name AS category,
	COUNT(*) AS quant_products,
	MAX(tp.product_weight_g) AS heaviest_weight_product,
	MIN(tp.product_weight_g) AS lightest_weight_product,
	AVG(tp.product_weight_g) AS average_weight_product
FROM
	tb_products AS tp
WHERE
	tp.product_category_name IS NOT NULL
	AND tp.product_category_name != 'alimentos'
GROUP BY
	tp.product_category_name;
------------------------------

-- Using select in initial querie with the table tb_sellers 
SELECT
	*
FROM
	tb_sellers AS ts
LIMIT 10;
------------------------------

--How many sellers does the company have?
SELECT 
	COUNT(*) AS total_sellers,
	COUNT(ts.seller_id) AS total_id_sellers ,
	COUNT(DISTINCT ts.seller_id) AS total_distinct_sellers
FROM
	tb_sellers AS ts;
------------------------------

--How many sellers does the company have in SP state?
SELECT 
	ts.seller_state,	
	COUNT(DISTINCT ts.seller_id) AS total_distinct_sellers
FROM
	tb_sellers AS ts
WHERE
	ts.seller_state = 'SP'
GROUP BY
	ts.seller_state ;
------------------------------

--How many sellers does the company have in SP, RJ, and PR states?
SELECT
	ts.seller_state AS state,
	COUNT(DISTINCT ts.seller_id) AS quant_sellers
FROM
	tb_sellers AS ts
WHERE
	ts.seller_state IN (
		'SP', 'RJ', 'PR'
	)
GROUP BY
	ts.seller_state;
------------------------------

--How many sellers does the company have in each state?
SELECT 
	ts.seller_state AS state,
	COUNT(DISTINCT ts.seller_id) AS total_distinct_sellers
FROM
	tb_sellers AS ts
GROUP BY
	ts.seller_state;
------------------------------

--How many sellers does the company have in each important state(more them 10 sellers)?
-- Using subqueries
SELECT
	t1.*
FROM
	(
		SELECT
			ts.seller_state AS state,
			COUNT(DISTINCT ts.seller_id) AS total_distinct_sellers
		FROM
			tb_sellers AS ts
		GROUP BY
			ts.seller_state
	) AS t1
WHERE
	t1.total_distinct_sellers > 10;
------------------------------

--How many sellers does the company have in each important state(more them 10 sellers)?
-- Using having
SELECT
	ts.seller_state AS state,
	COUNT(DISTINCT ts.seller_id) AS total_distinct_sellers
FROM
	tb_sellers AS ts
GROUP BY
	ts.seller_state
HAVING 
	COUNT(DISTINCT ts.seller_id) > 10
	-- remove states with less them 10 sellers;
------------------------------

SELECT
	ts.seller_state AS state,
	COUNT(DISTINCT ts.seller_id) AS quant_sellers
FROM
	tb_sellers AS ts
	-- Filter before agragation
WHERE
	ts.seller_state IN (
		'SP', 'RJ', 'PR', 'AC'
	)
	--agragation
GROUP BY
	ts.seller_state
	--Filter after agregation
HAVING
	COUNT(DISTINCT ts.seller_id) > 10;
------------------------------
