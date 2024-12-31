-- DDL Statements with Constraints
CREATE DATABASE SHOPPING;
use shopping;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE category (
  id int(11) NOT NULL AUTO_INCREMENT,
  categoryName varchar(255) DEFAULT NULL,
  categoryDescription longtext DEFAULT NULL,
  creationDate timestamp NOT NULL DEFAULT current_timestamp(),
  updationDate varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
CREATE TABLE subcategory (
  id int(11) NOT NULL AUTO_INCREMENT,
  categoryid int(11) DEFAULT NULL,
  subcategory varchar(255) DEFAULT NULL,
  creationDate timestamp NULL DEFAULT current_timestamp(),
  updationDate varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (categoryid) REFERENCES category(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
CREATE TABLE products (
  id int(11) NOT NULL AUTO_INCREMENT,
  category int(11) NOT NULL,
  subCategory int(11) DEFAULT NULL,
  productName varchar(255) DEFAULT NULL,
  productCompany varchar(255) DEFAULT NULL,
  productPrice int(11) DEFAULT NULL,
  productPriceBeforeDiscount int(11) DEFAULT NULL,
  productDescription longtext DEFAULT NULL,
  productImage1 varchar(255) DEFAULT NULL,
  productImage2 varchar(255) DEFAULT NULL,
  productImage3 varchar(255) DEFAULT NULL,
  shippingCharge int(11) DEFAULT NULL,
  productAvailability varchar(255) DEFAULT NULL,
  postingDate timestamp NULL DEFAULT current_timestamp(),
  updationDate varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (category) REFERENCES category(id),
  FOREIGN KEY (subCategory) REFERENCES subcategory(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  contactno bigint(11) DEFAULT NULL,
  password varchar(255) DEFAULT NULL,
  shippingAddress longtext DEFAULT NULL,
  shippingState varchar(255) DEFAULT NULL,
  shippingCity varchar(255) DEFAULT NULL,
  shippingPincode int(11) DEFAULT NULL,
  billingAddress longtext DEFAULT NULL,
  billingState varchar(255) DEFAULT NULL,
  billingCity varchar(255) DEFAULT NULL,
  billingPincode int(11) DEFAULT NULL,
  regDate timestamp NOT NULL DEFAULT current_timestamp(),
  updationDate varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
CREATE TABLE orders (
  id int(11) NOT NULL AUTO_INCREMENT,
  userId int(11) DEFAULT NULL,
  productId varchar(255) DEFAULT NULL,
  quantity int(11) DEFAULT NULL,
  orderDate timestamp NOT NULL DEFAULT current_timestamp(),
  paymentMethod varchar(50) DEFAULT NULL,
  orderStatus varchar(55) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES users(id),
  FOREIGN KEY (productId) REFERENCES products(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE ordertrackhistory (
  id int(11) NOT NULL AUTO_INCREMENT,
  orderId int(11) DEFAULT NULL,
  status varchar(255) DEFAULT NULL,
  remark mediumtext DEFAULT NULL,
  postingDate timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id),
  FOREIGN KEY (orderId) REFERENCES orders(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE productreviews (
  id int(11) NOT NULL AUTO_INCREMENT,
  productId int(11) DEFAULT NULL,
  quality int(11) DEFAULT NULL,
  price int(11) DEFAULT NULL,
  value int(11) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  summary varchar(255) DEFAULT NULL,
  review longtext DEFAULT NULL,
  reviewDate timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id),
  FOREIGN KEY (productId) REFERENCES products(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE userlog (
  id int(11) NOT NULL AUTO_INCREMENT,
  userEmail varchar(255) DEFAULT NULL,
  userip binary(16) DEFAULT NULL,
  loginTime timestamp NULL DEFAULT current_timestamp(),
  logout varchar(255) DEFAULT NULL,
  status int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
CREATE TABLE wishlist (
  id int(11) NOT NULL AUTO_INCREMENT,
  userId int(11) DEFAULT NULL,
  productId int(11) DEFAULT NULL,
  postingDate timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES users(id),
  FOREIGN KEY (productId) REFERENCES products(id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE admin (
  id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  creationDate timestamp NOT NULL DEFAULT current_timestamp(),
  updationDate varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
-- Insert data into `category` table
INSERT INTO `category` (`categoryName`, `categoryDescription`, `creationDate`, `updationDate`)
VALUES 
('Electronics', 'Devices and gadgets', CURRENT_TIMESTAMP, '2024-12-01'),
('Clothing', 'Apparel for all genders', CURRENT_TIMESTAMP, '2024-12-02'),
('Home Appliances', 'Appliances for household use', CURRENT_TIMESTAMP, '2024-12-03'),
('Books', 'Fiction and non-fiction', CURRENT_TIMESTAMP, '2024-12-04'),
('Groceries', 'Daily essentials and food items', CURRENT_TIMESTAMP, '2024-12-05');

-- Insert data into `subcategory` table
INSERT INTO `subcategory` (`categoryid`, `subcategory`, `creationDate`, `updationDate`)
VALUES 
(1, 'Mobile Phones', CURRENT_TIMESTAMP, '2024-12-01'),
(1, 'Laptops', CURRENT_TIMESTAMP, '2024-12-02'),
(2, 'Men', CURRENT_TIMESTAMP, '2024-12-03'),
(2, 'Women', CURRENT_TIMESTAMP, '2024-12-04'),
(3, 'Kitchen Appliances', CURRENT_TIMESTAMP, '2024-12-05');

-- Insert data into `products` table
INSERT INTO `products` 
(`category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `shippingCharge`,
 `productAvailability`, `postingDate`, `updationDate`)
VALUES
(1, 1, 'iPhone 15', 'Apple', 999, 1099, 'Latest iPhone model', 'iphone15.jpg', 20, 'In Stock', CURRENT_TIMESTAMP, '2024-12-01'),
(1, 2, 'MacBook Air', 'Apple', 1200, 1300, 'Lightweight laptop', 'macbookair.jpg', 30, 'In Stock', CURRENT_TIMESTAMP, '2024-12-02'),
(2, 3, 'Leather Jacket', 'Zara', 150, 200, 'Stylish men’s leather jacket', 'jacket.jpg', 10, 'In Stock', CURRENT_TIMESTAMP, '2024-12-03'),
(3, 5, 'Microwave Oven', 'Samsung', 250, 300, 'Smart oven for quick meals', 'microwave.jpg', 15, 'In Stock', CURRENT_TIMESTAMP, '2024-12-04'),
(4, NULL, 'The Alchemist', 'HarperOne', 10, 15, 'Bestselling novel by Paulo Coelho', 'alchemist.jpg', 5, 'In Stock', CURRENT_TIMESTAMP, '2024-12-05');

-- Insert data into `users` table
INSERT INTO `users` 
(`name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`,
 `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`)
VALUES
('John Doe', 'john.doe@example.com', 9876543210, 'password123', '123 Main St', 'NY', 'New York', 10001, '123 Main St', 'NY', 'New York', 10001, CURRENT_TIMESTAMP, '2024-12-01'),
('Jane Smith', 'jane.smith@example.com', 9876543211, 'password123', '456 Elm St', 'CA', 'Los Angeles', 90001, '456 Elm St', 'CA', 'Los Angeles', 90001, CURRENT_TIMESTAMP, '2024-12-02'),
('Alice Johnson', 'alice.johnson@example.com', 9876543212, 'password123', '789 Oak St', 'TX', 'Houston', 77001, '789 Oak St', 'TX', 'Houston', 77001, CURRENT_TIMESTAMP, '2024-12-03'),
('Bob Brown', 'bob.brown@example.com', 9876543213, 'password123', '101 Maple St', 'FL', 'Miami', 33101, '101 Maple St', 'FL', 'Miami', 33101, CURRENT_TIMESTAMP, '2024-12-04'),
('Charlie White', 'charlie.white@example.com', 9876543214, 'password123', '202 Pine St', 'IL', 'Chicago', 60601, '202 Pine St', 'IL', 'Chicago', 60601, CURRENT_TIMESTAMP, '2024-12-05');

-- Insert data into `orders` table
INSERT INTO `orders` 
(`userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`)
VALUES
(1, '1', 2, CURRENT_TIMESTAMP, 'Credit Card', 'Delivered'),
(2, '2', 1, CURRENT_TIMESTAMP, 'PayPal', 'Pending'),
(3, '3', 1, CURRENT_TIMESTAMP, 'Cash on Delivery', 'Shipped'),
(4, '4', 1, CURRENT_TIMESTAMP, 'Credit Card', 'Delivered'),
(5, '5', 3, CURRENT_TIMESTAMP, 'Debit Card', 'Processing');

-- Insert data into `ordertrackhistory` table
INSERT INTO `ordertrackhistory` 
(`orderId`, `status`, `remark`, `postingDate`)
VALUES
(1, 'Delivered', 'Order delivered successfully', CURRENT_TIMESTAMP),
(2, 'Pending', 'Payment pending', CURRENT_TIMESTAMP),
(3, 'Shipped', 'Order shipped', CURRENT_TIMESTAMP),
(4, 'Delivered', 'Order delivered successfully', CURRENT_TIMESTAMP),
(5, 'Processing', 'Order is being processed', CURRENT_TIMESTAMP);

-- Insert data into `productreviews` table
INSERT INTO `productreviews` 
(`productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`)
VALUES
(1, 5, 5, 5, 'John Doe', 'Excellent phone', 'Amazing performance and battery life', CURRENT_TIMESTAMP),
(2, 4, 4, 4, 'Jane Smith', 'Great laptop', 'Lightweight and fast', CURRENT_TIMESTAMP),
(3, 4, 3, 4, 'Alice Johnson', 'Good jacket', 'Stylish but expensive', CURRENT_TIMESTAMP),
(4, 5, 5, 5, 'Bob Brown', 'Perfect oven', 'Cooks evenly and quickly', CURRENT_TIMESTAMP),
(5, 5, 5, 5, 'Charlie White', 'Wonderful book', 'Inspiring and thought-provoking', CURRENT_TIMESTAMP);

-- Insert data into `userlog` table
INSERT INTO `userlog` 
(`userEmail`, `userip`, `loginTime`, `logout`, `status`)
VALUES
('john.doe@example.com', UNHEX('0A000001'), CURRENT_TIMESTAMP, 'Logout', 1),
('jane.smith@example.com', UNHEX('0A000002'), CURRENT_TIMESTAMP, 'Logout', 1),
('alice.johnson@example.com', UNHEX('0A000003'), CURRENT_TIMESTAMP, 'Logout', 1),
('bob.brown@example.com', UNHEX('0A000004'), CURRENT_TIMESTAMP, 'Logout', 1),
('charlie.white@example.com', UNHEX('0A000005'), CURRENT_TIMESTAMP, 'Logout', 1);

-- Insert data into `wishlist` table
INSERT INTO `wishlist` 
(`userId`, `productId`, `postingDate`)
VALUES
(1, 1, CURRENT_TIMESTAMP),
(2, 2, CURRENT_TIMESTAMP),
(3, 3, CURRENT_TIMESTAMP),
(4, 4, CURRENT_TIMESTAMP),
(5, 5, CURRENT_TIMESTAMP);

-- Insert data into `admin` table
INSERT INTO `admin` 
(`username`, `password`, `creationDate`, `updationDate`)
VALUES
('admin1', 'adminpass1', CURRENT_TIMESTAMP, '2024-12-01'),
('admin2', 'adminpass2', CURRENT_TIMESTAMP, '2024-12-02'),
('admin3', 'adminpass3', CURRENT_TIMESTAMP, '2024-12-03'),
('admin4', 'adminpass4', CURRENT_TIMESTAMP, '2024-12-04'),
('admin5', 'adminpass5', CURRENT_TIMESTAMP, '2024-12-05');


-- alter commands
ALTER TABLE products ADD COLUMN discountPercentage INT(3) DEFAULT 0;
ALTER TABLE users MODIFY COLUMN contactno VARCHAR(15);
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
-- AUTO_INCREMENT for table `category`
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
-- AUTO_INCREMENT for table `orders`
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
-- AUTO_INCREMENT for table `ordertrackhistory`
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
-- AUTO_INCREMENT for table `productreviews`
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
-- AUTO_INCREMENT for table `products`
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
-- AUTO_INCREMENT for table `subcategory`
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
-- AUTO_INCREMENT for table `userlog`
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
-- AUTO_INCREMENT for table `users`
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
-- AUTO_INCREMENT for table `wishlist`
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
-- update 
UPDATE products 
SET productPrice = 950 
WHERE productName = 'iPhone 15';

UPDATE orders 
SET orderStatus = 'Shipped' 
WHERE orderStatus = 'Pending';

-- delete

DELETE FROM users 
WHERE email = 'alice.johnson@example.com';

DELETE FROM orders 
WHERE quantity = 0;
-- drop 
drop table users;
-- trunacte 
truncate table products;
COMMIT;

select * from subcategory;
-- Queries:
-- 1. Aggregate functions, Group by, Having 
-- Example: Count number of products in each category
SELECT category, COUNT(*) AS product_count FROM products GROUP BY category HAVING COUNT(*) > 5;

-- 2. Order by 
-- Example: List all users ordered by registration date
SELECT * FROM users ORDER BY regDate DESC;

-- 3. Join, Outer Join 
-- Example: Fetch orders with product details
SELECT orders.id, users.name, products.productName, orders.quantity FROM orders 
JOIN users ON orders.userId = users.id
JOIN products ON orders.productId = products.id;

-- 4. Boolean operators 
-- Example: Find users from a specific city with a certain state
SELECT * FROM users WHERE shippingCity = 'New York' AND shippingState = 'NY';

-- 5. Arithmetic operators 
-- Example: Calculate total cost of each order
SELECT orders.id AS order_id, SUM(orders.quantity * products.productPrice) AS total_cost
FROM orders
JOIN products ON orders.productId = products.id
GROUP BY orders.id;

-- 6. Search query using string operators 
-- Example: Find products with a specific keyword in the name
SELECT * FROM products WHERE productName LIKE '%phone%';

-- 7. Usage of to_char, extract 
-- Example: Extract year from order date
SELECT id, EXTRACT(YEAR FROM orderDate) AS order_year FROM orders;

-- 8. Between, IN, Not between, Not IN 
-- Example: Find products within a certain price range
SELECT * FROM products WHERE productPrice BETWEEN 500 AND 1000;

-- 9. Set operations 
-- Example: Find products reviewed but not in wishlist
SELECT productId 
FROM productreviews
EXCEPT
SELECT productId 
FROM wishlist;
-- or 
SELECT productId 
FROM productreviews 
WHERE productId NOT IN (SELECT productId FROM wishlist);


-- 10. Subquery using EXISTS/NOT EXISTS, ANY, ALL 
-- Example: Find users who have placed an order
SELECT * FROM users WHERE EXISTS (SELECT * FROM orders WHERE orders.userId = users.id);

-- 11
SELECT CONCAT(name, ' (', email, ')') AS fullDetails
FROM users;

ROLLBACK;

-- 12 
-- OR OPERATION
-- Find users from New York or Los Angeles.
SELECT * FROM users WHERE shippingCity = 'New York' OR shippingCity = 'Los Angeles';
-- 13 (NOT EQUAL )

-- 14
-- Find all products priced below $500.

SELECT * FROM products WHERE productPrice < 500;

-- 15
-- Fetch products from the "Apple" company.
SELECT * FROM products WHERE productCompany = 'Apple';

-- DATE FUNCTIONS 
-- Extract just the time part from orderDate.

SELECT id, TIME(orderDate) AS order_time FROM orders;
-- Fetch all products that are not in stock.
SELECT * FROM products WHERE productAvailability <> 'In Stock';
-- Get the weekday of each order date.
SELECT id, DAYNAME(orderDate) AS weekday FROM orders;
-- Fetch all orders placed on "2024-12-05".
SELECT * FROM orders WHERE DATE(orderDate) = '2024-12-05';
-- Format the order time as HH:MI AM/PM.
SELECT id, DATE_FORMAT(orderDate, '%h:%i %p') AS formatted_time FROM orders;


