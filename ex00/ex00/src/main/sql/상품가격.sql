

-- 2. price 테이블 생성
CREATE TABLE price (
    pno NUMBER PRIMARY KEY,    -- 가격 번호 (기본 키, 시퀀스로 자동 증가)
    gno NUMBER NOT NULL,                                 -- 상품 번호
    std_price NUMBER NOT NULL,                           -- 기본 가격
    discount NUMBER DEFAULT 0,                           -- 할인 금액
    rate NUMBER DEFAULT 0,                               -- 할인율
    startDate DATE DEFAULT SYSDATE,                      -- 시작 날짜, 기본값 SYSDATE
    endDate DATE DEFAULT TO_DATE('9999-12-31', 'YYYY-MM-DD') -- 종료 날짜, 기본값 '9999-12-31'
);

-- 1. 시퀀스 생성
CREATE SEQUENCE price_seq;



commit;
