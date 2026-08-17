create database ola;
use ola;

-- 1. Retrieve all successful bookings:

create View successful_bookings As
SELECT * FROM bookings WHERE Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:

create view Avg__Dist_for_Each_Vehicle as
SELECT Vehicle_Type, AVG(Ride_Distance) as 
avg_distance FROM bookings GROUP BY
Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as	
SELECT count(*) FROM bookings 
WHERE Booking_Status = 'canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:

create view top_5_customers as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5; 

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view rides_cancelled_by_drivers As
select count(*) from Bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view driver_ratings as
SELECT 
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:

create view Upi_Pyment as
select * from bookings 
where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:

create view average_customer_rating_per_vehicle as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings
GROUP BY Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:

create view Complete_ride as
select count(*) from bookings
where Incomplete_Rides = 'NO';

-- 10. List all incomplete rides along with the reason:

create view InComplete_ride as
select count(*) from bookings
where Incomplete_Rides = 'Yes';

#########################################################################################################################################
-- ANSWERS OF ALL 10 QUESTIONS

#1. Retrieve all successful bookings:
Select * From Successful_Bookings;
#################################################################
#2. Find the average ride distance for each vehicle type:
Select * from Avg__Dist_for_Each_Vehicle;
#################################################################
#3. Get the total number of cancelled rides by customers:
Select * from cancelled_rides_by_customers;
#################################################################
#4. List the top 5 customers who booked the highest number of rides:
Select * from Top_5_Customers;
#################################################################
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * from rides_cancelled_by_drivers;
#################################################################
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * from driver_ratings;
#################################################################
#7. Retrieve all rides where payment was made using UPI:
 Select * from Upi_Pyment;
#################################################################
#8. Find the average customer rating per vehicle type:
 Select * from average_customer_rating_per_vehicle;
#################################################################
#9. Calculate the total booking value of rides completed successfully:
 Select * from Complete_ride;
#################################################################
#10. List all incomplete rides along with the reason:
 Select * from InComplete_ride;
#########################################################################################################################################
