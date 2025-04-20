-- 2. ¿Qué productos cuestan más de $11.50?
USE SkinCare;
SELECT Pro_ID, NamePro, Price
FROM Products
WHERE Price > 11.50
ORDER BY Price DESC;