-- qna_reply ���̺�

-- ���̺� & ������ ����
drop table qna_reply cascade CONSTRAINTS purge;
drop SEQUENCE qna_reply_seq;

-- ���̺� ����
create table qna_reply (
    rno number primary key,
    no number REFERENCES qna(no) not null,
    content varchar2(600) not null,
    id varchar2(20) REFERENCES member(id) not null,
    writeDate date default sysdate
);

-- ������ ����
create SEQUENCE qna_reply_seq;