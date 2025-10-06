-- Average unit cost in East warehouse
SELECT ROUND(AVG(buyPrice),2) AS avgUnitCost
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
WHERE w.warehouseCode = 'b';

-- Total carrying cost estimate for East
SELECT 
    SUM(p.quantityInStock * p.buyPrice) AS totalInventoryValue,
    ROUND(SUM(p.quantityInStock * p.buyPrice) * 0.25, 2) AS annualCarryingCost_25pct
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
WHERE w.warehouseCode = 'b';

-- Dead stock cost in East
SELECT 
    SUM(p.quantityInStock * p.buyPrice) AS deadStockValue
FROM products p
LEFT JOIN (
    SELECT productCode, SUM(quantityOrdered) AS totalOrdered
    FROM orderdetails
    GROUP BY productCode
) s ON p.productCode = s.productCode
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
WHERE w.warehouseCode = 'b'
  AND IFNULL(s.totalOrdered,0) = 0;
