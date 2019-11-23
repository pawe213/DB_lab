USE Northwind
SELECT Orderid, customerid
FROM Orders
Where OrderDate < '1996-08-01'

-- 1. Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie
-- SELECT CompanyName, Address
-- FROM Customers
-- WHERE City = 'London'

-- SELECT CompanyName, Address
-- FROM Customers
-- WHERE  (Country ='Spain' OR  Country ='France')

-- 6. Wybierz nazwy produktów których nie ma w magazynie
-- SELECT ProductName
-- FROM Products
-- WHERE Products.UnitsInStock = 0

-- 5. Znajdź klientów, którzy w swojej nazwie mają w którymś miejscu
-- słowo ‘Store’
-- SELECT Customers.CompanyName
-- FROM Customers
-- WHERE CompanyName LIKE '%Store%'

-- 1. Szukamy informacji o produktach o cenach mniejszych niż 10 lub
-- większych niż 20
-- SELECT Products.UnitPrice
-- FROM Products
-- WHERE UnitPrice BETWEEN 20  and 30

-- SELECT companyname, country
-- FROM suppliers
-- WHERE country IN ('Japan', 'Italy')

-- SELECT OrderID, OrderDate, CustomerID
-- FROM Orders
-- WHERE OrderDate < GETDATE()
-- AND ShipCountry = 'Argentina'

-- Wybierz nazwy i kraje wszystkich klientów, wyniki posortuj
-- według kraju, w ramach danego kraju nazwy firm posortuj
-- alfabetycznie

-- SELECT Country, CompanyName
-- FROM Customers
-- ORDER BY Country, CompanyName

-- 3. Wybierz nazwy i kraje wszystkich klientów mających siedziby w
-- Japonii (Japan) lub we Włoszech (Italy), wyniki posortuj tak jak w
-- pkt 1

-- SELECT  CompanyName, Country
-- FROM Customers
-- WHERE Country in ('Japan', 'Italy')
-- GROUP BY  CompanyName, Country

-- n Napisz polecenie, które oblicza wartość każdej pozycji zamówienia
-- o numerze 10250

-- SELECT UnitPrice*Quantity*(1-Discount)
-- FROM [Order Details]
-- WHERE OrderID = 10250

DECLARE @zmienna varchar(60)
SET @zmienna = 'Fax'
SELECT Phone + ' , ' + SUBSTRING(FAX, 0, 4) AS dane
FROM Suppliers


