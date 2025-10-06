-- Items with Zero or Very Low Sales
SELECT 
	p.productCode,
	p.productName,
    p.quantityInStock
FROM products p
LEFT JOIN orderdetails od
	ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock
HAVING SUM(od.quantityOrdered) IS NULL OR SUM(od.quantityOrdered) < 10
ORDER BY p.quantityInStock DESC;
