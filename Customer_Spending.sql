SELECT 
    CONCAT(c.customer_name, ' ', ROUND(SUM(i.total_price) * 1.000000, 6)) AS output
FROM 
    customer c, invoice i
WHERE 
    c.id = i.customer_id
GROUP BY 
    c.customer_name
HAVING 
    SUM(i.total_price) <= (
        SELECT AVG(total_price) * 0.25
        FROM invoice
    )
ORDER BY 
    ROUND(SUM(i.total_price) * 1.000000, 6) DESC;
