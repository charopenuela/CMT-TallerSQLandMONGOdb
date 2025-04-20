-- 3. ¿Qué productos pertenecen a cada categoría? (JOIN)
USE SkinCare;
SELECT 
	cat.NameCat AS Categoria, 
	prod.NamePro AS Producto, 
	prod.Price AS Precio
FROM Categories cat
JOIN Product_Categories prod_cat ON cat.Cat_ID = prod_cat.Cat_ID
JOIN Products prod ON prod_cat.Pro_ID = prod.Pro_ID
ORDER BY cat.NameCat, prod.Price DESC;