SELECT st.store_name, SUM(sa.total_amount) AS total_sales
FROM Sales sa
JOIN Stores st ON sa.store_id = st.store_id
GROUP BY st.store_name
ORDER BY total_sales DESC;

SELECT p.product_name, SUM(sa.total_amount) AS revenue
FROM Sales sa
JOIN Products p ON sa.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT FORMAT(sa.sale_date, 'yyyy-MM') AS month, SUM(sa.total_amount) AS total_sales
FROM Sales sa
GROUP BY FORMAT(sa.sale_date, 'yyyy-MM')
ORDER BY month;

SELECT p.category, SUM(sa.total_amount) AS total_sales
FROM Sales sa
JOIN Products p ON sa.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

SELECT c.first_name + ' ' + c.last_name AS customer_name, SUM(sa.total_amount) AS total_spent
FROM Sales sa
JOIN Customers c ON sa.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;