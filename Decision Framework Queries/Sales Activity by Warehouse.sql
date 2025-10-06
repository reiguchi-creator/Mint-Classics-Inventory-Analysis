SELECT w.warehouseCode, w.warehouseName,
       SUM(od.quantityOrdered) AS totalSales,
       ROUND(SUM(od.quantityOrdered) * 100.0 / 
             (SELECT SUM(quantityOrdered) FROM orderdetails), 2) AS pctSales
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName
ORDER BY pctSales ASC;
