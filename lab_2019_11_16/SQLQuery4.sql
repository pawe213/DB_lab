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

USE LIBRARY
SELECT lastname, firstname, birth_date
FROM juvenile
Inner join member
ON juvenile.member_no = member.member_no
