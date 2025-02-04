
-- Creating external table referring to nyc path
CREATE OR REPLACE EXTERNAL TABLE `nytaxi.external_yellow_tripdata`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://yellowdata-2024/yellow_tripdata_2024-01.parquet','gs://yellowdata-2024/yellow_tripdata_2024-02.parquet','gs://yellowdata-2024/yellow_tripdata_2024-03.parquet','gs://yellowdata-2024/yellow_tripdata_2024-04.parquet','gs://yellowdata-2024/yellow_tripdata_2024-05.parquet','gs://yellowdata-2024/yellow_tripdata_2024-06.parquet']
);

-- records in 2024 yellow taxi data
SELECT COUNT(VendorID) FROM `nytaxi.external_yellow_tripdata`; -- 20332093

-- Create a non partitioned table from external table
CREATE OR REPLACE TABLE nytaxi.yellow_tripdata_non_partitoned AS
SELECT * FROM nytaxi.external_yellow_tripdata;

-- estimated amount of data in extertal table
SELECT COUNT( DISTINCT PULocationID) FROM `nytaxi.external_yellow_tripdata`; -- 0B

-- estimated amount of data in materialized table

SELECT COUNT( DISTINCT PULocationID) FROM `nytaxi.yellow_tripdata_non_partitoned`; -- 155.12 MB

SELECT COUNT( fare_amount) FROM `nytaxi.yellow_tripdata_non_partitoned` 
WHERE fare_amount = 0; -- 8333


CREATE OR REPLACE TABLE nytaxi.yellow_data_partitioned_clustered
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT * FROM `nytaxi.external_yellow_tripdata`;


SELECT DISTINCT(VendorID) FROM `nytaxi.yellow_tripdata_non_partitoned`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15'; -- 310.24 MB


SELECT DISTINCT(PULocationID) FROM `nytaxi.yellow_data_partitioned_clustered`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15'; -- 26.84 MB


SELECT COUNT(*) FROM `nytaxi.yellow_tripdata_non_partitoned`;

SELECT PULocationID FROM `nytaxi.yellow_tripdata_non_partitoned`; -- 155.12 MB

SELECT PULocationID,DOLocationID FROM `nytaxi.yellow_tripdata_non_partitoned`; -- 310.24
