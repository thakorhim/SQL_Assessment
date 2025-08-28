CREATE DATABASE sql_assessment;
USE sql_assessment;

CREATE TABLE country (
    id INT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL,
    country_name_eng VARCHAR(50) NOT NULL,
    country_code VARCHAR(3) NOT NULL
);

CREATE TABLE city (
    id INT PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL,
    lat DECIMAL(10, 6) NOT NULL,
	long_1 DECIMAL(10, 6) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(id)
);


CREATE TABLE customer (
    id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city_id INT,
    customer_address VARCHAR(200),
    next_call_date DATE,
    ts_inserted TIMESTAMP,
    FOREIGN KEY (city_id) REFERENCES city(id)
);


INSERT INTO country VALUES 
(1, 'Deutschland', 'Germany', 'DEU'),
(2, 'Srbija', 'Serbia', 'SRB'),
(3, 'Hrvatska', 'Croatia', 'HRV'),
(4, 'United States of America', 'United States of America', 'USA'),
(5, 'Polska', 'Poland', 'POL'),
(6, 'España', 'Spain', 'ESP'),
(7, 'Rossiya', 'Russia', 'RUS');

INSERT INTO city VALUES 
(1, 'Berlin', 52.520008, 13.404954, 1),
(2, 'Belgrade', 44.787197, 20.457273, 2),
(3, 'Zagreb', 45.815399, 15.966568, 3),
(4, 'New York', 40.730610, -73.935242, 4),
(5, 'Los Angeles', 34.052235, -118.243683, 4),
(6, 'Warsaw', 52.237049, 21.017532, 5);

INSERT INTO customer VALUES 
(1, 'Jewelry Store', 4, 'Long Street 120', '2020-01-21', '2020-01-09 14:01:20'),
(2, 'Bakery', 1, 'Kurfurstendamm 25', '2020-02-21', '2020-01-09 17:52:15'),
(3, 'Café', 1, 'Tauentzienstraße 44', '2020-01-21', '2020-01-10 08:02:49'),
(4, 'Restaurant', 3, 'Ulica Ilpa 15', '2020-01-21', '2020-01-10 09:20:21');


#Task : 1 (join multiple tables using left join)
#List all Countries and customers related to these countries.
#For each country displaying its name in English, the name of the city customer is located in as
#well as the name of the customer.
#Return even countries without related cities and customers.

SELECT 
    country.country_name_eng AS country_name,
    city.city_name,
    customer.customer_name
FROM 
    country
    LEFT JOIN city ON city.country_id = country.id
    LEFT JOIN customer ON customer.city_id = city.id
ORDER BY 
    country.country_name_eng, city.city_name, customer.customer_name;
    
    
#Task : 2 (join multiple tables using both left and inner join)
#Return the list of all countries that have pairs(exclude countries which are not referenced by any
#city). For such pairs return all customers.
#Return even pairs of not having a single customer

SELECT 
    country.country_name_eng AS country_name,
    city.city_name,
    customer.customer_name
FROM 
    country
    INNER JOIN city ON city.country_id = country.id
    LEFT JOIN customer ON customer.city_id = city.id
ORDER BY 
    country.country_name_eng, city.city_name, customer.customer_name;   