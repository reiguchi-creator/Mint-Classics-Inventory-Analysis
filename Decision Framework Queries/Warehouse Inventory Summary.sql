SELECT w.warehouseCode, w.warehouseName, w.warehousePctCap,
       COUNT(DISTINCT p.productCode) AS uniqueProducts,
       SUM(p.quantityInStock) AS totalInventory,
       ROUND(COUNT(DISTINCT p.productCode) * 100.0 / (SELECT COUNT(*) FROM products),2) AS pctSKUs,
       ROUND(SUM(p.quantityInStock) * 100.0 / (SELECT SUM(quantityInStock) FROM products),2) AS pctInventory
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName, w.warehousePctCap
ORDER BY pctInventory ASC;