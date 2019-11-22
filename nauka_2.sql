-- USE northwind
-- SELECT TOP 5 orderid, productid, quantity
-- FROM [order details]
-- ORDER BY quantity DESC

-- USE northwind
-- SELECT COUNT (ReportsTo)
-- FROM employees

-- SELECT Avg(UnitPrice)
-- FROM Products

-- SELECT SUM(Quantity)
-- FROM [Order Details]


-- Podaj liczbę produktów o cenach mniejszych niż 10$ lub
-- większych niż 20$
-- SELECT count(*)
-- FROM products
-- Where UnitPrice < 10 or UnitPrice > 20

-- Podaj maksymalną i minimalną i średnią cenę produktu dla
-- produktów o produktach sprzedawanych w butelkach
-- (‘bottle’)
-- SELECT MIN(UnitPrice), Max(UnitPrice)
-- FROM Products
-- Where QuantityPerUnit Like '%bottle%'

-- USE northwind
-- SELECT productid, orderid,quantity
-- FROM orderhist
--
-- USE northwind
-- SELECT productid
-- ,SUM(quantity) AS total_quantity
-- FROM orderhist
-- GROUP BY productid

-- SELECT OrderID, Max(Unitprice), Min(UnitPrice)
-- FROM [Order Details]
-- GROUP BY OrderID
-- ORDER BY Max(UnitPrice)

-- SELECT ShipName , Count(*)
-- FROM Orders
-- WHERE OrderDate Like '%96%'
-- GROUP BY ShipName
-- ORDER BY Count(*)

-- SELECT productid, SUM(quantity)
-- AS total_quantity
-- FROM orderhist
-- GROUP BY productid
-- -- HAVING SUM(quantity)>=30

-- Wyświetl zamówienia dla których liczba pozycji zamówienia jest
-- większa niż 5

-- SELECT OrderID, Count(ProductID)
-- FROM [Order Details]
-- GROUP BY OrderID
-- HAVING Count(ProductID) >5

-- Wyświetl klientów dla których w 1998 roku zrealizowano więcej
-- niż 8 zamówień (wyniki posortuj malejąco wg łącznej kwoty za
-- dostarczenie zamówień dla każdego z klientów)

-- SELECT CustomerID, Count(CustomerID) AS ilosc_zamowien, SUM(Freight)
-- FROM Orders
-- WHERE YEAR(OrderDate) = 1998
-- GROUP BY CustomerID
-- WITH ROLLUP
-- HAVING Count(CustomerID) >8
-- ORDER BY SUM(Freight) DESC

-- SELECT productid, orderid, SUM(quantity) AS total_quantity FROM orderhist
-- GROUP BY productid, orderid
-- WITH CUBE
-- ORDER BY productid, orderid

-- CW1
-- Napisz polecenie, które oblicza wartość sprzedaży dla każdego
-- zamówienia w tablicy order details i zwraca wynik posortowany
-- w malejącej kolejności (wg wartości sprzedaży).
-- § Zmodyfikuj zapytanie z poprzedniego punktu, tak aby zwracało
-- pierwszych 10 wierszy

-- SELECT TOP 10 OrderID, SUM(UnitPrice*Quantity*(1-Discount)) AS CumulatedPrice
-- FROM [Order Details]
-- GROUP BY OrderID
-- ORDER BY CumulatedPrice DESC

-- CW2
-- Podaj liczbę zamówionych jednostek produktów dla
-- produktów, dla których productid < 3
-- n Zmodyfikuj zapytanie z poprzedniego punktu, tak aby podawało
-- liczbę zamówionych jednostek produktu dla wszystkich
-- produktów
-- n Podaj nr zamówienia oraz wartość zamówienia, dla zamówień,
-- dla których łączna liczba zamawianych jednostek produktów
-- jest > 250

-- SELECT ProductID, Sum(Quantity)
-- FROM [Order Details]
-- GROUP BY ProductID
-- HAVING Sum(Quantity) >250

-- CW3
-- Dla każdego pracownika podaj liczbę obsługiwanych przez
-- niego zamówień
-- SELECT EmployeeID, Count(OrderID)
-- FROM Orders
-- GROUP BY EmployeeID

-- Dla każdego spedytora/przewoźnika podaj wartość "opłata za
-- przesyłkę" przewożonych przez niego zamówień
-- SELECT ShipVia, Sum(Orders.Freight)
-- FROM Orders
-- GROUP BY ShipVia
--
-- Dla każdego spedytora/przewoźnika podaj wartość "opłata za
-- przesyłkę" przewożonych przez niego zamówień w latach o
-- 1996 do 1997
-- SELECT ShipVia, Sum(Orders.Freight)
-- FROM Orders
-- WHERE YEAR(ShippedDate) BETWEEN 1996 and 1997
-- GROUP BY ShipVia

-- Dla każdego pracownika podaj liczbę obsługiwanych przez
-- niego zamówień z podziałem na lata i miesiące
-- SELECT EmployeeID, Count(OrderID) as OrderAmount, YEAR(OrderDate), MONTH(OrderDate)
-- FROM Orders
-- GROUP BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate)
-- ORDER BY EmployeeID, YEAR(OrderDate), MONTH(OrderDate)

-- Dla każdej kategorii podaj maksymalną i minimalną cenę
-- produktu w tej kategorii

-- SELECT CategoryID, MIN(UnitPrice), MAX(UnitPrice)
-- FROM Products
-- GROUP BY CategoryID