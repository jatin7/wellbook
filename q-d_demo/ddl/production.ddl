create database if not exists wellbook;
use wellbook;
add jar /home/dev/wellbook/serdes/csv-serde/target/csv-serde-1.1.2-0.11.0-all.jar;

drop table if exists wellbook.production;
create external table if not exists wellbook.production(
 file_no int,
 perfs string,
 spacing string,
 total_depth double,
 pool string,
 date string,
 days int,
 bbls_oil double,
 runs double,
 bbls_water double,
 mcf_prod double,
 mcf_sold double,
 vent_flare double
)
row format serde 'com.bizo.hive.serde.csv.CSVSerde'
stored as textfile
location '/user/dev/wellbook/production/';

drop table if exists wellbook.production;
create table wellbook.productions like wellbook.tmp;
alter table production set fileformat orc;
insert into table wellbook.production select * from wellbook.tmp;
drop table wellbook.tmp;
