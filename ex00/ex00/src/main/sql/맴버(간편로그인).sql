ALTER TABLE member ADD photo VARCHAR2(255);ALTER TABLE member ADD photo VARCHAR2(255);
ALTER TABLE member ADD loginType VARCHAR2(50);
ALTER TABLE member MODIFY gender VARCHAR2(10);
ALTER TABLE member MODIFY id VARCHAR2(50);
select * from member;
commit;