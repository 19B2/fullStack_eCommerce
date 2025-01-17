CREATE DATABASE IF NOT EXISTS market;
use market;
drop table IF EXISTS user;
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    first_name text NOT NULL, 
    last_name text NOT NULL,
	email varchar(400) ,
    password VARCHAR(255) NOT NULL, -- Assuming hashed passwords stored
    token VARCHAR(255) NOT NULL,
    UNIQUE(email),
    UNIQUE (token)
);
drop table IF EXISTS products;

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_description TEXT,
    product_price INT,
    porduct_image TEXT  
);
drop table IF EXISTS orders;
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    user_id INT REFERENCES users(user_id),
    order_status VARCHAR(20),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    price int,
    quantity int,
    check_out_method varchar(150)
);
drop table IF EXISTS cart;
CREATE TABLE cart (
    cart_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id),
    user_id INT REFERENCES users(id),
    price INT,
    quantity INT
);
insert into user values(1,"DepoGramming","Ali","Eldeep","alieldeep111@gmail.com","123456","asdf342");
insert into products values("1", "t-shirt", "a stylish t-shirt", "400", "www.http/meow");
insert into products values(45, "trousers", "a stylish trousers", 200, "www.http/mememeow");
insert into products values(4,"meow","not meow",500,"helpppp");
INSERT INTO products (id, product_name, product_description, product_price, product_image) 
VALUES 
(1, 'Product 1', 'Description of Product 1', 50, 'image1.jpg'),
(2, 'Product 2', 'Description of Product 2', 60, 'image2.jpg'),
(3, 'Product 3', 'Description of Product 3', 70, 'image3.jpg');



INSERT INTO orders (product_id, user_id, order_status, price, quantity)
VALUES (1, 1, 'on the way', 30, 40);


