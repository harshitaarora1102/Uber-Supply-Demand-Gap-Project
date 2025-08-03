use uber_supply_gap_sqlfile;
show tables;
select * from `cleaned_uber request data1`;

-- INSIGHTS

-- 1. Total Number of Requests

select COUNT(*) AS total_requests 
from `cleaned_uber request data1`;

-- 2. Request Count by Status

SELECT Status, COUNT(*) AS request_count 
FROM `cleaned_uber request data1` 
GROUP BY Status;

-- 3. Requests Grouped by Pickup Point

SELECT `Pickup point`, COUNT(*) AS total_requests 
FROM `cleaned_uber request data1` 
GROUP BY `Pickup point`;

-- 4. Status-wise Request Breakdown by Pickup Point

SELECT `Pickup point`, Status, COUNT(*) AS total 
FROM `cleaned_uber request data1` 
GROUP BY `Pickup point`, Status 
ORDER BY `Pickup point`;

-- 5. Hourly Ride Request Distribution

SELECT `Request hour`, COUNT(*) AS total_requests 
FROM `cleaned_uber request data1` 
GROUP BY `Request hour` 
ORDER BY `Request hour`;

-- 6. Time Slot with Highest Cancellations

SELECT `Time Slots`, COUNT(*) AS cancelled_count 
FROM `cleaned_uber request data1` 
WHERE Status = 'Cancelled' 
GROUP BY `Time Slots` 
ORDER BY cancelled_count DESC;

-- 7. Time Slot with Most “No Cars Available”

SELECT `Time Slots`, COUNT(*) AS no_car_count
FROM `cleaned_uber request data1`
WHERE Status = 'No Cars Available'
GROUP BY `Time Slots`
ORDER BY no_car_count DESC;

-- 8. Requests by Status and Time Slot

SELECT `Time Slots`, Status, COUNT(*) AS total
FROM `cleaned_uber request data1`
GROUP BY `Time Slots`, Status
ORDER BY `Time Slots`;

-- 9. Cancellations by Hour of Day

SELECT `Request hour`, COUNT(*) AS cancellations
FROM `cleaned_uber request data1`
WHERE Status = 'Cancelled'
GROUP BY `Request hour`
ORDER BY cancellations DESC;

-- 10. Number of Completed Trips by Pickup Point

SELECT `Pickup point`, COUNT(*) AS completed_trips
FROM `cleaned_uber request data1`
WHERE Status = 'Trip Completed'
GROUP BY `Pickup point`;

-- 11. Fulfillment Rate per Time Slot

SELECT `Time Slots`,
       COUNT(CASE WHEN Status = 'Trip Completed' THEN 1 END) * 100.0 / COUNT(*) AS fulfillment_rate
FROM `cleaned_uber request data1`
GROUP BY `Time Slots`;

-- 12. Pickup Point with Most Unavailability

SELECT `Pickup point`, COUNT(*) AS unavailability_count
FROM `cleaned_uber request data1`
WHERE Status = 'No Cars Available'
GROUP BY `Pickup point`
ORDER BY unavailability_count DESC;

-- 13. Hour-wise Breakdown of Statuses

SELECT `Request hour`, Status, COUNT(*) AS total
FROM `cleaned_uber request data1`
GROUP BY `Request hour`, Status
ORDER BY `Request hour`;

