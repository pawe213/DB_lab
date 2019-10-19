	--select * from orders
	--select * from customers
	--select * from products
	-- select * from suppliers
	--SELECT employeeid, lastname, firstname, title
	--FROM employees

	--Wybierz nazwy i adresy wszystkich klientów
	--SELECT Companyname, Address, City, Country from Customers

	--Wybierz nazwiska i numery telefonów pracowników
	--SELECT LastName, FirstName, HomePhone from Employees

	--Wybierz nazwy i ceny produktów
	--SELECT ProductName, UnitPrice from Products

	--Pokaż wszystkie kategorie produktów (nazwy i opisy) TODO
	--SELECT * FROM Products

	--Pokaż nazwy i adresy stron www dostawców TODO

-----------------------------------------------------------------------

--1. Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie
--SELECT CompanyName, Address FROM Customers WHERE City = 'London'

--2. Wybierz nazwy i adresy wszystkich klientów mających siedziby we Francji lub
--w Hiszpanii
--SELECT CompanyName, Address FROM Customers WHERE City = 'London' OR Country = 'France'

--3. Wybierz nazwy i ceny produktów o cenie jednostkowej pomiędzy 20.00 a 30.00
--SELECT ProductName, UnitPrice FROM Products WHERE 20.00<UnitPrice AND UnitPrice<30.00

--4. Wybierz nazwy i ceny prodktow z kategorii 'meat'
--DECLARE @id INT
--SET @id = (select categoryid from categories where CategoryName = 'Meat/Poultry')
--select * from Products where CategoryID = @id
--SELECT * from Categories

--5. Wybierz nazwy produktów oraz inf. o stanie magazynu dla produktów
--dostarczanych przez firmę ‘Tokyo Traders’ TODO

--6. Wybierz nazwy produktów których nie ma w magazynie TODO

--------------------------------------------------------------------------------

--SELECT companyname
--FROM customers
--WHERE companyname LIKE '%Restaurant%'

--1. Szukamy informacji o produktach sprzedawanych w butelkach
--(‘bottle’)

--SELECT productname FROM Products where QuantityPerUnit LIKE '%bottle%'

--2. Wyszukaj informacje o stanowisku pracowników, których
--nazwiska zaczynają się na literę z zakresu od B do L

--SELECT Title, Lastname from Employees where LastName LIKE '[B-L]%'

--3. Wyszukaj informacje o stanowisku pracowników, których
--nazwiska zaczynają się na literę B lub L

--SELECT Title, Lastname from Employees where LastName LIKE '[BL]%'

--4. Znajdź nazwy kategorii, które w opisie zawierają przecinek

--SELECT CategoryName from Categories where Description like '%,%'

--5. Znajdź klientów, którzy w swojej nazwie mają w którymś miejscu
--słowo ‘Store’

--SELECT CompanyName from Customers where CompanyName like '%Store%'

--• Napisz instrukcję select tak aby wybrać numer zlecenia, datę
--zamówienia, numer klienta dla wszystkich niezrealizowanych
--jeszcze zleceń, dla których krajem odbiorcy jest Argentyna

--SELECT OrderID, OrderDate, CustomerID from Orders where (ShippedDate > GETDATE() or ShippedDate is NULL) and ShipCountry = 'Argentina'

--sortowanie
--SELECT productid, productname, unitprice
--FROM products
--ORDER BY unitprice ASC

--1. Wybierz nazwy i kraje wszystkich klientów, wyniki posortuj
--według kraju, w ramach danego kraju nazwy firm posortuj
--alfabetycznie

--SELECT CompanyName, Country FROM Customers ORDER BY Country, CompanyName

--2. Wybierz informację o produktach (grupa, nazwa, cena), produkty
--posortuj wg grup a w grupach malejąco wg ceny





