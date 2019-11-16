USE northwind
SELECT productid, orderid
,quantity
FROM orderhist

SELECT orderid
,SUM(quantity) AS total_quantity
FROM orderhist
GROUP BY orderid

---Podaj maksymalną cenę zamawianego produktu dla każdego
---zamówienia
SELECT productid, SUM(quantity) AS total_quantity
FROM [order details]
GROUP BY productid

---Posortuj zamówienia wg maksymalnej ceny produktu
SELECT OrderID, MAX(UnitPrice)
FROM [Order Details]
GROUP BY OrderID
ORDER BY MAX(UnitPrice)

---Podaj maksymalną i minimalną cenę zamawianego produktu dla
---każdego zamówienia
SELECT OrderID, MAX(UnitPrice), MIN(UnitPrice)
FROM [Order Details]
GROUP BY OrderID

---Podaj liczbę zamówień dostarczanych przez poszczególnych
---spedytorów (przewoźników)
SELECT ShipVia, count(orderid) from Orders
Group by ShipVia

---Który z spedytorów był najaktywniejszy w 1997 roku
SELECT ShipVia, count(orderid) from Orders
WHERE YEAR(ShippedDate) = 1997
Group by ShipVia



