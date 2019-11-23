USE Northwind
SELECT (Firstname + '' + lastname) AS name , city, postalcode, 'praca'
FROM Employees
INTERSECT
SELECT companyname, city, postalcode
from Customers

--Dla kazdej kategorii produktu, podaj łączna liczbę zamówionych jednostek
SELECT CategoryName, SUM(Quantity)AS ilosc_zamowionych
FROM Categories c
join products p on c.CategoryID = p.CategoryID
INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID
GROUP BY CategoryName

--dla kazdego zamowienia podaj laczna liczbe zamowionych jednostek oraz nazwe klienta
SELECT O.OrderId, Sum(OD.quantity) as quantity_sum, C.CompanyName
From Orders O
JOIN [Order Details] OD on O.OrderID = OD.OrderID
Join Customers C on O.CustomerID = C.CustomerID
Group By O.OrderID, C.CompanyName
ORDER BY 1, 3

--Dla
Use Northwind
SELECT O.OrderID, Sum(Quantity*UnitPrice*(1-Discount)), C.CompanyName, E.LastName, E.FirstName
FROM Orders O
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN Customers C on O.CustomerID = C.CustomerID
INNER JOIN Employees E on O.EmployeeID = E.EmployeeID
GROUP BY O.OrderID, C.CompanyName, E.LastName, E.FirstName

--dla kazdego klienta
SELECT C.CompanyName, o.OrderID, Sum(Quantity*UnitPrice*(1-Discount))
FROM Customers C
Left JOIN Orders O on C.CustomerID = O.CustomerID
LEFT JOIN [Order Details] OD ON O.OrderID = OD.OrderID
group by c.CompanyName, o.OrderID
order by 3

Use Library
SELECT m.firstname, m.lastname, l.title_no, lh.title_no
FROM member m
left join loan l on m.member_no = l.member_no
left join loanhist lh on m.member_no = lh.member_no
WHERE l.title_no is Null AND lh.title_no is Null
