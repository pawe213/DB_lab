Use joindb

--SELECT * from Buyers
--SELECT * from Produce
--SELECT * from Sales

--SELECT buyer_name, sales.buyer_id, qty
--FROM buyers, sales
--WHERE buyers.buyer_id = sales.buyer_id

--SELECT buyer_name, s.buyer_id, qty
--FROM buyers AS b, sales AS s
--WHERE b.buyer_id = s.buyer_id--SELECT buyer_name, sales.buyer_id, qty
--FROM buyers INNER JOIN sales
--ON buyers.buyer_id = sales.buyer_id

--SELECT buyer_name, s.buyer_id, qty
--FROM buyers AS b INNER JOIN sales AS s
--ON b.buyer_id = s.buyer_id


--USE northwind
--SELECT productname, companyname
--FROM products
--INNER JOIN suppliers
--ON products.supplierid = suppliers.supplierid

--SELECT DISTINCT companyname, orderdate
--FROM orders
--INNER JOIN customers
--ON orders.customerid = customers.customerid
--WHERE orderdate > ‘3/1/98’--Use joindb--SELECT buyer_name, sales.buyer_id, qty
--FROM buyers LEFT OUTER JOIN sales
--ON buyers.buyer_id = sales.buyer_id
--Where qty is Null

--USE northwind
--SELECT companyname, customers.customerid, orderdate
--FROM customers
--LEFT OUTER JOIN orders
--ON customers.customerid = orders.customerid
--WHERE OrderDate is Null


--Napisz polecenie, które wyświetla listę dzieci będących członkami
--biblioteki (baza library). Interesuje nas imię, nazwisko i data
--urodzenia dziecka.

--USE LIBRARY
--SELECT lastname, firstname, birth_date
--FROM juvenile
--Inner join member
--ON juvenile.member_no = member.member_no

--Napisz polecenie, które podaje tytuły aktualnie wypożyczonych
--książek
--SELECT title
--FROM loan
--Inner join title
--ON loan.title_no = title.title_no

--Podaj informacje o karach zapłaconych za przetrzymywanie książki
--o tytule ‘Tao Teh King’. Interesuje nas data oddania książki, ile dni
--była przetrzymywana i jaką zapłacono karę

--USE Library
--SELECT fine_paid,  in_date, due_date, datediff(day, in_date,due_date)
--FROM loanhist
--Inner join title
--ON  title.title_no = loanhist.title_no
--Where title = 'Tao Teh King' and due_date > in_date

--Napisz polecenie które podaje listę książek (mumery ISBN)
--zarezerwowanych przez osobę o nazwisku: Stephen A. Graff

--SELECT r.isbn from reservation r
--inner join member m on m.member_no = r.member_no
--where m.lastname = 'Graff' and m.firstname = 'Stephen' and m.middleinitial = 'A'

--USE joindb
--SELECT buyer_name, qty
--FROM buyers
--CROSS JOIN sales

--Napisz polecenie, które wyświetla listę dzieci będących członkami
--biblioteki (baza library). Interesuje nas imię, nazwisko, data
--urodzenia dziecka i adres zamieszkania dziecka.
--USE library
--Select lastname, firstname, birth_date, state, city, street
--from juvenile j
--inner join member m ON j.member_no = m.member_no
--inner join adult a ON j.adult_member_no = a.member_no

--Napisz polecenie, które wyświetla listę dzieci będących członkami
--biblioteki (baza library). Interesuje nas imię, nazwisko, data
--urodzenia dziecka, adres zamieszkania dziecka oraz imię i nazwisko
--rodzica.

--USE library
--Select m.lastname, m.firstname, birth_date, state, city, street
--from member m
--inner join juvenile j ON j.member_no = m.member_no
--inner join adult a ON j.adult_member_no = a.member_no
--inner join member m2 ON m2.member_no = a.member_no

--Łączenie tabeli samej ze sobą – self join
--SELECT a.buyer_id AS buyer1, a.prod_id
--,b.buyer_id AS buyer2
--FROM sales AS a
--JOIN sales AS b
--ON a.prod_id = b.prod_id
--WHERE a.buyer_id > b.buyer_id

--Napisz polecenie, które wyświetla pracowników oraz ich
--podwładnych (baza northwind)
--USE northwind
--SELECT Pracownik.LastName, Pracownik.FirstName, Pracownik.ReportsTo, Cheff.LastName 
--from Employees as Cheff
--JOIN Employees as Pracownik
--on Cheff.EmployeeID = Pracownik.ReportsTo

--Napisz polecenie, które wyświetla pracowników, którzy nie mają
--podwładnych (baza northwind)--USE northwind
--SELECT boss.LastName, boss.FirstName, boss.EmployeeID 
--from Employees as empl
--right outer join Employees as boss
--on empl.ReportsTo = boss.EmployeeID--where empl.EmployeeID is Null--Podaj listę członków biblioteki mieszkających w Arizonie (AZ) mają
--więcej niż dwoje dzieci zapisanych do bibliotekiUSE librarySELECT m.firstname, m.lastnameFROM member minner join adult aon m.member_no = a.member_nojoin juvenile as jon a.member_no = j.adult_member_nowhere a.state = 'AZ'group by m.firstname--having count(*) >2 

