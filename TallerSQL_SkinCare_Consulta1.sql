-- ¿Cuáles son todos los productos disponibles y sus precios? 
USE SkinCare;
SELECT Pro_ID, NamePro, Price
FROM Products
ORDER BY Price DESC;