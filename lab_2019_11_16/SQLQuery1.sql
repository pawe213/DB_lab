USE Northwind
SELECT TOP 5 orderid, productid, quantity
FROM [Order Details]
ORDER BY Quantity DESC

SELECT COUNT (*)
FROM employees


SELECT COUNT (*)
FROM Products
WHERE UnitPrice < 10 or UnitPrice >20

SELECT MAX(Unitprice)
FROM Products
WHERE UnitPrice <20

SELECT MAX(Unitprice), MIN(Unitprice), AVG(Unitprice)
FROM Products
WHERE QuantityPerUnit like '%bottle%'

SELECT *
FROM Products
WHERE UnitPrice > (SELECT AVG(Unitprice) FROM Products)

