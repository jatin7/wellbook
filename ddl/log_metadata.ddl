create database if not exists wellbook;
use wellbook;

drop table if exists wellbook.tmp;
create external table if not exists wellbook.tmp(
  file_name string,
  file_no int,
  log_name string,
  metadata string
)
row format delimited fields terminated by '\t'
lines terminated by '\n';
