/* Understand the SQL, and the clauses SELECT, FROM, WHERE, OR, AND
 * 
 */

SELECT seller_id AS si, seller_state AS ss
FROM tb_sellers;
--

SELECT *
FROM tb_products AS tp
LIMIT 10;
--

SELECT product_id AS id_products, product_photos_qty, product_category_name AS product_category
FROM tb_products AS tp
LIMIT 10;
--

SELECT product_id AS id_product, product_category_name AS category, product_photos_qty AS qty_photo
FROM tb_products AS tp
WHERE product_category_name = 'bebes'
--

SELECT product_id AS id_product, product_category_name AS category, product_photos_qty AS qty_photo
FROM tb_products AS tp
WHERE product_category_name = 'bebes'
AND product_photos_qty > 1;
--

SELECT product_id AS id_product, product_category_name AS category, product_photos_qty AS qty_photo
FROM tb_products AS tp
WHERE(product_category_name = 'bebes'
	OR product_category_name = 'perfumaria')
AND product_photos_qty > 1;
--

/* Select the table where the quantity photo of the product's category babes is bigger than 1 
 * and the quantity photo of the product's category perfumaria is bigger than 5
 */ 

SELECT tp.product_id AS id_product, tp.product_category_name AS category, tp.product_photos_qty AS qty_image
FROM tb_products AS tp
WHERE(tp.product_category_name = 'bebes'
	AND tp.product_photos_qty > 1)
OR (tp.product_category_name = 'perfumaria'
	AND product_photos_qty > 5);
