--Задача 2
SELECT
ProductName, Price
FROM Products
WHERE
Price > 20

--Задача 3
SELECT
Country
FROM Suppliers

--Задача 4
SELECT
ProductName
FROM Products
WHERE
NOT SupplierID = 1
ORDER BY Price ASC

--Задача 5
SELECT
ContactName
FROM Customers
WHERE
NOT Country='France'
AND
NOT Country='USA'