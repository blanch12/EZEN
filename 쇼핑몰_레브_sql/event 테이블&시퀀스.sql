-- event ���̺�

-- ����
drop table event CASCADE CONSTRAINTS purge;
drop SEQUENCE event_seq;

-- ���̺� ����
create table event (
    no number primary key,
    title varchar2(300) not null,
    content varchar2(2000) not null,
    filename VARCHAR2(300),
    startDate date default sysdate,
    endDate date default '9999-12-31',
    writeDate date default sysdate
);

-- ����������
create SEQUENCE event_seq;

-- sample ������
-- �������
insert into event ( no, title, content, filename, startDate, endDate)
values (event_seq.nextval,'�����̺�Ʈ ����', '�����̺�Ʈ ���� ����', 'pre_sample.jpg',
'2024-07-22','2024-12-31');

-- ��������
insert into event ( no, title, content, filename,startDate, endDate)
values (event_seq.nextval,'�����̺�Ʈ ����', '�����̺�Ʈ ���� ����', 'pas_sample.jpg',
'2024-07-22','2024-07-31');

--��������
insert into event ( no, title, content,filename, startDate, endDate)
values (event_seq.nextval,'�����̺�Ʈ ����', '�����̺�Ʈ ���� ����', 'fut_sample.jpg',
'2024-12-14','2024-12-31');
commit;
select * from event;
