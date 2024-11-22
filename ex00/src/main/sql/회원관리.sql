-- 회원등급 및 회원

-- 1. 객체제거
-- pk로 저장되어있는 테이블을 먼저 제거하고, pk를 제거합니다
drop table member cascade CONSTRAINTS purge;
drop table grade CASCADE CONSTRAINTS purge;

-- 2. 객체생성
-- PK부터 생성, FK는 pk생성후
create table grade (
    gradeNo number(1) primary key,
    gradeName varchar2(21) not null
);

-- member table
create table member (
    id varchar2(30) primary key,
    pw varchar2(30) not null,
    name varchar2(30) not null,
    gender varchar(6) not null,
    birth date not null,
    tel varchar2(13),
    email varchar2(50) not null,
    regDate date default sysdate,
    conDate date default sysdate,
    status varchar2(6) default '정상',
    photo varchar2(100),
    newMsgCnt number default 0,
    -- FK에서 references 를 이용해 연결될 값 저장 : 테이블(칼럼)
    gradeNo number(1) default 1 REFERENCES grade(gradeNo)
);

-- sample 데이터 : grade table
insert into grade values (1, '일반회원');
insert into grade values (9,'관리자');
select * from grade;

-- sample 데이터 : member table
insert into member (id, pw, name, gender, birth, email, gradeNo)
values ('admin', 'admin', '관리자', '여자', '1975-04-13', 'asdasd@gmail.com', 9);
insert into member (id, pw, name, gender, birth, email, gradeNo)
values ('test1', 'test1', '테스터1', '남자', '2000-12-05', 'zxczxc@gmail.com', 1);
select * from member;

commit;