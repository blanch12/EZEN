

-- 2. message 테이블 생성
CREATE TABLE message (
    no NUMBER PRIMARY KEY,     -- 메시지 번호 (기본 키, 시퀀스로 자동 증가)
    content VARCHAR2(2000) NOT NULL,                                 -- 메시지 내용
    senderid VARCHAR2(100) NOT NULL,                       -- 보낸 사람 ID
    senddate DATE DEFAULT SYSDATE,                         -- 발송 날짜, 기본값 SYSDATE
    accepterid VARCHAR2(100),                              -- 수신자 ID
    acceptdate DATE ,                       -- 수신 날짜, 기본값 SYSDATE
    alluser NUMBER(1) DEFAULT 0 CHECK (alluser IN (0, 1))  -- 모든 사용자 대상 여부 (1 = 예, 0 = 아니오), 기본값 0
);

-- 1. 시퀀스 생성
CREATE SEQUENCE message_seq;

commit;