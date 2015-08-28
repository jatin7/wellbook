create database if not exists wellbook;
use wellbook;
add jar /home/dev/wellbook/serdes/csv-serde/target/csv-serde-1.1.2-0.11.0-all.jar;

drop table if exists wellbook.tmp;
create external table if not exists wellbook.tmp(
  agency_cd string,
  site_no string,
  station_nm string,
  site_tp_cd string,
  dec_lat_va float,
  dec_long_va float,
  coord_acy_cd float,
  dec_coord_datum_cd float,
  alt_va float,
  alt_acy_va float,
  alt_datum_cd string,
  huc_cd string
)
row format serde 'com.bizo.hive.serde.csv.CSVSerde'
stored as textfile
location '/user/dev/wellbook/water_sites.csv';

drop table if exists wellbook.water_sites;
create table wellbook.water_sites like wellbook.tmp;
alter table water_sites set fileformat orc;
insert into table wellbook.water_sites select * from wellbook.tmp;
drop table wellbook.tmp;
