-- Ex4: Quantos produtos de 'beleza_saude' com menos de 1 litro?

SELECT COUNT(*) AS quant_lines,
	COUNT(tp.product_id) AS id_product,
	COUNT(DISTINCT tp.product_id) AS distinct_id_product
FROM tb_products AS tp
WHERE (tp.product_length_cm * tp.product_height_cm * tp.product_width_cm) / 1000 < 1 -- converting the cm3 to liter
AND tp.product_category_name = 'beleza_saude';