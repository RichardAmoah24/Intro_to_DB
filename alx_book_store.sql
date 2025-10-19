CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;
create table Authors (
author_id int auto_increment primary key,
author_name varchar(215) not null
);

CREATE TABLE Books (
book_id int auto_increment PRIMARY KEY,
title varchar(130) not null,
author_id int,
price double not null,
publication_date date,
foreign key (author_id) references Authors(author_id)
	on update cascade
    on delete set null
);

CREATE TABLE Customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(215) NOT NULL,
	email VARCHAR(215) UNIQUE NOT NULL, 
	address TEXT
);
CREATE TABLE Orders(
	order_id INT auto_increment PRIMARY KEY,
    customer_id int,
    order_date DATE not null,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
		on update cascade
        on delete cascade
);

create table Order_Details (
	ordertailid int auto_increment primary key,
    order_id int,
    book_id INT,
    quantity DOUBLE not null check (quantity > 0), 
    FOREIGN KEY (order_id) REFERENCES Order(order_id)
		on update cascade
        on delete cascade,
	FOREIGN KEY (book_id) REFERENCES Books(book_id)
		on update cascade
);

insert into Authors (author_name) values
('Chinua Achebe'),
('Ama Ata Aidoo'),
('Ngugi wa Thiong\'o');

insert into Books (title, author_id, price, publication_date) Values
('Things Fall Apart', 1, 49.99, '1958-06-17'),
('Changs: A Love Story', 2, 39.50, '1991-01-01'), 
('The River Between', 3, 45.00, '1965-03-15');

insert into Customers (customer_name, email, address) values
('John Doe', 'john.doe@example.com', '123 Accra Street, Ghana'),
('Mary Johnson', 'mary.johnson@exmaple', '45 Kumasi Avenue, Ghana');

insert into orders (customer_id, order_date, quantity) values
(1, 1, 2),
(1, 3, 1), 
(2, 2, 1);




    
    
