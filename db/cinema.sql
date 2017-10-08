DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);


CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT
);


CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id),
  film_id INT4 REFERENCES films(id)
);



CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT
);


CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT
);


CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id),
  film_id INT4 REFERENCES films(id)
);
