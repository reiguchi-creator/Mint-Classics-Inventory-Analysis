-- Dead Stock Percentage by Warehouse
SELECT 
    w.warehouseCode,
    w.warehouseName,
    SUM(p.quantityInStock) AS totalInventory,
    SUM(CASE 
            WHEN IFNULL(s.totalOrdered, 0) = 0 
            THEN p.quantityInStock 
            ELSE 0 
        END) AS deadStockUnits,
    ROUND(SUM(CASE 
                  WHEN IFNULL(s.totalOrdered, 0) = 0 
                  THEN p.quantityInStock 
                  ELSE 0 
              END) * 100.0 / SUM(p.quantityInStock), 2) AS deadStockPct
FROM products p
LEFT JOIN (
    SELECT productCode, SUM(quantityOrdered) AS totalOrdered
    FROM orderdetails
    GROUP BY productCode
) s ON p.productCode = s.productCode
JOIN warehouses w ON p.warehouseCode = w.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName
ORDER BY deadStockPct DESC;