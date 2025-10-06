-- Product and Storage Location
SELECT
	p.productCode,
    p.productName,
    p.productLine,
    p.quantityInStock,
    s.warehouseName
FROM products p
JOIN warehouses s
	ON p.warehouseCode = s.warehouseCode
ORDER BY s.warehouseCode, p.quantityInStock DESC;
