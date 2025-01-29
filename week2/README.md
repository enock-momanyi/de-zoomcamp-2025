To include 2021 we can use the existing schduled flow and utilise backfills in Kestra for green taxi and yellow taxi data

### Question 3
```
SELECT COUNT(*) FROM `demo_dataset_enockenm.yellow_tripdata`
```
### Question 4
```
SELECT COUNT(*) FROM `demo_dataset_enockenm.green_tripdata`
```
### Question 5
```
SELECT COUNT(*) FROM `demo_dataset_enockenm.yellow_tripdata_2021_03`
```

### Qeustion 6
Configuring timezone to New York in a Schedule trigger
```
...
triggers:
  - id: daily
    type: io.kestra.plugin.core.trigger.Schedule
    cron: "@daily"
    timezone: America/New_York
```
