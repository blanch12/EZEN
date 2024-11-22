-- 상품관리 스키마
-- 1. 객체 삭제
    -- 테이블 삭제
    -- 1-6. 상품가격
    DROP TABLE goods_price CASCADE CONSTRAINTS;
    -- 1-5. 상품이미지
    DROP TABLE goods_image CASCADE CONSTRAINTS;
    -- 1-4. 상품색상
    DROP TABLE goods_color CASCADE CONSTRAINTS;
    -- 1-3. 상품사이즈
    DROP TABLE goods_size CASCADE CONSTRAINTS;
    -- 1-2. 상품
    DROP TABLE goods CASCADE CONSTRAINTS;
    -- 1-1. 카테고리
    DROP TABLE category CASCADE CONSTRAINTS;
    
    -- 시퀀스 삭제
    DROP SEQUENCE goods_price_seq;
    DROP SEQUENCE goods_image_seq;
    DROP SEQUENCE goods_color_seq;
    DROP SEQUENCE goods_size_seq;
    DROP SEQUENCE goods_seq;

-- 2. 객체 생성 (테이블 및 시퀀스)
    -- 2-1. 카테고리
    CREATE TABLE category (
        cate_code1 NUMBER(3),
        -- cate_code2 = 0 이면 대분류
        cate_code2 NUMBER(3) DEFAULT 0,
        cate_name VARCHAR2(30) NOT NULL,
        CONSTRAINT category_pk PRIMARY KEY (cate_code1, cate_code2)
    );
    -- 2-2. 상품
    CREATE TABLE goods (
        goods_no NUMBER PRIMARY KEY,
        goods_name VARCHAR2(300) NOT NULL,
        cate_code1 NUMBER(3) NOT NULL,
        cate_code2 NUMBER(3) NOT NULL,
        image_name VARCHAR2(300) NOT NULL,
        content VARCHAR2(2000),
        company VARCHAR2(60) NOT NULL,
        product_date DATE,
        CONSTRAINT goods_fk FOREIGN KEY (cate_code1, cate_code2)
        REFERENCES category(cate_code1, cate_code2)
    );
    -- 2-3. 상품사이즈
    CREATE TABLE goods_size (
        goods_size_no NUMBER PRIMARY KEY,
        size_name VARCHAR2(30) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-4. 상품색상
    CREATE TABLE goods_color (
        goods_color_no NUMBER PRIMARY KEY,
        color_name VARCHAR2(30) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-5. 상품이미지
    CREATE TABLE goods_image (
        goods_image_no NUMBER PRIMARY KEY,
        image_name VARCHAR2(300) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-6. 상품가격
    CREATE TABLE goods_price (
        goods_price_no NUMBER PRIMARY KEY,
        price NUMBER(9) NOT NULL,
        discount NUMBER(9) DEFAULT 0,
        discount_rate NUMBER(3) DEFAULT 0,
        sale_price NUMBER(9) NOT NULL,
        saved_rate NUMBER(3) DEFAULT 0,
        delivery_charge NUMBER(6) DEFAULT 0,
        sale_start_date DATE DEFAULT sysdate,
        sale_end_date DATE DEFAULT '9999-12-31',
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    
    // 시퀀스 생성
    CREATE SEQUENCE goods_seq;
    CREATE SEQUENCE goods_size_seq;
    CREATE SEQUENCE goods_color_seq;
    CREATE SEQUENCE goods_image_seq;
    CREATE SEQUENCE goods_price_seq;

-- 3. 샘플 데이터 추가

    
 
    -- 상품사이즈
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES (goods_size_seq.nextval, 'S', 1);
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES (goods_size_seq.nextval, 'M', 1);
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES (goods_size_seq.nextval, 'L', 1);
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES (goods_size_seq.nextval, 'XL', 1);
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES (goods_size_seq.nextval, 'XXL', 1);
    commit; 
    select * from goods_size;
    
    -- 상품컬러
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES (goods_color_seq.nextval, 'BLACK', 1);
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES (goods_color_seq.nextval, 'GRAY', 1);
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES (goods_color_seq.nextval, 'NAVY', 1);
    commit;
    select * from goods_color;
    
    -- 상품가격
    -- 같은 상품에서 판매기간이 겹치면 안된다.
    -- 현재날짜 (판매중) : 1개
    INSERT INTO goods_price(goods_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-20', '2024-10-31', 1);
    -- 지난가격 (여러개) - 판매일은 겹치면 안된다.
    INSERT INTO goods_price(goods_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-11', '2024-10-19', 1);
    INSERT INTO goods_price(goods_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-03', '2024-10-10', 1);
    -- 예약가격 (여러개가능)
    INSERT INTO goods_price(goods_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 100000, 10000, 0, 90000, 0, 0,
        '2024-11-01', '2024-11-10', 1);
    INSERT INTO goods_price(goods_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 100000, 0, 50, 50000, 0, 0,
        '2024-11-11', '2024-12-31', 1);
    commit;
    select * from goods_price;
    
    









