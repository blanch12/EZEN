-- faq 테이블

-- 테이블 & 시퀀스 제거
drop table faq cascade CONSTRAINTS purge;
drop SEQUENCE faq_seq;

-- 테이블 생성
create table faq (
    no number primary key,
    question VARCHAR2(300) not null,
    answer varchar2(2000) not null
);

-- 시퀀스 생성
create SEQUENCE faq_seq;

-- 샘플 데이터
insert into faq (no, question, answer)
values (faq_seq.nextval, '환불 및 교환', '상품 개봉 시 교환만 가능 / 상품 사용 시 교환 불가 / 단순 변심 환불 불가');
select * from faq;