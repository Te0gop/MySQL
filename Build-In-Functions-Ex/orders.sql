SELECT * FROM orders.orders;

SELECT o.product_name, o.order_date, date_add(o.order_date, INTERVAL 3 DAY) AS `pay_due`,
date_add(o.order_date, INTERVAL 1 MONTH) AS `deliver_due` FROM orders o;