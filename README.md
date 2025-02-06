# This readme is for hw2

To download green taxi data I created a script to download all the files `download_taxi_data_green.sh` and `download_taxi_data_yellow.sh`.

To run the scripts you only need to run them with bash in a terminal:

```shell
❯ bash download_taxi_data_yellow.sh
Baixando yellow_tripdata_2019-01.csv.gz...
################################################################################################################################################################################### 100,0%
Baixando yellow_tripdata_2019-02.csv.gz...
################################################################################################################################################################################### 100,0%
.....
Download complete!
```

1) Within the execution for `Yellow` Taxi data for the year `2020` and month `12`: what is the uncompressed file size (i.e. the output file `yellow_tripdata_2020-12.csv` of the `extract` task)?
- 128.3 MB
- 134.5 MB
- 364.7 MB
- 692.6 MB

To accurately check the size of the uncompressed document in MB in the terminal:

```shell
ls -l yellow_tripdata_2020-12.csv | awk '{print $5/1024/1024 " MB"}'
```

2) What is the rendered value of the variable `file` when the inputs `taxi` is set to `green`, `year` is set to `2020`, and `month` is set to `04` during execution?
- `{{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv` 
- `green_tripdata_2020-04.csv`
- `green_tripdata_04_2020.csv`
- `green_tripdata_2020.csv`

The variable green_tripdata will have the following value after input substitution:

```shell
{{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv
green_tripdata_2020-04.csv
```

3) How many rows are there for the `Yellow` Taxi data for all CSV files in the year 2020?
- 13,537.299
- 24,648,499
- 18,324,219
- 29,430,127

To Sum rows across all 2020 Yellow Taxi files (after downloading the CSVs files)
```shell
cat yellow_tripdata_2020-*.csv | wc -l
```

4) How many rows are there for the `Green` Taxi data for all CSV files in the year 2020?
- 5,327,301
- 936,199
- 1,734,051
- 1,342,034

To count all lines of green_tripdata for the year 2020
```shell
cat green_tripdata_2020-*.csv | wc -l  
```

5) How many rows are there for the `Yellow` Taxi data for the March 2021 CSV file?
- 1,428,092
- 706,911
- 1,925,152
- 2,561,031

Command to count rows for March 2021:

```shell
tail -n +2 yellow_tripdata_2021-03.csv | wc -l
```

6) How would you configure the timezone to New York in a Schedule trigger?
- Add a `timezone` property set to `EST` in the `Schedule` trigger configuration  
- Add a `timezone` property set to `America/New_York` in the `Schedule` trigger configuration
- Add a `timezone` property set to `UTC-5` in the `Schedule` trigger configuration
- Add a `location` property set to `New_York` in the `Schedule` trigger configuration

to Save the script:

```shell
chmod +x schedule_trigger.sh
```
to Run it
```shell
./schedule_trigger.sh
```

to Schedule trigger with Cron
```shell
crontab -e
```
to insert the cron entry to run the script at your desired time.
```shell
0 19 * * * /full/path/to/schedule_trigger.sh
```
