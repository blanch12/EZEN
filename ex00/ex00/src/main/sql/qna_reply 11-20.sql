-- qna_reply 테이블

-- 테이블 & 시퀀스 제거
drop table qna_reply cascade CONSTRAINTS purge;
drop SEQUENCE qna_reply_seq;

-- 테이블 생성
create table qna_reply (
    rno number primary key,
    no number REFERENCES qna(no) not null,
    content varchar2(600) not null,
    id varchar2(20) REFERENCES member(id) on delete CASCADE not null,
    writeDate date default sysdate
);

-- 시퀀스 생성
create SEQUENCE qna_reply_seq;

insert into qna_reply(rno, no, content, id, writeDate)
values(qna_reply_seq.nextval, 1, '답글테스트', 'admin', '2024-11-11');
commit;

select * from qna_reply;
