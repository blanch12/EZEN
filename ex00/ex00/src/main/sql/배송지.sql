-- 시퀀스 생성
CREATE SEQUENCE addr_seq START WITH 1 INCREMENT BY 1;

-- addr 테이블 생성
CREATE TABLE addr (
    id NUMBER PRIMARY KEY,              -- 주소 고유 ID
    memberId VARCHAR2(50) NOT NULL,     -- 회원 ID (외래 키, 회원 테이블과 연관)
    addr VARCHAR2(255) NOT NULL,        -- 주소
    addrDetail VARCHAR2(255),           -- 상세 주소
    postalCode VARCHAR2(20),            -- 우편번호 
    addrName VARCHAR(100),              -- 배송지명
    fullAddr VARCHAR(300),              -- 주소 + 상세주소
    RECIPIENT_NAME VARCHAR2(50),        -- 수령인
    PHONE_NUMBER VARCHAR2(20),          -- 전화번호
    isDefault CHAR(1) DEFAULT 'N' CHECK (isDefault IN ('Y', 'N')) -- 기본 배송지 여부 (Y 또는 N)

);

-- 트리거 생성
CREATE TRIGGER addr_before_insert
BEFORE INSERT ON addr
FOR EACH ROW
BEGIN
    :NEW.id := addr_seq.NEXTVAL;
END;
/

-- 회원 테이블과의 외래 키 설정 (회원 테이블의 ID 필드가 'memberId' 필드로 매핑된다고 가정)
ALTER TABLE addr
ADD CONSTRAINT fk_member_id FOREIGN KEY (memberId) REFERENCES member(id) ON DELETE CASCADE;

CREATE SEQUENCE SEQ_ADDR
START WITH 1     -- 시작 번호
INCREMENT BY 1   -- 증가 값
NOCACHE          -- 시퀀스 값을 캐시하지 않음 (선택 사항)
NOCYCLE;         -- 시퀀스가 끝에 도달했을 때 다시 시작하지 않음

select * from addr;

commit;
