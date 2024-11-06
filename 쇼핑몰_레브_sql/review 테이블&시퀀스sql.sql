-- review 테이블

-- 테이블 & 시퀀스 제거
drop table review cascade CONSTRAINTS purge;
drop SEQUENCE review_seq;

-- 테이블 생성
create table review (
    rno number primary key,
    no number REFERENCES goods(goods_no) not null,
    content varchar2(600) not null,
    id varchar2(20) REFERENCES member(id) not null,
    filename VARCHAR2(300),
    writeDate date default sysdate,
    stars number(1) not null
);

-- 시퀀스 생성
create SEQUENCE review_seq;