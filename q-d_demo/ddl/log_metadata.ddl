create database if not exists wellbook;
use wellbook;
add jar /home/dev/wellbook/serdes/csv-serde/target/csv-serde-1.1.2-0.11.0-all.jar;

drop table if exists wellbook.log_metadata;
create external table if not exists wellbook.log_metadata(
  filename string,
  file_no int,
  log_name string,
  block string,
  mnemonic string,
  uom string,
  description string
)
row format serde 'com.bizo.hive.serde.csv.CSVSerde'
stored as textfile
location '/user/dev/wellbook/las_metadata/';

drop table if exists wellbook.log_metadata;
create table wellbook.wells like wellbook.tmp;
alter table wells set fileformat orc;
insert into table wellbook.log_metadata select * from wellbook.tmp;
drop table wellbook.tmp;
