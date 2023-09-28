--1.Найти мин/стоимость товаров для каждой категории
SELECT
CategoryID,
MAX(Price) AS max_price,
MIN(Price) AS min_price
FROM Products
GROUP BY CategoryID

--2.Вывести ТОП-3 стран по количеству доставленных заказов
SELECT
Customers.Country,
COUNT(*) AS total_orders
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY Customers.Country
ORDER BY total_orders DESC
LIMIT 3

--3.Вывести названия категорий, в которых более 10 товаров
SELECT
Categories.CategoryName,
COUNT(*) AS total_products
FROM Products
JOIN Categories ON Products.ProductID=Categories.CategoryID
GROUP BY Categories.CategoryName
HAVING total_products > 10
ORDER BY total_products DESC

--4.Очистить тел/номер поставщикам из USA
UPDATE Suppliers
SET Phone=''
WHERE
Country='USA'

--5.Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT
Employees.FirstName,
Employees.LastName,
COUNT(*) AS total_orders
FROM Orders
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Employees.FirstName,
Employees.LastName
HAVING total_orders < 15
ORDER BY total_orders DESC

--6.Вывести товар, который находится на втором месте по ко-ву заказов
SELECT
Products.ProductName,
SUM(OrderDetails.Quantity) AS total_orders
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
GROUP BY OrderDetails.ProductID
ORDER BY total_orders DESC
LIMIT 1 OFFSET 1
