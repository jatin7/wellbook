use wellbook;
add jar /home/dev/wellbook/serdes/csv-serde/target/csv-serde-1.1.2-0.11.0-all.jar;

drop table if exists wellbook.tmp;
create external table if not exists wellbook.tmp(
  date string,
  lease_no string,
  township string,
  range string,
  section string,
  description string,
  bidder string,
  acres double,
  bonus_per_acre double
)
row format serde 'com.bizo.hive.serde.csv.CSVSerde'
stored as textfile
location '/user/dev/wellbook/auctions.csv';

drop table if exists wellbook.auctions;
create table wellbook.auctions like wellbook.tmp;
alter table auctions set fileformat orc;
insert into table wellbook.auctions select * from wellbook.tmp;
drop table wellbook.tmp;
