USE northwind
SELECT productid, orderid
,quantity
FROM orderhist

SELECT productid, SUM(quantity)
AS total_quantity
FROM orderhist
GROUP BY productid
HAVING SUM(quantity)>=30

SELECT productid, SUM(quantity) AS total_quantity
FROM [order details]
GROUP BY productid
HAVING SUM(quantity)>1200

---Wyświetl zamówienia dla których liczba pozycji zamówienia jest
---większa niż 5Select OrderId, count(*)FROM [Order Details]GROUP BY OrderIDHAVING count(*) > 5---Wyświetl klientów dla których w 1998 roku zrealizowano więcej
---niż 8 zamówień (wyniki posortuj malejąco wg łącznej kwoty za
---dostarczenie zamówień dla każdego z klientów)

Select CustomerID, count(*)
FROM Orders
WHERE YEAR(ShippedDate) = 1998
GROUP BY CustomerID
HAVING Count(*) > 8
Order by SUM(Freight)
