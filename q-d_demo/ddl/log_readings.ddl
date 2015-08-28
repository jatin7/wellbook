create database if not exists wellbook;
use wellbook;
add jar /home/dev/wellbook/serdes/csv-serde/target/csv-serde-1.1.2-0.11.0-all.jar;

drop table if exists wellbook.log_readings;
create external table if not exists wellbook.log_readings(
  filename string,
  file_no int,
  log_name string,
  step_type string,
  step double,
  mnemonic string,
  uom string,
  reading double
)
row format serde 'com.bizo.hive.serde.csv.CSVSerde'
stored as textfile
location '/user/dev/wellbook/log_readings.csv';

drop table if exists wellbook.log_readings;
create table wellbook.log_readings like wellbook.tmp;
alter table log_readings set fileformat orc;
insert into table wellbook.log_readings select * from wellbook.tmp;
drop table wellbook.tmp;
