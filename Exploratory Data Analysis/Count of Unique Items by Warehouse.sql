-- Count of Unique Items by Warehouse
SELECT w.warehouseCode, COUNT(DISTINCT p.productCode) AS uniqueProducts,
       SUM(p.quantityInStock) AS totalInventory
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY w.warehouseCode
ORDER BY totalInventory DESC;
