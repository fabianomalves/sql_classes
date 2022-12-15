-- Quantos produtos tem mais de 5 litros


SELECT *,
	tp.product_length_cm * tp.product_height_cm * tp.product_width_cm / 1000 AS product_volume_liter -- converting the cm3 to liter
FROM tb_products tp 
WHERE tp.product_length_cm * tp.product_height_cm * tp.product_width_cm / 1000 > 5;

-- counting
SELECT COUNT(*) AS product_counting, 
	COUNT(tp.product_id) AS distinct_product_counting,
	COUNT(DISTINCT tp.product_id) AS distinct_id_product
FROM tb_products tp 
WHERE tp.product_length_cm * tp.product_height_cm * tp.product_width_cm / 1000 > 5;