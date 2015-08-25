create database if not exists wellbook;
use wellbook;
add jar /home/dev/wellbook/serdes/csv-serde/target/csv-serde-1.1.2-0.11.0-all.jar;

drop table if exists wellbook.scout_tickets;
create external table if not exists wellbook.scout_tickets(
  file_no int,
  link string
)
row format serde 'com.bizo.hive.serde.csv.CSVSerde'
stored as textfile
location '/user/dev/wellbook/scout_tickets/';

drop table if exists wellbook.scout_tickets;
create table wellbook.scout_tickets like wellbook.tmp;
alter table scout_tickets set fileformat orc;
insert into table wellbook.scout_tickets select * from wellbook.tmp;
drop table wellbook.tmp;
