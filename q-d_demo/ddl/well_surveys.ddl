create database if not exists wellbook;
use wellbook;
add jar /home/dev/wellbook/serdes/csv-serde/target/csv-serde-1.1.2-0.11.0-all.jar;

drop table if exists wellbook.well_surveys;
create external table if not exists wellbook.well_surveys(
 api_no string,
 file_no int,
 leg string,
 md double,
 inc double,
 azimuth double,
 tvd double,
 ft_ns double,
 ns string,
 ft_ew double,
 ew string,
 latitude double,
 longitude double
)
row format serde 'com.bizo.hive.serde.csv.CSVSerde'
stored as textfile
location '/user/dev/wellbook/well_surveys.csv';

drop table if exists wellbook.well_surveys;
create table wellbook.well_surveys like wellbook.tmp;
alter table well_surveys set fileformat orc;
insert into table wellbook.well_surveys select * from wellbook.tmp;
drop table wellbook.tmp;
