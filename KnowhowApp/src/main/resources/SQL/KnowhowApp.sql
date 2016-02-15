select a.sid, a.serial# 
from v$session a, v$lock b, dba_objects c
where a.sid=b.sid and 
b.id1=c.object_id and 
b.type='TM';
alter system kill session '255, 10213'; 

select username, account_status, lock_date from dba_users;

commit;
select * from post;
update member set image = 'test.gif' where id = 'test';
delete from post where pno = 10;

select * from postTag order by count desc;

select pt.*, nickname from (select row_number() over (order by pt.count desc) no, p.*, m.nickname from post p, postTag pt, member m where (p.pno = pt.pno and m.id = p.id)) pt where title like '%포스팅%';
select row_number() over (order by pt.count desc) no, p.* from post p, postTag pt where tag = '청춘';
select * from postTag pt, post p where p.pno = pt.pno order by pt.count desc;
select * from post;
select * from posttag;

-- 검색 = 타이틀 word > 타이틀 tag > 태그 tags > 태그 tag > 없습니다.
-- 타이틀 word, 타이틀 tag
select t.*, m.nickname from (select row_number() over (order by p.good desc) no, p.* from post p where title like '%포스트%') t, member m where m.id = t.id;
-- 태그 tags, 태그 tag
select no, p.*, m.nickname from (select row_number() over (order by pt.count desc) no, pt.* from postTag pt where tag = '청춘') t, post p, member m where t.pno = p.pno and m.id = p.id;

select row_number() over (order by pt.count desc) no, pt.* from postTag pt where tag = '청춘';
select row_number() over (order by pt.count desc) no, p.*, pt.* from post p, postTag pt where p.pno = pt.pno and pt.tag in ('청춘', '인생');
select pt.*, m.nickname from (select row_number() over (order by count desc) no, p.* from post p where title like '%포스트%') pt, member m where no = 1 and pt.state = 1 and m.id = pt.id;
select pt.*, m.nickname from (select row_number() over (order by count desc) no, p.* from post p) pt, member m where no = 1 and m.id = pt.id and pt.state = 1 and title like '%포스트%';

select pt.*, m.nickname from (select row_number() over (order by wdate desc) no, p.* from post p where p.state = 1) pt, member m where no = 2 and m.id = pt.id;

select * from post order by wdate desc;
update post set state = 0 where pno = 64;
delete from post where state = 0;
commit;

alter table tag nologging;
alter table posttag nologging;
alter table membertag nologging;
alter table tag logging;
alter session set db_file_multiblock_read_count = 128;

select * from post;
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

delete from postcontent;
delete from post where pno = 2;
delete from tag;
delete from posttag;
rollback;
commit;

update postComment set content = '댓글4' where pno = 660 and page = 3;

select * from tag where tag = '바보';
select * from posttag where tag = '바보';
select * from posttag where pno > 811 order by rdate desc;
select * from posttag order by rdate desc;
select * from post;
select * from tag where tag = '찬중이형바보';
select * from postContent;
delete from post where pno = 24;
delete from post where pno > 25;
commit;
rollback;



select * from postContent where page > 8; -- 549번
select * from post;
update post set state = 1;
select * from postrecommendation;

select pt.*, m.nickname from (select row_number() over (order by wdate desc) no, p.* from post p) pt, member m where no = 5 and m.id = pt.id;
select content, media from postContent where pno = 47 and page = 0;
select * from postContent where pno = 47;

select * from postContent where pno = 660;
select * from post where pno = 660;
select * from post order by wdate desc;

update postContent set media = 'undefined' where pno = 652 and page = 0;
commit;

select p.*, m.id, m.nickName, m.image from postComment p, member m where pno = 659 and page = 0 and p.id = m.id order by wdate asc;

select * from posttag where pno = 572 order by rdate desc;
select * from postcontent where pno = 660;
select * from postcomment where pno = 660;

select * from postcontent;
select * from tag order by count desc;
select * from postcomment order by pno;
select page from postcomment group by page;
select pno, count(*) from postcomment group by pno order by pno;

select rownum, p.* from post p order by wdate desc;
--
select pt.*, m.nickname from (select row_number() over (order by wdate desc) no, p.* from post p) pt, member m where no = 1 and m.id = pt.id;
select * from postlog;
--
select * from tag order by rdate desc;
select * from posttag order by rdate;
select * from tag where tag = '바보';
select * from postTag where tag = '바보';
update posttag set count = count + 1, rdate = sysdate where pno = 29 and tag = '바보';
update posttag set count = count + 1, rdate = sysdate where tag = '바보' and pno = 29;

-- Trigger
create or replace trigger postTag_trg
before insert or update on postTag
for each row
begin
if inserting then
  insert into tag values(:new.tag, 1, 0, sysdate, sysdate);
elsif updating then
  update tag set count = count + 1, rdate = sysdate where tag = :new.tag;
end if;
exception
  when others then
    update tag set count = count + 1, rdate = sysdate where tag = :new.tag;
end postTag_trg;
/

create or replace trigger memberTag_trg
before insert or update on memberTag
for each row
begin
if inserting then
  insert into tag values(:new.tag, 1, 0, sysdate, sysdate);
elsif updating then
  update tag set count = count + 1, rdate = sysdate where tag = :new.tag;
end if;
exception
  when others then
    update tag set count = count + 1, rdate = sysdate where tag = :new.tag;
end memberTag_trg;
/

select * from post order by wdate desc;

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

select * from postContent pc, post p where p.pno = pc.pno order by wdate desc;
select * from member;
insert into member values('test', '1', 'test', sysdate, sysdate, 0, 0, 'test.gif', '테스트 접속');
commit;

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

delete from post;
commit;

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

select * from postComment;

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
  rdate date default sysdate not null,
  constraint pLog_pk primary key (pno, id)
);

create table tag(
  tag varchar2(500) constraint tag_pk primary key,
  count number default 0 not null,
  weight number default 0 not null,
  fdate date default sysdate not null,
  rdate date default sysdate not null
);

alter table tag rename column weigh to weight;

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
  id varchar2(90) constraint pRecom_mem_fk references member(id) on delete cascade not null,
  pno number constraint pRecom_post_fk references post(pno) on delete cascade not null,
  constraint pRecom_pk primary key(id, pno)
);

drop table postRecommendation;

create sequence post_seq
start with 1
increment by 1;

create sequence com_seq
start with 1
increment by 1;