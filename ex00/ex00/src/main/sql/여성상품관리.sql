-- 상품관리 스키마
-- 1. 객체 삭제
    -- 테이블 삭제
    -- 1-6. 상품가격
    DROP TABLE woman_price CASCADE CONSTRAINTS;
    -- 1-5. 상품이미지
    DROP TABLE woman_image CASCADE CONSTRAINTS;
    -- 1-4. 상품색상
    DROP TABLE woman_color CASCADE CONSTRAINTS;
    -- 1-3. 상품사이즈
    DROP TABLE woman_size CASCADE CONSTRAINTS;
    -- 1-2. 상품
    DROP TABLE woman CASCADE CONSTRAINTS;
    -- 1-1. 카테고리
    DROP TABLE woman_category CASCADE CONSTRAINTS;
    
    -- 시퀀스 삭제
    DROP SEQUENCE woman_price_seq;
    DROP SEQUENCE woman_image_seq;
    DROP SEQUENCE woman_color_seq;
    DROP SEQUENCE woman_size_seq;
    DROP SEQUENCE woman_seq;

-- 2. 객체 생성 (테이블 및 시퀀스)
    -- 2-1. 카테고리
    CREATE TABLE woman_category (
        woman_cate_code1 NUMBER(3),
        -- cate_code2 = 0 이면 대분류
        woman_cate_code2 NUMBER(3) DEFAULT 0,
        woman_cate_name VARCHAR2(30) NOT NULL,
        CONSTRAINT woman_category_pk PRIMARY KEY (woman_cate_code1, woman_cate_code2)
    );
    -- 2-2. 상품
    CREATE TABLE woman (
        woman_no NUMBER PRIMARY KEY,
        woman_name VARCHAR2(300) NOT NULL,
        woman_cate_code1 NUMBER(3) NOT NULL,
        woman_cate_code2 NUMBER(3) NOT NULL,
        woman_image_name VARCHAR2(300) NOT NULL,
        content VARCHAR2(2000),
        company VARCHAR2(60) NOT NULL,
        product_date DATE,
        CONSTRAINT woman_fk FOREIGN KEY (woman_cate_code1, woman_cate_code2)
        REFERENCES woman_category(woman_cate_code1, woman_cate_code2)
    );
    -- 2-3. 상품사이즈
    CREATE TABLE woman_size (
        woman_size_no NUMBER PRIMARY KEY,
        woman_size_name VARCHAR2(30) NOT NULL,
        woman_no NUMBER REFERENCES woman(woman_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-4. 상품색상
    CREATE TABLE woman_color (
        woman_color_no NUMBER PRIMARY KEY,
        woman_color_name VARCHAR2(30) NOT NULL,
        woman_no NUMBER REFERENCES woman(woman_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-5. 상품이미지
    CREATE TABLE woman_image (
        woman_image_no NUMBER PRIMARY KEY,
        woman_image_name VARCHAR2(300) NOT NULL,
        woman_no NUMBER REFERENCES woman(woman_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-6. 상품가격
    CREATE TABLE woman_price (
        woman_price_no NUMBER PRIMARY KEY,
        price NUMBER(9) NOT NULL,
        discount NUMBER(9) DEFAULT 0,
        discount_rate NUMBER(3) DEFAULT 0,
        sale_price NUMBER(9) NOT NULL,
        saved_rate NUMBER(3) DEFAULT 0,
        delivery_charge NUMBER(6) DEFAULT 0,
        sale_start_date DATE DEFAULT sysdate,
        sale_end_date DATE DEFAULT '9999-12-31',
        woman_no NUMBER REFERENCES woman(woman_no) ON DELETE CASCADE NOT NULL
    );
    
    // 시퀀스 생성
    CREATE SEQUENCE woman_seq;
    CREATE SEQUENCE woman_size_seq;
    CREATE SEQUENCE woman_color_seq;
    CREATE SEQUENCE woman_image_seq;
    CREATE SEQUENCE woman_price_seq;

-- 3. 샘플 데이터 추가
    -- 3-1. 카테고리
    -- 대분류
    -- NVL(A, B) : A가 null 이면 B로 적용한다.
    INSERT INTO woman_category(woman_cate_code1, woman_cate_name)
    VALUES((select NVL(max(woman_cate_code1),0)+1 from woman_category), '의류');

    commit;
    select * from woman_category;
    
    -- 중분류
    INSERT INTO woman_category(woman_cate_code1, woman_cate_code2, woman_cate_name)
    VALUES(1,(select NVL(max(woman_cate_code2),0)+1 from woman_category), '여성복 상의');
    INSERT INTO woman_category(woman_cate_code1, woman_cate_code2, woman_cate_name)
    VALUES(1,(select NVL(max(woman_cate_code2),0)+1 from woman_category), '여성복 하의');

    commit;
    select * from woman_category;
    -- 대분류를 가져오는 쿼리
    select * from woman_category where woman_cate_code2 = 0;
    -- 대분류'의류'의 중분류를 가져오는 쿼리
    select * from woman_category where woman_cate_code1 = 1 and woman_cate_code2 != 0;
    
    -- 상품
    INSERT INTO woman(woman_no, woman_name, woman_cate_code1, woman_cate_code2, woman_image_name,
        content, company, product_date)
    VALUES (woman_seq.nextval, '정장 스타일 여성 상의', 1, 1,
        '/upload/woman/001.jpg', '멋지고 편한 여성용 상의, 물빨래 가능',
        'EZEN', '2024-10-02');
    commit;
    select * from woman;
    
    -- 상품이미지
    INSERT INTO woman_image(woman_image_no, woman_image_name, woman_no)
    VALUES (woman_image_seq.nextval, '/upload/woman/002.jpg', 1);
    INSERT INTO woman_image(woman_image_no, woman_image_name, woman_no)
    VALUES (woman_image_seq.nextval, '/upload/woman/003.jpg', 1);
    commit;
    select * from woman_image;
    
    -- 상품사이즈
    INSERT INTO woman_size(woman_size_no, woman_size_name, woman_no)
    VALUES (woman_size_seq.nextval, 'M', 1);
    INSERT INTO woman_size(woman_size_no, woman_size_name, woman_no)
    VALUES (woman_size_seq.nextval, 'L', 1);
    INSERT INTO woman_size(woman_size_no, woman_size_name, woman_no)
    VALUES (woman_size_seq.nextval, 'XL', 1);
    commit; 
    select * from woman_size;
    
    -- 상품컬러
    INSERT INTO woman_color(woman_color_no, woman_color_name, woman_no)
    VALUES (woman_color_seq.nextval, 'BLACK', 1);
    INSERT INTO woman_color(woman_color_no, woman_color_name, woman_no)
    VALUES (woman_color_seq.nextval, 'GRAY', 1);
    INSERT INTO woman_color(woman_color_no, woman_color_name, woman_no)
    VALUES (woman_color_seq.nextval, 'NAVY', 1);
    commit;
    select * from woman_color;
    
    -- 상품가격
    -- 같은 상품에서 판매기간이 겹치면 안된다.
    -- 현재날짜 (판매중) : 1개
    INSERT INTO woman_price(woman_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, woman_no)
    VALUES(woman_price_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-20', '2024-10-31', 1);
    -- 지난가격 (여러개) - 판매일은 겹치면 안된다.
    INSERT INTO woman_price(woman_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, woman_no)
    VALUES(woman_price_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-11', '2024-10-19', 1);
    INSERT INTO woman_price(woman_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, woman_no)
    VALUES(woman_price_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-03', '2024-10-10', 1);
    -- 예약가격 (여러개가능)
    INSERT INTO woman_price(woman_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, woman_no)
    VALUES(woman_price_seq.nextval, 100000, 10000, 0, 90000, 0, 0,
        '2024-11-01', '2024-11-10', 1);
    INSERT INTO woman_price(woman_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, woman_no)
    VALUES(woman_price_seq.nextval, 100000, 0, 50, 50000, 0, 0,
        '2024-11-11', '2024-12-31', 1);
    commit;
    select * from woman_price;
    
    









