drop SEQUENCE usercomment_seq;
drop table usercomment;

create SEQUENCE usercomment_seq;
create table usercomment
(
	num number primary key,
	name varchar2(20) not null,
	text varchar2(30) not null
);