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

-- TourismKenya SQL code

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


