-- 4. Muestra todas las categorías, incluso si no tienen productos asignados. (LEFT JOIN)
USE SkinCare;
SELECT 
	cat.NameCat AS Categoria, 
    subcat.NameSubCat AS Subcategoria, 
    prod.NamePro AS Producto
FROM Categories cat
LEFT JOIN Product_Categories prod_cat ON cat.Cat_ID = prod_cat.Cat_ID
LEFT JOIN SubCategories subcat ON prod_cat.Sub_ID = subcat.Sub_ID
LEFT JOIN Products prod ON prod_cat.Pro_ID = prod.Pro_ID
ORDER BY cat.NameCat, subcat.NameSubCat, prod.NamePro;