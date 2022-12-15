-- Ex1: Quantos produtos temos da categoria 'artes'?

-- COUNT 
SELECT COUNT(*) AS quant_lines, 
	COUNT(product_id) AS quant_id_product,
	COUNT(DISTINCT product_id) AS quant_distinct_id_product, 
	COUNT(DISTINCT product_category_name) AS quant_category
FROM tb_products
WHERE product_category_name = 'artes';

SELECT product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm
FROM tb_products;
