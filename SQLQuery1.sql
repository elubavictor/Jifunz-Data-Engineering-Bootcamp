--SQL BUSINESS QUESTIONS 

--1. List all suppliers in the UK 
SELECT id, companyName, ContactName, City, Country, Phone, Fax
FROM Supplier
WHERE Country = 'UK';
--2. List the first name, last name, and city for all customers. Concatenate the first and last name separated by a space and a comma as a single column 
SELECT CONCAT(firstName, ', ', lastName) AS FullName, City
FROM Customer;
--3. List all customers in Sweden 
SELECT id, firstName, lastName, City, Country, Phone
FROM Customer
WHERE Country = 'Sweden';
--4. List all suppliers in alphabetical order 
SELECT id, companyName, ContactName, City, Country, Phone, Fax
FROM Supplier
ORDER BY companyName ASC;
--5. List all suppliers with their products 
SELECT s.id AS SupplierID, s.companyName AS SupplierName, p.ProductName
FROM Supplier s
JOIN Product p ON s.id = p.Supplierid;
--6. List all orders with customers information 
SELECT o.id AS OrderID, o.OrderDate, c.firstName, c.lastName, c.City, c.Country, c.Phone
FROM [Order] o
JOIN Customer c ON o.Customerid = c.id;
--7. List all orders with product name, quantity, and price, sorted by order number 
SELECT o.id AS OrderID, p.ProductName, oi.Quantity, oi.UnitPrice
FROM [Order] o
JOIN OrderItem oi ON o.id = oi.Orderid
JOIN Product p ON oi.Productid = p.id
ORDER BY o.id;
--8. Using a case statement, list all the availability of products. When 0 then not available, else available 
SELECT ProductName, 
       CASE 
           WHEN IsDiscontinued = 1 THEN 'Not available' 
           ELSE 'Available' 
       END AS Availability
FROM Product;
--9. Using case statement, list all the suppliers and the language they speak. The language they speak should be their country E.g if UK, then English 
SELECT companyName AS SupplierName,
       Country,
       CASE 
           WHEN Country = 'UK' THEN 'English'
           WHEN Country = 'USA' THEN 'English'
           WHEN Country = 'France' THEN 'French'
           -- Add more cases for other countries and languages
           ELSE 'Unknown'
       END AS LanguageSpoken
FROM Supplier;
--10. List all products that are packaged in Jars 
SELECT id, ProductName
FROM Product
WHERE Package = 'Jars';
--11. List procucts name, unitprice and packages for products that starts with Ca 
SELECT ProductName, UnitPrice, Package
FROM Product
WHERE ProductName LIKE 'Ca%'
--12. List the number of products for each supplier, sorted high to low. 
SELECT Supplierid, COUNT(*) AS NumberOfProducts
FROM Product
GROUP BY Supplierid
ORDER BY NumberOfProducts DESC;
--13. List the number of customers in each country. 
SELECT Country, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country;
--14. List the number of customers in each country, sorted high to low. 
SELECT Country, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country
ORDER BY NumberOfCustomers DESC;
--15. List the total order amount for each customer, sorted high to low. 
SELECT c.id AS CustomerID, c.firstName, c.lastName, SUM(o.TotalAmount) AS TotalOrderAmount
FROM Customer c
JOIN [Order] o ON c.id = o.Customerid
GROUP BY c.id, c.firstName, c.lastName
ORDER BY TotalOrderAmount DESC;
--16. List all countries with more than 2 suppliers. 
SELECT Country, COUNT(*) AS SupplierCount
FROM Supplier
GROUP BY Country
HAVING COUNT(*) > 2;
--17. List the number of customers in each country. Only include countries with more than 10 customers. 
SELECT Country, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country
HAVING COUNT(*) > 10;
--18. List the number of customers in each country, except the USA, sorted high to low. Only include countries with 9 or more customers. 
SELECT Country, COUNT(*) AS NumberOfCustomers
FROM Customer
WHERE Country != 'USA'
GROUP BY Country
HAVING COUNT(*) >= 9
ORDER BY NumberOfCustomers DESC;
--19. List customer with average orders between $1000 and $1200. 
SELECT c.id AS CustomerID, c.firstName, c.lastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customer c
JOIN [Order] o ON c.id = o.Customerid
GROUP BY c.id, c.firstName, c.lastName
HAVING AVG(o.TotalAmount) BETWEEN 1000 AND 1200;
--20. Get the number of orders and total amount sold between Jan 1, 2013 and Jan 31, 2013. 
SELECT COUNT(*) AS NumberOfOrders, SUM(TotalAmount) AS TotalAmountSold
FROM [Order]
WHERE OrderDate >= '2013-01-01' AND OrderDate <= '2013-01-31';













