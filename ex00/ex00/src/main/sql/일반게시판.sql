-- 2. 테이블 생성
CREATE TABLE board (
    no NUMBER PRIMARY KEY,                  -- 글번호 (기본 키)
    title VARCHAR2(255) NOT NULL,           -- 타이틀 (글 제목)
    content CLOB NOT NULL,                  -- 컨텐츠 (글 내용)
    writer VARCHAR2(100) NOT NULL,          -- 작성자
    writedate DATE DEFAULT SYSDATE,         -- 작성일
    hit NUMBER DEFAULT 0,                   -- 조회수
    pw VARCHAR2(255) NOT NULL               -- 비밀번호 (암호화 가능)
);

-- 1. 시퀀스 생성
CREATE SEQUENCE board_seq 

commit;