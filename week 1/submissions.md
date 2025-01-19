1. `docker run -it --entrypoint=bash python:3.12.8`
    `pip --version` 24.3.1

3 `SELECT COUNT(*) FROM green_taxi_data
WHERE CAST(lpep_pickup_datetime AS DATE) BETWEEN '2019-09-30' AND '2019-10-31'
AND CAST(lpep_dropoff_datetime AS DATE) BETWEEN '2019-09-30' AND '2019-10-31'
AND trip_distance <= 1`

`SELECT COUNT(*) FROM green_taxi_data
WHERE CAST(lpep_pickup_datetime AS DATE) BETWEEN '2019-10-01' AND '2019-10-31'
AND CAST(lpep_dropoff_datetime AS DATE) BETWEEN '2019-10-01' AND '2019-10-31'
AND trip_distance >1 AND trip_distance <=3 ` 198924
