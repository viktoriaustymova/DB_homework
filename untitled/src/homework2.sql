--Задача 1. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT
    Products.ProductName,
    Products.Price * 1.07  AS Price_usd
FROM OrderDetails
ORDER BY Products.Price DESC
LIMIT 1

--Задача 2. Вывести два самых дорогих товара из категории Beverages из USA

SELECT *
FROM Products
         JOIN Categories ON Products.CategoryID=Categories.CategoryID
         JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE
  CategoryName = 'Beverages'
AND
  Country = 'USA'
ORDER BY Products.Price DESC
LIMIT 2

--Задача 3. Удалить товары с ценой менее 5 EUR

DELETE FROM Products
WHERE Price < 5

--Задача 4. Вывести список стран, которые поставляют морепродукты

SELECT DISTINCT
    Suppliers.Country

FROM Products

         JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
         JOIN Categories ON Products.CategoryID=Categories.CategoryID

WHERE
        Categories.CategoryName='Seafood'

--Задача 5. Очистить поле ContactName у всех клиентов не из China

UPDATE Customers
SET
    ContactName = ''
WHERE
    NOT Country = 'China'


