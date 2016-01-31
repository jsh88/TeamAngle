select a.sid, a.serial# 
from v$session a, v$lock b, dba_objects c
where a.sid=b.sid and 
b.id1=c.object_id and 
b.type='TM';
alter system kill session '240, 15078'; 

select username, account_status, lock_date from dba_users;

commit;

alter table postcontent drop (state);

drop table postcomment;
drop table postrecommendation;
drop table postLog;
drop table posttag;
drop table membertag;
drop table postcontent;
drop table post;
drop table member;
drop table tag;

drop sequence post_seq;
drop sequence com_seq;

select table_name from tabs;

create table member(
  id varchar2(90) constraint mem_pk primary key,
  pw varchar2(50) not null,
  nickname varchar2(30) not null,
  jdate date default sysdate not null,
  ldate date default sysdate not null,
  vcount number default 0 not null,
  state char(1) default 0 not null,
  image varchar2(1000) default null,
  pcomment varchar2(100) default null
);

create table post(
  pno number constraint post_pk primary key,
  id varchar2(90) constraint post_mem_fk references member(id) on delete set null,
  title varchar2(500) not null,
  mpage number not null,
  wdate date default sysdate not null,
  mdate date default sysdate not null,
  tdate date default sysdate,
  good number default 0 not null,
  count number default 0 not null,
  state char(1) default 0 not null
);

create table postComment(
  cno number constraint com_pk primary key,
  page number not null,
  pno number not null,
  id varchar2(90) constraint com_mem_fk references member(id) on delete cascade not null,
  content varchar2(1000) not null,
  wdate date default sysdate not null,
  mdate date default sysdate not null,
  media varchar2(1000),
  constraint com_pContent_fk foreign key (pno, page) references postContent(pno, page) on delete cascade
);

create table postContent(
  pno number constraint pContent_post_fk references post(pno) on delete cascade not null,
  page number not null,
  content varchar2(4000) not null,
  media varchar2(1000),
  constraint pContent_pk primary key(pno, page)
);

create table postLog(
  pno number constraint pLog_post_fk references post(pno) on delete cascade not null,
  id varchar2(90) constraint pLog_member_fk references member(id) on delete cascade not null,
  count number not null,
  rdate date default sysdate not null
);

create table tag(
  tag varchar2(500) constraint tag_pk primary key,
  count number default 0 not null,
  weigh number default 0 not null,
  fdate date default sysdate not null,
  rdate date default sysdate not null
);

create table postTag(
  pno number constraint pTag_post_fk references post(pno) on delete cascade not null,
  tag varchar2(500) constraint pTag_tag_fk references tag(tag) on delete cascade not null,
  count number default 0 not null,
  weight number default 0 not null,
  fdate date default sysdate not null,
  rdate date default sysdate not null,
  constraint pTag_pk primary key(pno, tag)
);

create table memberTag(
  id varchar2(90) constraint mTag_mem_fk references member(id) on delete cascade not null,
  tag varchar2(500) constraint mTag_tag_fk references tag(tag) on delete cascade not null,
  count number default 0 not null,
  weight number default 0 not null,
  fdate date default sysdate not null,
  rdate date default sysdate not null,
  constraint mTag_pk primary key(id, tag)
);

select * from member;

create table postRecommendation(
  id varchar2(90) constraint pRecom_mem_fk references member(id) on delete set null,
  pno number constraint pRecom_post_fk references post(pno) on delete cascade not null,
  constraint pRecom_pk primary key(id, pno)
);

create sequence post_seq
start with 1
increment by 1;

create sequence com_seq
start with 1
increment by 1;