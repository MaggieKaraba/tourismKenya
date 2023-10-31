-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: TourismKenya
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-30 20:56:50

-- TourismKenya Database creation SQL code

CREATE DATABASE TourismKenya;

USE TourismKenya;

CREATE TABLE tourists (
    tourist_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    country_of_citizenship VARCHAR(20)
);

CREATE TABLE accommodations (
    accommodation_id INT AUTO_INCREMENT PRIMARY KEY,
    accommodation_address VARCHAR(100) NOT NULL,
    accommodation_city VARCHAR(100) NOT NULL,
    accommodation_zip VARCHAR(20),
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    availability_status CHAR(20) NOT NULL,
    guest_feedback TEXT
);

CREATE TABLE parks_and_reserves (
    park_reserve_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    park_region VARCHAR(100) NOT NULL,
    entry_fee DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_non_negative_fee CHECK (entry_fee >= 0)
);

CREATE TABLE transportation_services (
    transportation_id INT AUTO_INCREMENT PRIMARY KEY,
    mode VARCHAR(50) NOT NULL,
    route VARCHAR(100) NOT NULL,
    departure_time DATETIME,
    arrival_time DATETIME,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE regulatory_bodies (
    agency_id INT AUTO_INCREMENT PRIMARY KEY,
    agency_name VARCHAR(100) NOT NULL
);

CREATE TABLE accommodation_reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    tourist_id INT,
    accommodation_id INT,
    check_in_date DATE,
    check_out_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (tourist_id) REFERENCES tourists(tourist_id),
    FOREIGN KEY (accommodation_id) REFERENCES accommodations(accommodation_id)
);

CREATE TABLE park_reserve_visitors (
    visitor_id INT AUTO_INCREMENT PRIMARY KEY,
    tourist_id INT,
    park_reserve_id INT,
    visit_date DATE,
    FOREIGN KEY (tourist_id) REFERENCES tourists(tourist_id),
    FOREIGN KEY (park_reserve_id) REFERENCES parks_and_reserves(park_reserve_id)
);

CREATE TABLE transportation_bookings (
    t_booking_id INT AUTO_INCREMENT PRIMARY KEY,
    tourist_id INT,
    transportation_id INT,
    t_booking_date DATE,
    total_cost DECIMAL(10, 2),
    FOREIGN KEY (tourist_id) REFERENCES tourists(tourist_id),
    FOREIGN KEY (transportation_id) REFERENCES transportation_services(transportation_id)
);

INSERT INTO tourists (first_name, last_name, email, phone, country_of_citizenship)
VALUES
    ('John', 'Doe', 'john.doe@email.com', '1234567890', 'USA'),
    ('Alice', 'Smith', 'alice.smith@email.com', '9876543210', 'Canada'),
    ('David', 'Johnson', 'david.johnson@email.com', '5555555555', 'UK'),
    ('Maria', 'Garcia', 'maria.garcia@email.com', '7777777777', 'Spain'),
    ('Makoto', 'Tanaka', 'makoto.tanaka@email.com', '9999999999', 'Japan'),
    ('Luis', 'Rodriguez', 'luis.rodriguez@email.com', '6666666666', 'Mexico'),
    ('Sophie', 'Dupont', 'sophie.dupont@email.com', '1111111111', 'France'),
    ('Anna', 'Kowalski', 'anna.kowalski@email.com', '2222222222', 'Poland'),
    ('Hans', 'Schmidt', 'hans.schmidt@email.com', '3333333333', 'Germany'),
    ('Elena', 'Ivanova', 'elena.ivanova@email.com', '4444444444', 'Russia');

INSERT INTO accommodations (accommodation_address, accommodation_city, room_type, price_per_night, availability_status, guest_feedback)
VALUES
    ('123 Main St', 'Nairobi', 'Single', 100.00, 'Available', 'Great place!'),
    ('456 Elm St', 'Mombasa', 'Double', 150.00, 'Available', 'Nice view.'),
    ('789 Oak St', 'Nairobi', 'Suite', 200.00, 'Available', 'Luxurious stay.'),
    ('101 Pine St', 'Nairobi', 'Single', 100.00, 'Available', 'Clean and cozy.'),
    ('202 Cedar St', 'Nairobi', 'Double', 150.00, 'Available', 'Friendly staff.'),
    ('303 Redwood St', 'Nairobi', 'Single', 100.00, 'Available', 'Good location.'),
    ('404 Birch St', 'Mombasa', 'Double', 150.00, 'Available', 'Beachfront property.'),
    ('505 Maple St', 'Mombasa', 'Single', 100.00, 'Available', 'Relaxing atmosphere.'),
    ('606 Walnut St', 'Nairobi', 'Double', 150.00, 'Available', 'Spacious rooms.'),
    ('707 Palm St', 'Nairobi', 'Single', 100.00, 'Available', 'Scenic views.');

INSERT INTO parks_and_reserves (name, park_region, entry_fee)
VALUES
    ('Maasai Mara', 'Rift Valley', 50.00),
    ('Amboseli National Park', 'Southern', 40.00),
    ('Samburu National Reserve', 'Northern', 30.00),
    ('Tsavo National Park', 'Coastal', 45.00),
    ('Aberdare National Park', 'Central', 35.00);

INSERT INTO transportation_services (mode, route, price)
VALUES
    ('Bus', 'Nairobi to Mombasa', 30.00),
    ('Train', 'Nairobi to Kisumu', 25.00),
    ('Flight', 'Nairobi to Eldoret', 40.00),
    ('Car Rental', 'Nairobi to Naivasha', 20.00),
    ('Boat', 'Mombasa to Lamu', 35.00);

INSERT INTO regulatory_bodies (agency_name)
VALUES
    ('Kenya Tourism Regulatory Authority');

INSERT INTO accommodation_reservations (tourist_id, accommodation_id, check_in_date, check_out_date, total_price)
VALUES
    (1, 1, '2023-05-10', '2023-05-15', 500.00),
    (2, 2, '2023-06-20', '2023-06-25', 750.00),
    (3, 3, '2023-07-15', '2023-07-20', 1000.00),
    (4, 4, '2023-08-05', '2023-08-10', 500.00),
    (5, 5, '2023-09-12', '2023-09-17', 750.00),
    (6, 6, '2023-10-08', '2023-10-13', 500.00),
    (7, 7, '2023-11-14', '2023-11-19', 750.00),
    (8, 8, '2023-12-22', '2023-12-27', 1000.00),
    (9, 9, '2024-01-30', '2024-02-04', 500.00),
    (10, 10, '2024-03-25', '2024-03-30', 750.00);

INSERT INTO park_reserve_visitors (tourist_id, park_reserve_id, visit_date)
VALUES
    (1, 1, '2023-07-15'),
    (2, 1, '2023-07-20'),
    (3, 2, '2023-08-02'),
    (4, 2, '2023-08-05'),
    (5, 3, '2023-06-10'),
    (6, 3, '2023-06-12'),
    (7, 4, '2023-07-25'),
    (8, 4, '2023-07-28'),
    (9, 5, '2023-08-10'),
    (10, 5, '2023-08-15');

INSERT INTO transportation_bookings (tourist_id, transportation_id, t_booking_date, total_cost)
VALUES
    (1, 1, '2023-01-05', 30.00),
    (2, 2, '2023-02-10', 25.00),
    (3, 3, '2023-03-15', 40.00),
    (4, 4, '2023-04-20', 20.00),
    (5, 5, '2023-05-25', 35.00),
    (6, 1, '2023-06-01', 30.00),
    (7, 2, '2023-07-05', 25.00),
    (8, 3, '2023-08-10', 40.00),
    (9, 4, '2023-09-15', 20.00),
    (10, 5, '2023-10-20', 35.00);



-- Example queries

USE TourismKenya;

SELECT *
FROM accommodations;


SELECT room_type, COUNT(*) AS RoomTypeCount
FROM accommodations
GROUP BY room_type
ORDER BY RoomTypeCount DESC
LIMIT 1;

SELECT AVG(price_per_night) AS AveragePrice
FROM accommodations;

SELECT 
    accommodation_id,
    CASE 
        WHEN guest_feedback LIKE '%great%' OR guest_feedback LIKE '%nice%' OR guest_feedback LIKE '%good%' THEN 'Positive'
        WHEN guest_feedback LIKE '%poor%' OR guest_feedback LIKE '%bad%' OR guest_feedback LIKE '%terrible%' THEN 'Negative'
        ELSE 'Neutral'
    END AS Sentiment
FROM accommodations
WHERE guest_feedback IS NOT NULL;

SELECT accommodation_city, COUNT(*) AS CityCount
FROM accommodations
GROUP BY accommodation_city
ORDER BY CityCount DESC
LIMIT 1;


