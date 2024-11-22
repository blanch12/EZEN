-- << 장바구니 >> --
-- 제거
drop table cart CASCADE CONSTRAINTS;
drop SEQUENCE cart_seq;

-- 생성
create table cart(
    CARTNO number primary key, -- 글번호 - 시퀀스 사용
    ID  VARCHAR2(20) references member(id) on delete CASCADE not null, -- 회원아이디 - 등록 시 회원만 가능. 데이터 가져올 때 회원정보 가져 올수 있다.
    GOODSNO number references GOODS(GOODS_NO) not null, -- 상품번호
    GOODSNAME VARCHAR2(300) not null, -- 내용
    IMAGENAME VARCHAR2(300) not null,
    QUANTITY number(3) not null,
    DELIVERYCHARGE number(6) not null,
    SALEPRICE number(9) not null
);

create SEQUENCE cart_seq;

commit;