USE Northwind

-- n Napisz polecenie zwracające jako wynik nazwy klientów, którzy
-- złożyli zamówienia po 01 marca 1998 (baza northwind)

-- SELECT DISTINCT C.CompanyName, O.OrderDate
-- FROM Customers C INNER JOIN Orders O
-- on C.CustomerID = O.CustomerID
-- WHERE O.OrderDate > '3/1/98'
--
-- SELECT DISTINCT companyname, orderdate
-- FROM orders
-- INNER JOIN customers
-- ON orders.customerid = customers.customerid
-- WHERE orderdate > '3/1/98'
--
-- Wybierz nazwy i ceny produktów (baza northwind) o cenie
-- jednostkowej pomiędzy 20.00 a 30.00, dla każdego produktu podaj
-- dane adresowe dostawcy

-- SELECT Products.ProductName Nazwa, Products.UnitPrice Cena, Suppliers.Address Dostawca
-- FROM Products INNER JOIN Suppliers
-- on Products.SupplierID = Suppliers.SupplierID
-- WHERE UnitPrice BETWEEN 20.00 and 30.00

-- Wybierz nazwy produktów oraz inf. o stanie magazynu dla
-- produktów dostarczanych przez firmę ‘Tokyo Traders’

-- SELECT Products.ProductName, Products.UnitsInStock, Suppliers.CompanyName
-- FROM Products INNER JOIN Suppliers
-- ON Products.SupplierID = Suppliers.SupplierID
-- WHERE CompanyName = 'Tokyo Traders'

-- SELECT Customers.CompanyName, Orders.OrderDate, Customers.Address
-- FROM Customers LEFT OUTER JOIN Orders
-- ON Customers.CustomerID = Orders.CustomerID
-- Where YEAR(OrderDate) ='1997' and OrderID is NULL

-- Wybierz nazwy i numery telefonów dostawców, dostarczających
-- produkty, których aktualnie nie ma w magazynie

-- SELECT Products.ProductName, Suppliers.CompanyName, Suppliers.Phone, UnitsInStock
-- FROM Products LEFT OUTER JOIN Suppliers
-- ON Products.SupplierID = Suppliers.SupplierID
-- Where UnitsInStock = 0 or UnitsInStock is NULL

--Napisz polecenie, które wyświetla listę dzieci będących członkami
--biblioteki (baza library). Interesuje nas imię, nazwisko, data
--urodzenia dziecka i adres zamieszkania dziecka.

-- USE Library
-- SELECT m.lastname, m.firstname, j.birth_date, j.member_no AS numer_dzieciaka, a.city
-- FROM juvenile j INNER JOIN member m
-- On j.member_no = m.member_no
-- Inner JOIN adult a
-- ON j.adult_member_no = a.member_no

--Napisz polecenie, które wyświetla listę dzieci będących członkami
--biblioteki (baza library). Interesuje nas imię, nazwisko, data
--urodzenia dziecka, adres zamieszkania dziecka oraz imię i nazwisko
--rodzica.

-- USE Library
-- SELECT m.lastname, m.firstname, j.birth_date, j.member_no AS numer_dzieciaka, a.city, r.firstname, r.lastname
-- FROM juvenile j INNER JOIN member m
-- On j.member_no = m.member_no
-- Inner JOIN adult a
-- ON j.adult_member_no = a.member_no
-- INNER JOIN member r
-- ON j.adult_member_no = r.member_no

--Podaj listę członków biblioteki mieszkających w Arizonie (AZ) mają
--więcej niż dwoje dzieci zapisanych do biblioteki
-- SELECT a.member_no AS numer_rodzica, m.firstname AS imie_rodzica, m.lastname AS nazwisko_rodzica, Count(j.member_no)
-- FROM adult a INNER JOIN member m ON a.member_no = m.member_no
-- INNER JOIN juvenile j ON a.member_no = j.adult_member_no
-- WHERE a.state = 'AZ'
-- GROUP BY m.firstname, m.lastname, a.member_no
-- HAVING Count(j.member_no) >2

-- CW 1
-- n Dla każdego zamówienia podaj łączną liczbę zamówionych
-- jednostek towaru oraz nazwę klienta.

-- Use Northwind
-- SELECT O.OrderID, Sum(Quantity), C.CompanyName
-- FROM Orders O
-- INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
-- INNER JOIN Customers C on O.CustomerID = C.CustomerID
-- GROUP BY O.OrderID, C.CompanyName

-- n Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia,
-- dla których łączna liczbę zamówionych jednostek jest większa niż
-- 250

-- Use Northwind
-- SELECT O.OrderID, Sum(Quantity), C.CompanyName
-- FROM Orders O
-- INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
-- INNER JOIN Customers C on O.CustomerID = C.CustomerID
-- GROUP BY O.OrderID, C.CompanyName
-- HAVING Sum(Quantity) >250

-- n Dla każdego zamówienia podaj łączną wartość tego zamówienia oraz
-- nazwę klienta.

Use Northwind
SELECT O.OrderID, Sum(Quantity*UnitPrice*(1-Discount)), C.CompanyName
FROM Orders O
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN Customers C on O.CustomerID = C.CustomerID
GROUP BY O.OrderID, C.CompanyName
ORDER BY OrderID

-- n Zmodyfikuj poprzedni przykład, aby pokazać tylko takie zamówienia,
-- dla których łączna liczba jednostek jest większa niż 250.

-- Use Northwind
-- SELECT O.OrderID, Sum(Quantity*UnitPrice*(1-Discount)), C.CompanyName
-- FROM Orders O
-- INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
-- INNER JOIN Customers C on O.CustomerID = C.CustomerID
-- GROUP BY O.OrderID, C.CompanyName
-- HAVING Sum(Quantity) > 250

-- n Zmodyfikuj poprzedni przykład tak żeby dodać jeszcze imię i
-- nazwisko pracownika obsługującego zamówienie

-- Use Northwind
-- SELECT O.OrderID, Sum(Quantity*UnitPrice*(1-Discount)), C.CompanyName, E.LastName, E.FirstName
-- FROM Orders O
-- INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
-- INNER JOIN Customers C on O.CustomerID = C.CustomerID
-- INNER JOIN Employees E on O.EmployeeID = E.EmployeeID
-- GROUP BY O.OrderID, C.CompanyName, E.LastName, E.FirstName
-- HAVING Sum(Quantity) > 250

-- CW2
-- n Dla każdej kategorii produktu (nazwa), podaj łączną liczbę
-- zamówionych przez klientów jednostek towarów z tek kategorii.

-- SELECT P.ProductName, SUM(Quantity) AS ilosc_zamowionych
-- FROM Products P
-- INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID
-- GROUP BY P.ProductName
--
-- -- n Dla każdej kategorii produktu (nazwa), podaj łączną wartość
-- -- zamówionych przez klientów jednostek towarów z tek kategorii.
--
-- SELECT P.ProductName, SUM(Quantity) AS ilosc_zamowionych, SUM(Quantity*P.UnitPrice*(1-OD.Discount)) AS wartosc_zamowien
-- FROM Products P
-- INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID
-- GROUP BY P.ProductName
--
-- -- n Posortuj wyniki w zapytaniu z poprzedniego punktu wg:
-- -- a) łącznej wartości zamówień
-- SELECT P.ProductName, SUM(Quantity) AS ilosc_zamowionych, SUM(Quantity*P.UnitPrice*(1-OD.Discount)) AS wartosc_zamowien
-- FROM Products P
-- INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID
-- GROUP BY P.ProductName
-- ORDER BY wartosc_zamowien
--
-- -- b) łącznej liczby zamówionych przez klientów jednostek towarów.
--
-- SELECT P.ProductName, SUM(Quantity) AS ilosc_zamowionych, SUM(Quantity*P.UnitPrice*(1-OD.Discount)) AS wartosc_zamowien
-- FROM Products P
-- INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID
-- GROUP BY P.ProductName
-- ORDER BY ilosc_zamowionych
--
-- -- n Dla każdego zamówienia podaj jego wartość uwzględniając opłatę za
-- -- przesyłkę
--
-- Use Northwind
-- SELECT O.OrderID, Sum(Quantity*UnitPrice*(1-Discount)+Freight) calkowita_oplata
-- FROM Orders O
-- INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
-- GROUP BY O.OrderID
-- ORDER BY OrderID

-- CW.3
-- Dla każdego przewoźnika (nazwa) podaj liczbę zamówień które
-- przewieźli w 1997r

SELECT S.CompanyName, Count(OrderID) ilosc_zamowiem
FROM Shippers S
INNER JOIN Orders O ON S.ShipperID = O.ShipVia
WHERE YEAR(O.ShippedDate) = '1997'
GROUP BY S.CompanyName


-- n Który z przewoźników był najaktywniejszy (przewiózł największą
-- liczbę zamówień) w 1997r, podaj nazwę tego przewoźnika

SELECT TOP 1 S.CompanyName, Count(OrderID) ilosc_zamowiem
FROM Shippers S
INNER JOIN Orders O ON S.ShipperID = O.ShipVia
WHERE YEAR(O.ShippedDate) = '1997'
GROUP BY S.CompanyName
ORDER BY ilosc_zamowiem DESC

-- n Dla każdego pracownika (imię i nazwisko) podaj łączną wartość
-- zamówień obsłużonych przez tego pracownika

SELECT E.FirstName, E.LastName, SUM(Quantity*UnitPrice*(1-Discount))
FROM Employees E
INNER JOIN Orders O on E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
GROUP BY E.FirstName, E.LastName

-- n Który z pracowników obsłużył największą liczbę zamówień w 1997r,
-- podaj imię i nazwisko takiego pracownika

SELECT TOP 1 E.FirstName, E.LastName, Count(O.OrderID) ilosc_zamowien
FROM Employees E
INNER JOIN Orders O on E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
WHERE YEAR(OrderDate) = '1997'
GROUP BY E.FirstName, E.LastName
ORDER BY ilosc_zamowien DESC

--
-- n Który z pracowników obsłużył najaktywniejszy (obsłużył zamówienia
-- o największej wartości) w 1997r, podaj imię i nazwisko takiego
-- pracownika

SELECT TOP 1 E.FirstName, E.LastName, SUM(Quantity*UnitPrice*(1-Discount)) wartosc
FROM Employees E
INNER JOIN Orders O on E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
WHERE YEAR(OrderDate) = '1997'
GROUP BY E.FirstName, E.LastName
ORDER BY wartosc DESC

-- Dla każdego pracownika (imię i nazwisko) podaj łączną wartość
-- zamówień obsłużonych przez tego pracownika
-- Ogranicz wynik tylko do pracowników
-- a) którzy mają podwładnych

SELECT E.FirstName, E.LastName, SUM(Quantity*UnitPrice*(1-Discount)) wartosc
FROM Employees E
INNER JOIN Orders O on E.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
INNER JOIN Employees E2 on E.EmployeeID = E2.ReportsTo
GROUP BY E.FirstName, E.LastName
ORDER BY wartosc DESC

-- b) którzy nie mają podwładnych
SELECT boss.LastName, boss.FirstName, boss.EmployeeID, SUM(Quantity*UnitPrice*(1-Discount)) wartosc
from Employees as empl
right outer join Employees as boss
on empl.ReportsTo = boss.EmployeeID
INNER JOIN Orders O on boss.EmployeeID = O.EmployeeID
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
where empl.EmployeeID is Null
GROUP BY boss.FirstName, boss.LastName, boss.EmployeeID
ORDER BY wartosc DESC


SELECT e.FirstName, e.LastName, e.EmployeeID
FROM Employees e
WHERE e.EmployeeID NOT IN (SELECT B.ReportsTo FROM Employees B WHERE B.ReportsTo IS NOT NULL)

