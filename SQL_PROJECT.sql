---# CREATING DATABASE

CREATE DATABASE IF NOT EXISTS `grosvenor hotel`;

---# USING THE 'Grosvenor hotel' DATABASE

USE `grosvenor hotel`;

---# CREATING 'HOTEL' TABLE 

CREATE TABLE IF NOT EXISTS `HOTEL` (
`HOTEL_NO` CHAR(4) NOT NULL,
`NAME` VARCHAR(20) NOT NULL,
`ADDRESS` VARCHAR(50) NOT NULL);

---# INSERTING VALUES INTO THE 'HOTEL' TABLE 

INSERT INTO `HOTEL` VALUES
('H111', 'GROSVENOR HOTEL', 'LONDON'),
('H114', 'GROSVENOR HOTEL', 'INDIA'),
('H115', 'GROSVENOR HOTEL', 'SINGAPORE'),
('H116', 'GROSVENOR HOTEL', 'LOS ANGELES'),
('H112', 'GROSVENOR HOTEL', 'LONDON'),
('H113', 'GROSVENOR HOTEL', 'LONDON') 
;

---# CREATING 'ROOM' TABLE

CREATE TABLE IF NOT EXISTS room (
    room_no VARCHAR(4) NOT NULL,
    hotel_no CHAR(4) NOT NULL,
    type CHAR(1) NOT NULL,
    price DECIMAL(5, 2) NOT NULL
);

---# INSERTING VALUES INTO THE 'ROOM' TABLE

INSERT INTO ROOM VALUES 
('R1', 'H111', 'S', 72.00),
('R2', 'H111', 'D', 38.00),
('R3', 'H112', 'F', 120.00),
('A1', 'H112', 'S', 51.00),
('A2', 'H113', 'D', 60.00),
('B1', 'H113', 'F', 110.00),
('C1', 'H114', 'S', 46.00),
('C2', 'H114', 'D', 90.00),
('D3', 'H115', 'F', 70.00),
('E1', 'H115', 'F', 95.00),
('E2', 'H116', 'S', 105.00),
('F1', 'H116', 'D', 28.00)
; 

---# CREATING 'BOOKING' TABLE

CREATE TABLE IF NOT EXISTS booking (
    hotel_no CHAR(4) NOT NULL,
    guest_no CHAR(4) NOT NULL,
    date_from DATETIME NOT NULL,
    date_to DATETIME NULL,
    room_no CHAR(4) NOT NULL
); 

---# INSERTING VALUES INTO 'BOOKING' TABLE

INSERT INTO booking VALUES 
('H111', 'G111', DATE'1999-01-01', DATE'1999-01-02', 'R1'),
('H111', 'G114', DATE'1999-02-03', DATE'1999-02-04', 'R2'),
('H112', 'G116', DATE'1999-01-11', DATE'1999-01-13', 'A1'),
('H112', 'G117', DATE'1999-08-24', DATE'1999-08-26', 'A2'),
('H113', 'G112', DATE'1999-08-09', DATE'1999-08-11', 'B1'),
('H114', 'G114', DATE'1999-04-01', DATE'1999-04-03', 'D1'),
('H114', 'G116', DATE'1999-08-10', DATE'1999-08-12', 'D3'),
('H115', 'G119', DATE'1999-06-13', DATE'1999-06-15', 'E2'),
('H116', 'G111', DATE'1999-04-26', DATE'1999-04-28', 'L1'),
('H116', 'G115', DATE'1999-08-11', DATE'1999-08-18', 'T1')
;

---# CREATING 'GUEST' TABLE

CREATE TABLE IF NOT EXISTS GUEST (
    guest_no CHAR(4) NOT NULL,
    name VARCHAR(20) NOT NULL,
    address VARCHAR(50) NOT NULL
);

---# INSERTING VALUES INTO THE 'GUEST' TABLE

INSERT INTO guest VALUES 
('G111', 'JOHN SMITH', 'LONDON'),
('G112', 'RAJU', 'INDIA'),
('G113', 'ANVESH', 'LONDON'),
('G114', 'BENSTON', 'SINGAPORE'),
('G115', 'RAVI', 'LOS ANGELES'),
('G116', 'RAMAKRISHNA', 'LONDON')
;

------------------------------------------------------------------------------------------
---# Updating the Tables #---
SET SQL_SAFE_UPDATES = 0;

UPDATE room 
SET 
    price = price * 1.05;
    
------------------------------------------------------------------------------------------------------------------------------------------
---# Create a separate table with the same structure as the Booking table to hold archive records.
---# Using the INSERT statement, copy the records from the Booking table to the archive table relating to bookings before 1st January 2000. 
---# Delete all bookings before 1st January 2000 from the Booking table.

CREATE TABLE booking_old (
    hotel_no CHAR(4) NOT NULL,
    guest_no CHAR(4) NOT NULL,
    date_from DATETIME NOT NULL,
    date_to DATETIME NULL,
    room_no VARCHAR(4) NOT NULL
);

INSERT INTO booking_old (SELECT * FROM booking WHERE date_to < DATE'2000-01-01'); 

DELETE FROM booking WHERE (date_to < DATE'2000-01-01');    

#|-----------------------------------------|#
#| BEFORE WRITING QUIERIES FOR QUESTIONS   |#
#| AGAIN RUN THE INSERTING 'BOOKING' TABLE.|#
#|-----------------------------------------|#
------------------------------------------------------------------------------------------------------------------------------------------
---# SAMPLE QUERIES
---# Q1.LIST THE FULL DETAILES OF ALL HOTELS.

---# SELCTING ALL FROM HOTEL TABLE
---# HERE IM USING NATURAL JOIN BECAUSE ROOM DETAILES ALSO CONSIDER UNDER HOTEL DETAILES.
 
SELECT 
    *
FROM
    HOTEL NATURAL JOIN ROOM;    
------------------------------------------------------------------------------------------------------------------------------------------
---# Q2.List full details of all hotels in London. 
---# SELECTING ALL FROM HOTEL TABLES AND 
---# PRINTING ALL HOTELS WHICH ARE IN 'LONDON'

SELECT 
    *
FROM
    HOTEL
WHERE
    ADDRESS = 'LONDON';    
------------------------------------------------------------------------------------------------------------------------------------------
---# Q3.List the names and addresses of all guests in London, alphabetically ordered by name. 
---# SELECTING NAME AND ADDRESS FROM 'GUEST' TABLE AND 
---# PRINTING ALL GUESTS DETAILES FROM 'LONDON' AND ARRANGING IN ALPHABETICAL ORDER

SELECT 
    NAME, ADDRESS
FROM
    GUEST
WHERE
    ADDRESS = 'LONDON'
ORDER BY name;
------------------------------------------------------------------------------------------------------------------------------------------
---# Q4.List all double or family rooms with a price below £40.00 per night, in ascending order of price. 
---# SELECTING TYPE AND PRICE COLUMNS FROM ROOM TABLE AND
---# PRINTING ALL DOOUBLE(D) OR FAMILY ROOMS WITH A PRICE BELOW '40.00' PER NIGHT AND ARRANGING PRICE IN LOW TO HIGH

SELECT 
    TYPE, PRICE
FROM
    ROOM
WHERE
    PRICE < 40.00 AND TYPE IN ('F' , 'D')
ORDER BY price;
------------------------------------------------------------------------------------------------------------------------------------------
---# Q5.List the bookings for which no date_to has been specified.
---# SELECTING ALL FROM BOOKING TABLE AND 
---# PRINT THAT WHICH 'DATE_TO' HAS BEEN SPECIFIED.
  
SELECT 
    *
FROM
    BOOKING
WHERE
    DATE_TO IS NULL;    
------------------------------------------------------------------------------------------------------------------
---# AGGREGATE FUNCTIONS 
---# Q1.How many hotels are there? 
---# SELECTING NAME FROM HOTEL AND COUNTING THE NAME OF HOTELS 
---# PRINTING THE TOTAL COUNT OF HOTEL.

SELECT 
    COUNT(NAME) AS 'NUMBER OF HOTELS'
FROM
    HOTEL;
------------------------------------------------------------------------------------------------------------------------------------------    
---# Q2.What is the average price of a room? 
---# SELECTING PRICE FROM ROOM TABLE AND 
---# CALCULATING THE AVERAGE OF PRICE AND PUTTING DECIMAL TO 2
---# AND PRINTING THE AVERAGE PRICE OF A ROOM.

SELECT 
    ROUND(AVG(PRICE), 2) AS 'AVERAGE PRICE OF A ROOM'
FROM
    ROOM;
------------------------------------------------------------------------------------------------------------------------------------------
---# Q3.What is the total revenue per night from all double rooms? 
---# SELECTING TYPE AND PRICE FROM ROOM TABLE AND 
---# CALCULATING TOTAL SUM OF PRICES OF ALL DOUBLE ROOMS 
---# AND PRINTING THE TOTAL REVENUE PER NIGHT FROM ALL DOUBLE ROOMS 

SELECT 
    TYPE, SUM(PRICE)
FROM
    ROOM
WHERE
    TYPE = 'D'; 
------------------------------------------------------------------------------------------------------------------------------------------
---# Q4.How many different guests have made bookings for August?
---# SELECTING 'GUEST NUMBER' FROM 'BOOKING' TABLE AND USING 'DISTINCT' TO NOT REPEAT THE GUEST NAME
---# PRINTING THE DIFFERENT GUESTS HAVE MADE BOOKINGS FOR 'AUGUST' MONTH

SELECT 
    COUNT(DISTINCT(GUEST_NO)) AS 'NUMBER OF GUESTS'
FROM
    BOOKING
WHERE
    MONTHNAME(DATE_FROM) = 'AUGUST';
-------------------------------------------------------------------------------------------------------------------------------------------
---# SUBQUIERIES AND JOINS
---# Q1.LIST THE PRICE AND TYPE OF ALL ROOMS AT THE GROSVENOR HOTEL.
---# SELECTING PRICE, TYPE OF ROOM AND NAME OF HOTELS COLUMNS FROM ROOO AND HOTEL TABLES AND 
---# PRINTINF THE DETAILES OF THE ROOM IN GROSVENOR HOTEL.

SELECT 
    R.PRICE AS 'ROOM PRICE',
    R.TYPE AS 'ROOM TYPE',
    H.NAME AS 'HOTEL NAME'
FROM
    ROOM R,
    HOTEL H
WHERE
    R.HOTEL_NO = H.HOTEL_NO
        AND H.NAME = 'GROSVENOR HOTEL';            
------------------------------------------------------------------------------------------------------------------------------------------    
---# Q2.List all guests currently staying at the Grosvenor Hotel. 
---# SELECTING ALL FROM 'GUEST' TABLE AND WRITING SUBQUERY 
---# IN SUBQUERY SELECTING 'GUEST_NO' FROM 'GUEST' TABLE AND CHECKING THAT WHEATHER THE ROOM IS BOOKED OR NOT TODAY
---# AND AGAIN WRITING SUBQUERY TO FIND THIS FROM 'GROSVENOR HOTEL'
SELECT 
  * 
FROM 
  GUEST 
WHERE 
  GUEST_NO = (
    SELECT 
      GUEST_NO 
    FROM 
      BOOKING 
    WHERE 
      DATE_FROM <= CURRENT_DATE 
      AND DATE_TO >= CURRENT_DATE 
      AND HOTEL_NO = (
        SELECT 
          HOTEL_NO 
        FROM 
          HOTEL 
        WHERE 
          NAME = 'GROSVENOR HOTEL'
      )
  );

------------------------------------------------------------------------------------------------------------------------------------------
---# Q3.List the details of all rooms at the Grosvenor Hotel, including the name of the guest staying in the room, if the room is occupied. 
---# SELECTING ALL FROM 'ROOM TABLE AND NAME FROM 'GUEST' TABLE
---# AND TAKING BOOKING AND HOTEL TABLES ALSO TO GET COMMON COLUMN IN EACH TABLE
---# AND HERE IM USING INNER JOIN TO FIND 
---# ALL DETAILES OF ROOM AND GUESTS NAMES IF ROOM IS OSSUPIED ON CURRENT DATE. 

SELECT 
    R.*, G.NAME AS 'GUEST NAME'
FROM
    GUEST G,
    BOOKING B,
    ROOM R,
    HOTEL H
WHERE
    G.GUEST_NO = B.GUEST_NO
        AND B.ROOM_NO = R.ROOM_NO
        AND R.HOTEL_NO = H.HOTEL_NO
        AND H.NAME = 'GROSVENOR HOTEL'
        AND DATE_FROM <= CURRENT_DATE
        AND DATE_TO >= CURRENT_DATE;
------------------------------------------------------------------------------------------------------------------------------------------
---# Q4.What is the total income from bookings for the Grosvenor Hotel today? 
---# SELECTING PRICE FROM 'ROOM' TABLE AND CALCULATING THE SUM OF THE RPICE
---# ADN TAKING BOOKING AND HOTEL TABLES ALSO
---# TO FIND THAT THE TOTAL INCOME FROM BOOKING FOR THE 'GROSVENOR HOTEL' TODAY

 SELECT 
    SUM(PRICE) AS 'TOTAL INCOME'
FROM
    BOOKING B,
    ROOM R,
    HOTEL H
WHERE
    (B.DATE_FROM <= CURRENT_DATE
        AND B.DATE_TO >= CURRENT_DATE)
        AND R.HOTEL_NO = H.HOTEL_NO
        AND R.HOTEL_NO = B.HOTEL_NO
        AND R.ROOM_NO = B.ROOM_NO
        AND H.NAME = 'GROSVENOR HOTEL';
------------------------------------------------------------------------------------------------------------------------------------------        
---# Q5.List the rooms that are currently unoccupied at the Grosvenor Hotel. 
---# SELECTING ROOM AND NAME OF HOTEL FROM 'ROOM' AND 'HOTEL' TABLES
---# AND WRITING SUBQUERIES WITH BOOKING AND HOTEL TABLES 
---# TO CHECK THAT UNOCCUPIED ROOMS AT THE 'GROSVENOR HOTEL' TODAY.

SELECT 
    R.ROOM_NO AS 'ROOM NUMBER',
    R.HOTEL_NO AS 'HOTEL NUMBER',
    H.NAME AS 'NAME'
FROM
    ROOM R,
    HOTEL H
WHERE
    R.HOTEL_NO = H.HOTEL_NO
        AND H.NAME = 'GROSVENOR HOTEL'
        AND ROOM_NO NOT IN (SELECT 
            ROOM_NO
        FROM
            BOOKING B,
            HOTEL H
        WHERE
            (DATE_FROM <= CURRENT_DATE
                AND DATE_TO >= CURRENT_DATE)
                AND B.HOTEL_NO = H.HOTEL_NO
                AND H.NAME = 'GROSVENOR HOTEL');
------------------------------------------------------------------------------------------------------------------------------------------                
---# Q6.What is the lost income from unoccupied rooms at the Grosvenor Hotel?
---# SELECTING PRICE AND HOTEL NAME FROM 'ROOM' AND 'HOTEL' TABLES AND CALCULATING THE SUM OF THE PRICE
---# AND WRITING SUBQUERY WITH 'BOOKING' AND 'HOTEL' 
---# TO CHECK THE TOTAL LOST INCOME FROM UNCCUPIED ROOMS AT THE 'GROSVENOR HOTEL'.

SELECT 
    SUM(R.PRICE) AS 'LOST INCOME',
    H.NAME AS 'NAME'
FROM
    ROOM R,
    HOTEL H
WHERE
    R.HOTEL_NO = H.HOTEL_NO
        AND H.NAME = 'GROSVENOR HOTEL'
        AND ROOM_NO NOT IN (SELECT 
            ROOM_NO
        FROM
            BOOKING B,
            HOTEL H
        WHERE
            (DATE_FROM <= CURRENT_DATE
                AND DATE_TO >= CURRENT_DATE)
                AND B.HOTEL_NO = H.HOTEL_NO
                AND H.NAME = 'GROSVENOR HOTEL');
                
-------------------------------------------------------------------------------------------------------------------------------------------
---# GROUPING 
---# Q1.List the number of rooms in each hotel. 
---# SELECTING ROOM_NUMBER, ADDRESS AND NAME OF HOTEL FROM ROOM AND HOTEL TABLES AND COUNTING THE TOTAL ROOM_NUMBERS
---# AND USING NATURAL JOINS TO LIST THE NUMBER OF ROOMS IN EACH HOTEL
---# USING GROUP BY OF HOTEL_NO TO GET NUMBER OF ROOMS IN EACH HOTEL. 

SELECT 
    COUNT(ROOM.ROOM_NO) AS 'NUMBER OF ROOMS',
    HOTEL.ADDRESS AS 'PLACE',
    HOTEL.NAME AS 'HOTEL NAME'
FROM
    ROOM
        NATURAL JOIN
    HOTEL
GROUP BY HOTEL.HOTEL_NO;
------------------------------------------------------------------------------------------------------------------------------------------
---# Q2.List the number of rooms in each hotel in London. 
---# SAME AS ABOVE QUERY BUT
---# IN THIS FINDING NUMBER OF ROOMS IN EACH HOTEL IN 'LONDON' PLACE.
---# AND USING GROUP BY OF HOTEL_NO TO GET THE NO.OF ROOMS IN EACH HOTEL IN LONDON
SELECT 
    COUNT(ROOM.ROOM_NO) AS 'NUMBER OF ROOMS',
    HOTEL.ADDRESS AS 'PLACE',
    HOTEL.NAME AS 'HOTEL NAME'
FROM
    ROOM
        NATURAL JOIN
    HOTEL
WHERE
    HOTEL.ADDRESS = 'LONDON'
GROUP BY HOTEL.HOTEL_NO;
------------------------------------------------------------------------------------------------------------------------------------------    
---# Q3.What is the average number of bookings for each hotel in August? 
---# IN SUBQUERY SELECTINNG HOTEL_NUMBER FROM BOOKING TABLE AND CALCULATING THE COUNT OF THE HOTEL NUMBERS
---# AND CHECKING THAT NUMBER OF BOOKINNG FOR EACH HOTEL IN AUGUST
---# AND PRINTING THE AVERAGE NUMBER OF BOOKINGS FOR EACH HOTEL IN AUGUST.
---# USING GROUP BY OF HOTEL NUMBER TO GET AVG NO.OF BOOKINGS FOR EACH HOTEL IN AUGUST.

SELECT 
    AVG(H_COUNT) AS AVERAGE
FROM
    (SELECT 
        HOTEL_NO, COUNT(HOTEL_NO) AS H_COUNT
    FROM
        BOOKING B
    WHERE
        (B.DATE_FROM >= DATE '1999-08-01'
            AND B.DATE_TO <= DATE '1999-08-31')
    GROUP BY HOTEL_NO) AS ANOTHERTHING;
------------------------------------------------------------------------------------------------------------------------------------------
---# Q4.What is the most commonly booked room type for each hotel in London? 
---# IN SUBQUERY SELECTING TYPE OF ROOM FROM ROOM TABLE AND CALCULATING THE COUNT OF 'ROOM TYPES'
---# AND FINDING THE MOST COMMONLY BOOKED ROOM TYPE FOR EACH HOTEL IN LONDON
---# USING GROUP BY OF TYPE TO GET THE MOST COMMONLY BOOKED ROOM TYPE

SELECT 
    MAX(T_COUNT) AS MOST_BOOKING
FROM
    (SELECT 
        TYPE, COUNT(TYPE) AS T_COUNT
    FROM
        BOOKING B, HOTEL H, ROOM R
    WHERE
        R.ROOM_NO = B.ROOM_NO
            AND B.HOTEL_NO = H.HOTEL_NO
            AND H.ADDRESS = 'LONDON'
    GROUP BY TYPE) AS DUMMY;
------------------------------------------------------------------------------------------------------------------------------------------    
---# Q5.What is the lost income from unoccupied rooms at each hotel today?
---# SELECTING HOTEL_NO AND PRICE FROM ROOM TABLE AND CALCULATING THE SUM OF THE PRICE
---# WRITING SUBQUERY TO CHECK THAT UNOCCUPIED ROOMS AT EACH HOTEL TODAY
---# USING GROUP BY OF HOTEL_NO AND
---# PRINTING THE LOST INCOME FROM UNOCCUPIED ROOMS AT EACH HOTEL TODAY.

SELECT 
    R.HOTEL_NO AS 'HOTEL NUMBER', SUM(R.PRICE) AS 'ROOM PRICE'
FROM
    ROOM R
WHERE
    R.ROOM_NO NOT IN (SELECT 
            B.ROOM_NO
        FROM
            BOOKING B,
            HOTEL H
        WHERE
            B.DATE_FROM <= CURDATE()
                AND B.DATE_TO >= CURDATE()
                AND B.HOTEL_NO = H.HOTEL_NO)
GROUP BY R.HOTEL_NO;