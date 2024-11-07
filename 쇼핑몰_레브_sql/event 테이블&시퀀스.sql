-- event 테이블

-- 제거
drop table event CASCADE CONSTRAINTS purge;
drop SEQUENCE event_seq;

-- 테이블 생성
create table event (
    no number primary key,
    title varchar2(300) not null,
    content varchar2(2000) not null,
    filename VARCHAR2(300),
    startDate date default sysdate,
    endDate date default '9999-12-31',
    writeDate date default sysdate
);

-- 시퀀스생성
create SEQUENCE event_seq;

-- sample 데이터
-- 현재공지
insert into event ( no, title, content, filename, startDate, endDate)
values (event_seq.nextval,'현재이벤트 샘플', '현재이벤트 샘플 내용', 'pre_sample.jpg',
'2024-07-22','2024-12-31');

-- 지난공지
insert into event ( no, title, content, filename,startDate, endDate)
values (event_seq.nextval,'지난이벤트 샘플', '지난이벤트 샘플 내용', 'pas_sample.jpg',
'2024-07-22','2024-07-31');

--예정공지
insert into event ( no, title, content,filename, startDate, endDate)
values (event_seq.nextval,'예정이벤트 샘플', '예정이벤트 샘플 내용', 'fut_sample.jpg',
'2024-12-14','2024-12-31');
commit;
select * from event;
