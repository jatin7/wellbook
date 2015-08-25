use wellbook;
add jar /home/dev/wellbook/serdes/csv-serde/target/csv-serde-1.1.2-0.11.0-all.jar;

drop table if exists wellbook.tmp;
create external table if not exists wellbook.tmp(
  file_no int,
  uic_number string,
  pool string,
  date string,
  eor_bbls_injected double,
  eor_mcf_injected double,
  bbls_salt_water_disposed double,
  average_psi double
)
row format serde 'com.bizo.hive.serde.csv.CSVSerde'
stored as textfile
location '/user/dev/wellbook/injections/';

drop table if exists wellbook.injections;
create table wellbook.injections like wellbook.tmp;
alter table injections set fileformat orc;
insert into table wellbook.injections select * from wellbook.tmp;
drop table wellbook.tmp;
