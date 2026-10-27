USE NewFlightDB;

CREATE TABLE IF NOT EXISTS Flights (
    flight_id INT PRIMARY KEY,
    airline_name VARCHAR(50),
    from_airport VARCHAR(50),
    to_airport VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME,
    price DECIMAL(10,2),
    seats_available INT
);
desc flights;


CREATE TABLE IF NOT EXISTS Passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100)
);
desc Passengers;


CREATE TABLE IF NOT EXISTS Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    seat_number VARCHAR(10),
    status VARCHAR(20),
    FOREIGN KEY (passenger_id)
        REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id)
        REFERENCES Flights(flight_id)
);
DESC Bookings;


INSERT INTO Flights VALUES
(101, 'IndiGo', 'Hyderabad', 'Delhi',
 '2026-11-01 08:00:00', '2026-11-01 10:30:00', 4500, 40),
(102, 'Air India', 'Hyderabad', 'Mumbai',
 '2026-11-02 09:00:00', '2026-11-02 11:00:00', 5200, 25),
(103, 'SpiceJet', 'Chennai', 'Bengaluru',
 '2026-11-03 12:00:00', '2026-11-03 13:00:00', 2500, 30),
(104, 'IndiGo', 'Delhi', 'Hyderabad',
 '2026-11-04 15:00:00', '2026-11-04 17:30:00', 4800, 20),
(105, 'Air India', 'Mumbai', 'Chennai',
 '2026-11-05 18:00:00', '2026-11-05 20:00:00', 6000, 15);


INSERT INTO Passengers VALUES
(1, 'Rahul', 25, 'Male', 'rahul@gmail.com'),
(2, 'Priya', 22, 'Female', 'priya@gmail.com'),
(3, 'Arun', 30, 'Male', 'arun@gmail.com'),
(4, 'Sneha', 24, 'Female', 'sneha@gmail.com'),
(5, 'Kiran', 28, 'Male', 'kiran@gmail.com');


INSERT INTO Bookings VALUES
(1001, 1, 101, '2026-10-20', 'A1', 'Confirmed'),
(1002, 2, 102, '2026-10-21', 'B2', 'Confirmed'),
(1003, 3, 103, '2026-10-22', 'C3', 'Cancelled'),
(1004, 4, 101, '2026-10-23', 'A2', 'Confirmed'),
(1005, 5, 105, '2026-10-24', 'D1', 'Pending');

SELECT * FROM Flights;
SELECT * FROM Passengers;
SELECT * FROM Bookings;


-- Q1. Display all flights
SELECT * FROM Flights;

-- Q2. Display all passengers
SELECT * FROM Passengers;

-- Q3. Display all bookings
SELECT * FROM Bookings;

-- Q4. Display airline names
SELECT airline_name FROM Flights;

-- Q5. Display passenger names and ages
SELECT passenger_name, age FROM Passengers;

-- Q6. Find flights from Hyderabad
SELECT * FROM Flights
WHERE from_airport = 'Hyderabad';

-- Q7. Find flights to Delhi
SELECT * FROM Flights
WHERE to_airport = 'Delhi';


-- Q8. Find passengers older than 25
SELECT * FROM Passengers
WHERE age > 25;

-- Q9. Find confirmed bookings
SELECT * FROM Bookings
WHERE status = 'Confirmed';

-- Q10. Display unique airlines
SELECT DISTINCT airline_name FROM Flights;

-- Q11. Count total flights
SELECT COUNT(*) AS total_flights FROM Flights;

-- Q12. Count total passengers
SELECT COUNT(*) AS total_passengers FROM Passengers;

-- Q13. Count confirmed bookings
SELECT COUNT(*) AS confirmed_bookings
FROM Bookings
WHERE status = 'Confirmed';

-- Q14. Display flights from Hyderabad
SELECT * FROM Flights
WHERE from_airport = 'Hyderabad';

-- Q15. Display flights to Delhi
SELECT * FROM Flights
WHERE to_airport = 'Delhi';

-- Q16. Count total flights
SELECT COUNT(*) AS total_flights
FROM Flights;

-- Q17. Count passengers
SELECT COUNT(*) AS total_passengers
FROM Passengers;

-- Q18. Display passengers older than 25
SELECT * FROM Passengers
WHERE age > 25;

-- Q19. Display confirmed bookings
SELECT * FROM Bookings
WHERE status = 'Confirmed';

-- Q20. Count bookings by status
SELECT status, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY status;

