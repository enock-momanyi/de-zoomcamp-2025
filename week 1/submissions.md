1. `docker run -it --entrypoint=bash python:3.12.8`
    `pip --version` 24.3.1

3 `SELECT COUNT(*) FROM green_taxi_data
WHERE  CAST(lpep_dropoff_datetime AS DATE) BETWEEN '2019-09-30' AND '2019-10-31'
AND trip_distance <= 1`

`SELECT COUNT(*) FROM green_taxi_data
WHERE CAST(lpep_dropoff_datetime AS DATE) BETWEEN '2019-10-01' AND '2019-10-31'
AND trip_distance >1 AND trip_distance <=3 ` 198924

`SELECT COUNT(*) FROM green_taxi_data
WHERE 
CAST(lpep_dropoff_datetime AS DATE) BETWEEN '2019-10-01' AND '2019-10-31'
AND trip_distance > 7 AND trip_distance <=10`

`SELECT COUNT(*) FROM green_taxi_data
WHERE 
CAST(lpep_dropoff_datetime AS DATE) BETWEEN '2019-10-01' AND '2019-10-31'
AND trip_distance > 10`


`SELECT CAST(lpep_pickup_datetime AS DATE) AS pickup_day, trip_distance FROM green_taxi_data
ORDER BY trip_distance DESC LIMIT 1` 2019-10-31

`select 
	SUM(g.total_amount) AS total, z."Zone" AS zone 
FROM
	green_taxi_data g 
	JOIN
	zones z 
	ON g."PULocationID" = z."LocationID"
WHERE CAST(g.lpep_pickup_datetime AS DATE) = '2019-10-18'
GROUP BY zone
HAVING SUM(g.total_amount) > 13000
ORDER BY total DESC LIMIT 3` 
