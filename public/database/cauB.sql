--Cau 1:
SELECT users.user_id, users.user_name, orders.order_id
FROM orders
INNER JOIN users ON orders.user_id = users.user_id;

--Cau 2:
SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS so_don_hang
FROM users
LEFT JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.user_name;

--Cau 3:
SELECT orders.order_id, COUNT(order_details.order_detail_id) AS so_san_pham
FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id
GROUP BY orders.order_id;

--Cau 4:
SELECT u.user_id, u.user_name, o.order_id, p.product_name
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id
ORDER BY o.order_id;

--Cau 5:
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS order_count
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY order_count DESC
LIMIT 7;

--Cau 6:
SELECT u.user_id, u.user_name, o.order_id, p.product_name
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%'
ORDER BY u.user_id, o.order_id;

--Cau 7:
SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS total_price
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN products p ON od.product_id = p.product_id
GROUP BY u.user_id, o.order_id
ORDER BY u.user_id, o.order_id;

-- cau 8
SELECT users.id AS user_id, users.name AS user_name, orders.id AS order_id, MAX(order_details.total_price) AS total_price
FROM users
JOIN orders ON users.id = orders.user_id
JOIN (
    SELECT order_id, SUM(quantity * unit_price) AS total_price
    FROM order_details
    GROUP BY order_id
) AS order_details ON orders.id = order_details.order_id
GROUP BY users.id, users.name
ORDER BY total_price DESC;


-- cau 9
SELECT users.id AS user_id, users.name AS user_name, orders.id AS order_id, MIN(order_details.total_price) AS total_price, COUNT(order_details.product_id) AS num_products
FROM users
JOIN orders ON users.id = orders.user_id
JOIN (
    SELECT order_id, SUM(quantity * unit_price) AS total_price, COUNT(product_id) AS num_products
    FROM order_details
    GROUP BY order_id
) AS order_details ON orders.id = order_details.order_id
GROUP BY users.id, users.name
ORDER BY total_price ASC;


-- cau 10
SELECT users.id AS user_id, users.name AS user_name, orders.id AS order_id, SUM(order_details.total_price) AS total_price, COUNT(order_details.product_id) AS num_products
FROM users
JOIN orders ON users.id = orders.user_id
JOIN (
    SELECT order_id, SUM(quantity * unit_price) AS total_price, COUNT(product_id) AS num_products
    FROM order_details
    GROUP BY order_id
) AS order_details ON orders.id = order_details.order_id
GROUP BY users.id, users.name
ORDER BY num_products DESC;