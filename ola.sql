create database ola;
use ola;

#1. Retrieve all successful bookings
create view successful_booking as
select * from bookings
where Booking_Status = 'Success';

select * from successful_booking;

#2. Find the average ride distance for each vehicle type

create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as avg_distance 
from bookings
group by Vehicle_Type;

#3. Get the total number of canceled rides by customers:

create view canceled_rides_by_customer as
select count(*) from bookings
where Booking_Status ='Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides

create view top_5_customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc
limit 5;

#5. Get the number of rides canceled by drivers due to personal and car-related issues

create view Rides_Canceled_by_Drivers_P_C_Issues as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimun driver ratings for Prime Sedan bookings

create view Min_Max_Driver_Rating As
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings
where Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI

create view UPI_Payment as
select * from bookings
where Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type

create view Avg_Cust_Rating as
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully

create view total_successful_ride as
select sum(Booking_Value) as total_successful_value
from bookings
where Booking_Status = 'Success';

#10. List all incomplete rides along with the reason

create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';

# All questions answers

select * from successful_booking;
select * from ride_distance_for_each_vehicle;
select * from canceled_rides_by_customer;
select * from top_5_customers;
select * from Rides_Canceled_by_Drivers_P_C_Issues;
select * from Min_Max_Driver_Rating;
select * from UPI_Payment;
select * from Avg_Cust_Rating;
select * from total_successful_ride;
select * from Incomplete_Rides_Reason;
