-- faq ���̺�

-- ���̺� & ������ ����
drop table faq cascade CONSTRAINTS purge;
drop SEQUENCE faq_seq;

-- ���̺� ����
create table faq (
    no number primary key,
    question VARCHAR2(300) not null,
    answer varchar2(2000) not null
);

-- ������ ����
create SEQUENCE faq_seq;

-- ���� ������
insert into faq (no, question, answer)
values (faq_seq.nextval, 'ȯ�� �� ��ȯ', '��ǰ ���� �� ��ȯ�� ���� / ��ǰ ��� �� ��ȯ �Ұ� / �ܼ� ���� ȯ�� �Ұ�');
select * from faq;