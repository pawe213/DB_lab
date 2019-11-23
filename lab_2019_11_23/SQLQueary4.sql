Use Northwind

SELECT T.orderid, T.CustomerID
FROM  (SELECT orderid, customerId FRoM orders) as T

SELECT ProductName, unitPrice, (SELECT  AVG(uniTprice) From Products) AS average,
       unitprice-(SELECT avg(Unitprice) From Products) as difference
From Products

-- Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu,
-- cenę, średnią cenę wszystkich produktów danej kategorii oraz
-- różnicę między ceną produktu a średnią ceną wszystkich
-- produktów danej kategorii

SELECT ProductName, UnitPrice, C.CategoryName,
       (Select AVG(UnitPrice)  from products as p_wew Where p_zew.categoryid = p_wew.CategoryID ) AS srednia,
       (UnitPrice - (SELECT  AVG(UnitPrice) from products as p_wew Where p_zew.categoryid = p_wew.CategoryID)) as diff
From products as p_zew
JOIN Categories C on p_zew.CategoryID = C.CategoryID


Use Northwind
SELECT O.OrderID, (Sum(Quantity*UnitPrice*(1-Discount))+(SELECT Freight from Orders O2 Where O.OrderID = O2.OrderID)) calkowita_oplata
FROM Orders O
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
--WHERE O.OrderID = 10250
GROUP BY O.OrderID
ORDER BY OrderID

--Poduj produkty kupowane przez wiecej niz jednego klienta
SELECT ProductID, Count(CustomerID)
FROM Orders O
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
GROUP BY ProductID
Having COUNT(CustomerID) >= 2

SELECT ProductID
From [Order Details] OD
Where (SELECT Count(*) from Orders O HAVING O.OrderID = OD.OrderID Group by Order) >1


--  Dla każdego przewoźnika podaj wartość przewożonych przez
-- niego towarów oraz kwoty jakie powinien otrzymać́ za przewoź
-- tych towarów z podziałem na lata i miesiące. Zbiór wynikowy
-- powinien zawierać́: nazwę̨
--  przewoźnika, rok, miesiąc, łączną
-- wartość towarów oraz łączną kwotę̨
--  za przesyłkę̨
-- . Uporządkuj dane
-- wg nast. atrybutów: nazwa przewoźnika, rok, miesiąc,

SELECT S.CompanyName, Sum(OD.Quantity*OD.UnitPrice*(1-OD.Discount)) wartosc_zam,
       YEAR(O.ShippedDate) rok_przewozu, MONTH(O.ShippedDate) miesiac_przewozu, Sum(O.Freight) suma_oplaty_przewozowej
FROM Shippers S
INNER JOIN Orders O On S.ShipperID = O.ShipVia
INNER JOIN [Order Details] OD on O.OrderID = OD.OrderID
GROUP BY S.CompanyName, Year(O.ShippedDate), MONTH(O.ShippedDate)
ORDER BY S.CompanyName, rok_przewozu, miesiac_przewozu


-- 2. Dla każdego zamówienia podaj jego łączną łączną (uwzględnij
-- także cenę̨
--  za przesyłkę̨
-- ). Zbiór wynikowy powinien zawierać́:
-- wartość́ zamówienia, nazwę̨
--  klienta, datę̨
--  zamówienia oraz imię̨
--  i
-- nazwisko pracownika który obsłużył to zamówienie

Use Northwind
SELECT O.OrderID, (Sum(Quantity*UnitPrice*(1-Discount))
                       +(SELECT Freight from Orders O2 Where O.OrderID = O2.OrderID)) calkowita_oplata,
       (Sum(Quantity*UnitPrice*(1-Discount))) wartosc_zam, C.Companyname, O.OrderDate, E.FirstName, E.LastName
FROM Orders O
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN Customers C on O.CustomerID = C.CustomerID
INNer JOIN Employees E on O.EmployeeID = E.EmployeeID
GROUP BY O.OrderID, C.Companyname, OrderDate, E.FirstName, E.LastName
ORDER BY OrderID