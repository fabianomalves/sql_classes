-- Crie uma coluna nova que contenha a informação de volume em m3

SELECT 
	tp.product_id, 
	tp.product_category_name, 
	tp.product_name_lenght, 
	tp.product_description_lenght, 
	tp.product_photos_qty, 
	tp.product_weight_g, 
	(tp.product_length_cm * tp.product_height_cm * tp.product_width_cm) / 1000000 AS product_volume_m3, -- converting cm3 into m3
	tp.product_length_cm, 
	tp.product_height_cm, 
	tp.product_width_cm
FROM tb_products AS tp;