-- ȸ�� ���̺�

-- ����
drop table member cascade CONSTRAINTS purge;
drop table grade CASCADE CONSTRAINTS purge;

-- ���̺� ����
-- grade ���̺�
create table grade (
    gradeNo number(1) primary key,
    gradeName varchar2(21) not null
);

-- member ���̺�
create table member (
    id varchar2(30) primary key, --���̵�
    pw varchar2(30) not null, -- ��й�ȣ
    name varchar2(30) not null, -- �̸�
    gender varchar(6) not null, -- ����
    birth date not null, -- ����
    tel varchar2(13), -- ��ȭ��ȣ
    email varchar2(50) not null, -- �̸���
    regDate date default sysdate, -- ������
    conDate date default sysdate, -- �ֱ�������
    status varchar2(12) default 'Ȱ��ȭ', -- ȸ������
    
    -- grade ���̺��� ������ gradeNo(��޹�ȣ)
    gradeNo number(1) default 1 REFERENCES grade(gradeNo)
);

-- ���õ����� ( 1 : �Ϲ�ȸ�� / 0 : ������)
insert into grade values (1, '�Ϲ�ȸ��');
insert into grade values (0,'������');
select * from grade;

-- ���õ����� (member�� �Ϲ�ȸ���� ������ 1���� ����)
insert into member (id, pw, name, gender, birth, tel, email, gradeNo)
values ('admin', 'admin', '������', '����', '1997-02-28', '010-7378-7505' ,'zero655630@gmail.com', 0);
insert into member (id, pw, name, gender, birth, tel, email, gradeNo)
values ('test1', 'test1', '�׽���1', '����', '2000-11-05', '010-1234-5678','sample@gmail.com', 1);
select * from member;

commit;