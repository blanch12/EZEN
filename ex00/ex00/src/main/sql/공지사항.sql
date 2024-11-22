-- 공지사항

-- 1. 객체제거
drop table notice CASCADE CONSTRAINTS purge;
drop SEQUENCE notice_seq;

create table notice (
    no number primary key,
    title varchar2(300) not null,
    content varchar2(2000) not null,
    startDate date default sysdate,
    endDate date default '9999-12-31',
    writeDate date default sysdate,
    updateDate date default sysdate
);

create SEQUENCE notice_seq;

-- sample 데이터
-- 현재공지
insert into notice ( no, title, content, startDate, endDate)
values (notice_seq.nextval, '프로젝트기반 생성형 챗봇', '자바, 오라클, 프린트...',
'2024-07-22','2024-12-31');

-- 지난공지
insert into notice ( no, title, content, startDate, endDate)
values (notice_seq.nextval, '프로젝트기반 과정', '모집완료',
'2024-07-22','2024-07-31');

--예정공지
insert into notice ( no, title, content, startDate, endDate)
values (notice_seq.nextval, '프로젝트기반 과정 입니다.', '프런트 공부 예정입니다.',
'2024-08-14','2024-12-31');

select * from notice;