-- DROP DATABASE elimina la base de datos. IF EXISTS evita que se genere un error si la base de datos no existe aún.
DROP DATABASE IF EXISTS SkinCare;

-- Creo la base de datos de una Tienda de Skin Care
CREATE DATABASE SkinCare;
USE SkinCare;

-- Parte 1: Crear las tablas

-- Creo la tabla Products, la cual contiene la clave primaria, el nombre del producto y el precio
CREATE TABLE Products(
Pro_ID INT PRIMARY KEY,
NamePro CHAR(100) NOT NULL,
Price DECIMAL(5,2)
);

-- Creo la tabla Categories, la cual contiene la clave primaria, el nombre de la categoría
CREATE TABLE Categories(
Cat_ID INT PRIMARY KEY,
NameCat CHAR(100) NOT NULL
);

-- He ideado una Subcategoría, porque la vi necesaria
CREATE TABLE SubCategories(
    Sub_ID INT PRIMARY KEY,
    NameSubCat CHAR(100) NOT NULL
);

-- Creo la tabla que relaciona los productos con categorías y subcategorías
CREATE TABLE Product_Categories(
    Pro_ID INT,
    Cat_ID INT,
    Sub_ID INT NULL,
    PRIMARY KEY (Pro_ID, Cat_ID),    -- Clave primaria solo con Pro_ID y Cat_ID
    UNIQUE (Pro_ID, Cat_ID, Sub_ID), -- Restricción única que permite NULL
    FOREIGN KEY (Pro_ID) REFERENCES Products(Pro_ID),
    FOREIGN KEY (Cat_ID) REFERENCES Categories(Cat_ID),
    FOREIGN KEY (Sub_ID) REFERENCES SubCategories(Sub_ID)
);

-- Parte 2: Insertar Datos

-- Inserto los productos
INSERT INTO Products (Pro_ID, NamePro, Price)
VALUES 
    (1, 'Revitalift Triple Power Anti-Aging Moisturizer', 21.50),
    (2, 'Age Perfect Midnight Cream', 30.00),
    (3, 'Revitalift 1.5% Hyaluronic Acid Serum (30 ml)', 22.99),
    (4, 'Revitalift Filler Eye Serum', 22.50),
    (5, 'Age Perfect Cell Renew Midnight Serum (30 ml)', 27.50),
    (6, 'Glycolic Bright Glowing Night Cream (50 ml)', 23.99),
    (7, 'Lumi lotion Natural Glow Enhancer', 23.00),
    (8, 'Micellar Water Makeup Remover (400 ml)', 10.50),
    (9, 'Cleancing Hyaluronic Acid Gel (150 ml)', 10);

-- Inserto las categorías
INSERT INTO Categories (Cat_ID, NameCat)
VALUES
    (1, 'Moisturizer'),
    (2, 'Anti-aging'),
    (3, 'Serum'),
    (4, 'Exfoliant'),
    (5, 'Cleanser');
    
-- Inserto las subcategorías
INSERT INTO SubCategories (Sub_ID, NameSubCat)
VALUES
    (2, 'Night use'),
    (3, 'Illuminating'),
    (4, 'Hydrating'),
    (5, 'Eye'),
    (6, 'Regenerating'),
    (7, 'Makeup Remover');
 
 -- Relaciono productos con categorías y subcategorías
INSERT INTO Product_Categories (Pro_ID, Cat_ID, Sub_ID)
VALUES
    (1, 1, NULL), (1, 2, NULL),          -- 1 → Moisturizer AND Anti-aging
    (2, 1, 2), (2, 2, NULL),             -- 2 → Moisturizer AND Anti-aging + Night use
    (3, 3, 4),                           -- 3 → Serum + Hydrating
    (4, 3, 5),                           -- 4 → Serum + Eye
    (5, 2, 6), (5, 3, 2), (5, 1, NULL),  -- 5 → Serum AND Anti-aging AND Moisturizer + Regenerating + Night use
    (6, 4, 2),                           -- 6 → Exfoliant + Night use
    (7, 1, 3),                           -- 7 → Moisturizer + Illuminating
    (8, 5, 7),                           -- 8 → Cleanser + Makeup Remover
    (9, 5, 4);                           -- 8 → Cleanser + Hydrating