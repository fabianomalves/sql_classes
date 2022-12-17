-- Using SELECT * to see all columns
SELECT
	*
FROM
	tb_products tp
LIMIT 10;
------------------------------
/*
List all category lists alphabetically
Using SELECT DISTINCT for select only distinct data,
like each product category name.*/
SELECT
	DISTINCT
	tp.product_category_name AS category
FROM
	tb_products AS tp
ORDER BY
	tp.product_category_name ASC;
------------------------------

--Using IS NOT NULL for remove null fields * 
SELECT
	DISTINCT
	tp.product_category_name AS category
FROM
	tb_products AS tp
WHERE
	tp.product_category_name IS NOT NULL
ORDER BY
	tp.product_category_name ASC;
------------------------------

--Using CASE WHEN THEN ELSE to filter the NULL fields
SELECT
	DISTINCT 
	CASE
		WHEN tp.product_category_name IS NULL THEN 'others'
		ELSE tp.product_category_name
	END AS category_fillnan
FROM
	tb_products AS tp
ORDER BY 1
-- Using ORDER BY 1 to order the data others, formerly NULL.
------------------------------

/*Using CASE WHEN, CASE WHEN WHEN with 
OR, IN, and LIKE to filter the NULL fields
and group similar categories*/
SELECT
	DISTINCT 
	CASE
		WHEN tp.product_category_name IS NULL THEN 'others'
		WHEN tp.product_category_name = 'alimentos'
		OR tp.product_category_name = 'alimentos_bebidas' THEN 'alimentos'
		--Using OR to filter 2 categories
		WHEN tp.product_category_name 
		IN (		
			'artes', 'artes_e_artesanato'
		) THEN 'artes'
		--Using IN, to filter categories, with ()
		WHEN tp.product_category_name 
		LIKE '%artigos%' THEN 'artigos'
		--Using LIKE, to filter categories, with similar names
		ELSE tp.product_category_name
	END AS category_fillnan
FROM
	tb_products AS tp
ORDER BY
	1
-- Using ORDER BY 1 to order the data others, formerly NULL.
------------------------------

/*
Using COALESCE to filter the NULL values into table.
The COASLESCE is better then CASE WHEN. 
Is more concise.*/
SELECT
	DISTINCT COALESCE(
		tp.product_category_name ,
		'others'
	) AS category_fillnan
FROM
	tb_products AS tp
ORDER BY
	1

