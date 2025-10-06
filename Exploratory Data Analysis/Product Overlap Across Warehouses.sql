-- Product Overlap Across Warehouses
SELECT p.productCode, p.productName,
       COUNT(DISTINCT p.warehouseCode) AS numWarehouses
FROM products p
GROUP BY p.productCode, p.productName
HAVING numWarehouses > 1
ORDER BY numWarehouses DESC;