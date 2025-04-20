-- 1. ¿Para qué se usan las claves foráneas?
-- Las claves foráneas (foreign keys) se utilizan para establecer relaciones entre tablas en una base de datos relacional. 
-- Su función principal es:
-- Garantizar la integridad referencial, es decir, asegurar que los valores en una columna (o combinación de columnas) 
-- en una tabla (llamada tabla hija) correspondan a valores existentes en otra tabla (la tabla padre).
-- Por ejemplo:
-- FOREIGN KEY (Pro_ID) REFERENCES Products(Pro_ID)
-- Este fragmento garantiza que solo se puedan insertar en la tabla Product_Categories identificadores de productos (Pro_ID) 
-- que existan en la tabla Products. Así se evitan errores como registrar categorías para productos que no existen.

-- 2. ¿Qué diferencia hay entre INNER JOIN y LEFT JOIN?
-- Ambos se usan para combinar registros de dos o más tablas basados en una condición de unión, pero hay una 
-- diferencia importante en cómo tratan los registros que no tienen coincidencia en una de las tablas.
-- Tipo de JOIN	¿Qué devuelve?
-- INNER JOIN	Solo los registros que tienen coincidencias en ambas tablas.
-- LEFT JOIN	Todos los registros de la tabla izquierda, y los coincidentes de la tabla derecha. Si no hay coincidencia, rellena con NULL.
-- Ejemplo aplicado:
-- Supongamos que quiere ver los productos con su subcategoría (si la tienen):
-- LEFT JOIN: muestra todos los productos, incluso si no tienen subcategoría
SELECT P.NamePro, SC.NameSubCat
FROM Products P
JOIN Product_Categories PC ON P.Pro_ID = PC.Pro_ID
LEFT JOIN SubCategories SC ON PC.Sub_ID = SC.Sub_ID;
-- INNER JOIN: solo muestra productos que sí tienen subcategoría asignada
SELECT P.NamePro, SC.NameSubCat
FROM Products P
JOIN Product_Categories PC ON P.Pro_ID = PC.Pro_ID
INNER JOIN SubCategories SC ON PC.Sub_ID = SC.Sub_ID;