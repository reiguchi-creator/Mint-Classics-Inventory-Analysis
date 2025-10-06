-- Sales Volume vs Inventory
SELECT
	p.productCode,
    p.productName,
	p.quantityInStock,
	SUM(od.quantityOrdered) AS totalOrdered,
	ROUND(SUM(od.quantityOrdered) / p.quantityInStock, 2) AS turnoverRatio
FROM products p
LEFT JOIN orderdetails od 
	ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock
ORDER BY turnoverRatio ASC;