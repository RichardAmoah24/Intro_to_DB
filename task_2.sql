USE alx_book_store;
CREATE TABLE IF NOT EXISTS Authors (
author_id INT auto_increment PRIMARY KEY,
author_name VARCHAR(215) NOT NULL
);

CREATE TABLE IF NOT EXISTS Authors ( 
	book_id INT AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
		ON UPDATE CASCADE
        ON DELETE SET NULL
	);
    
CREATE TABLE IF NOT EXISTS Customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(215) UNIQUE NOT NULL, 
email VARCHAR(215) UNIQUE NOT NULL,
address TEXT
);

CREATE TABLE IF NOT EXISTS Orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Order_Datails (
orderdetialid INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
book_id INT, 
quantity DOUBLE NOT NULL CHECK (quantity > 0), 
FOREIGN KEY (order_id) REFERENCES Orders(order_id)
	ON UPDATE CASCADE
    ON DELETE CASCADE,
FOREIGN KEY (book_id) REFERENCES Books(book_id)
	ON UPDATE CASCADE
    ON DELETE CASCADE
);


C
