-- 회원 테이블

-- 제거
drop table member cascade CONSTRAINTS purge;
drop table grade CASCADE CONSTRAINTS purge;

-- 테이블 생성
-- grade 테이블
create table grade (
    gradeNo number(1) primary key,
    gradeName varchar2(21) not null
);

-- member 테이블
create table member (
    id varchar2(30) primary key, --아이디
    pw varchar2(30) not null, -- 비밀번호
    name varchar2(30) not null, -- 이름
    gender varchar(6) not null, -- 성별
    birth date not null, -- 생일
    tel varchar2(13), -- 전화번호
    email varchar2(50) not null, -- 이메일
    regDate date default sysdate, -- 가입일
    conDate date default sysdate, -- 최근접속일
    status varchar2(12) default '활성화', -- 회원상태
    
    -- grade 테이블에서 가져올 gradeNo(등급번호)
    gradeNo number(1) default 1 REFERENCES grade(gradeNo)
);

-- 샘플데이터 ( 1 : 일반회원 / 0 : 관리자)
insert into grade values (1, '일반회원');
insert into grade values (0,'관리자');
select * from grade;

-- 샘플데이터 (member에 일반회원과 관리자 1개씩 생성)
insert into member (id, pw, name, gender, birth, tel, email, gradeNo)
values ('admin', 'admin', '관리자', '남자', '1997-02-28', '010-7378-7505' ,'zero655630@gmail.com', 0);
insert into member (id, pw, name, gender, birth, tel, email, gradeNo)
values ('test1', 'test1', '테스터1', '여자', '2000-11-05', '010-1234-5678','sample@gmail.com', 1);
select * from member;

commit;