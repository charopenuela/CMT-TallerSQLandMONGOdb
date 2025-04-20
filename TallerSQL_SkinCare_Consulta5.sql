--  Obtener todos los productos con sus categorías y subcategorías
SELECT 
	prod.NamePro AS Producto,
    cat.NameCat AS Categoria,
    subcat.NameSubCat AS Subcategoria,
	prod.Price AS Precio_USD
FROM Products  prod
LEFT JOIN Product_Categories prod_cat ON prod.Pro_ID = prod_cat.Pro_ID
LEFT JOIN Categories cat ON prod_cat.Cat_ID = cat.Cat_ID
LEFT JOIN SubCategories subcat ON prod_cat.Sub_ID = subcat.Sub_ID
ORDER BY cat.NameCat, subcat.NameSubCat,  prod.NamePro;