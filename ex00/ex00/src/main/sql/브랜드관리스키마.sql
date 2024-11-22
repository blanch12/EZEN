-- 브랜드
-- 테이블 삭제
    DROP TABLE brands_price CASCADE CONSTRAINTS;

    DROP TABLE brands_image CASCADE CONSTRAINTS;

    DROP TABLE brands_color CASCADE CONSTRAINTS;

    DROP TABLE brands_size CASCADE CONSTRAINTS;

    DROP TABLE brands CASCADE CONSTRAINTS;
 
    DROP TABLE brands_category CASCADE CONSTRAINTS;
    
-- 시퀀스 삭제
    DROP SEQUENCE brands_price_seq;
    DROP SEQUENCE brands_image_seq;
    DROP SEQUENCE brands_color_seq;
    DROP SEQUENCE brands_size_seq;
    DROP SEQUENCE brands_seq;

-- 테이블 생성
    CREATE TABLE brands_category (
        brands_cate_code1 NUMBER(3),
        brands_cate_code2 NUMBER(3) DEFAULT 0,
        brands_cate_name VARCHAR2(30) NOT NULL,
        CONSTRAINT brands_category_pk PRIMARY KEY (brands_cate_code1, brands_cate_code2)
    );
    -- 브랜드
    CREATE TABLE brands (
        brands_no NUMBER PRIMARY KEY,
        brands_name VARCHAR2(300) NOT NULL,
        brands_cate_code1 NUMBER(3) NOT NULL,
        brands_cate_code2 NUMBER(3) NOT NULL,
        brands_image_name VARCHAR2(300) NOT NULL,
        content VARCHAR2(2000),
        company VARCHAR2(60) NOT NULL,
        product_date DATE,
        CONSTRAINT brands_fk FOREIGN KEY (brands_cate_code1, brands_cate_code2)
        REFERENCES brands_category(brands_cate_code1, brands_cate_code2)
    );
    -- 브랜드 사이즈
    CREATE TABLE brands_size (
        brands_size_no NUMBER PRIMARY KEY,
        brands_size_name VARCHAR2(30) NOT NULL,
        brands_no NUMBER REFERENCES brands(brands_no) ON DELETE CASCADE NOT NULL
    );
    -- 브랜드 색상
    CREATE TABLE brands_color (
        brands_color_no NUMBER PRIMARY KEY,
        brands_color_name VARCHAR2(30) NOT NULL,
        brands_no NUMBER REFERENCES brands(brands_no) ON DELETE CASCADE NOT NULL
    );
    -- 브랜드 이미지
    CREATE TABLE brands_image (
        brands_image_no NUMBER PRIMARY KEY,
        brands_image_name VARCHAR2(300) NOT NULL,
        brands_no NUMBER REFERENCES brands(brands_no) ON DELETE CASCADE NOT NULL
    );
    -- 브랜드 가격
    CREATE TABLE brands_price (
        brands_price_no NUMBER PRIMARY KEY,
        price NUMBER(9) NOT NULL,
        discount NUMBER(9) DEFAULT 0,
        discount_rate NUMBER(3) DEFAULT 0,
        sale_price NUMBER(9) NOT NULL,
        saved_rate NUMBER(3) DEFAULT 0,
        delivery_charge NUMBER(6) DEFAULT 0,
        sale_start_date DATE DEFAULT sysdate,
        sale_end_date DATE DEFAULT '9999-12-31',
        brands_no NUMBER REFERENCES brands(brands_no) ON DELETE CASCADE NOT NULL
    );
    
    // 시퀀스 
    CREATE SEQUENCE brands_seq;
    CREATE SEQUENCE brands_size_seq;
    CREATE SEQUENCE brands_color_seq;
    CREATE SEQUENCE brands_image_seq;
    CREATE SEQUENCE brands_price_seq;

    -- 브랜드 카테고리
    -- 대분류
    INSERT INTO brands_category(brands_cate_code1, brands_cate_name)
    VALUES((select NVL(max(brands_cate_code1),0)+1 from brands_category), 'Outer');
    INSERT INTO brands_category(brands_cate_code1, brands_cate_name)
    VALUES((select NVL(max(brands_cate_code1),0)+1 from brands_category), 'Coat');
    commit;
    select * from brands_category;
    
    -- 중분류
    INSERT INTO brands_category(brands_cate_code1, brands_cate_code2, brands_cate_name)
    VALUES(1,(select NVL(max(brands_cate_code2),0)+1 from brands_category), '남성복 상의');
    INSERT INTO brands_category(brands_cate_code1, brands_cate_code2, brands_cate_name)
    VALUES(1,(select NVL(max(brands_cate_code2),0)+1 from brands_category), '남성복 하의');


    
    commit;
    select * from brands_category;
    -- 대분류 쿼리
    select * from brands_category where brands_cate_code2 = 0;
    -- 대분류'의류'의 중분류를 가져오는 쿼리
    select * from brands_category where brands_cate_code1 = 1 and brands_cate_code2 != 0;
    
    -- 브랜드
    INSERT INTO brands(brands_no, brands_name, brands_cate_code1, brands_cate_code2, brands_image_name,
        content, company, product_date)
    VALUES (brands_seq.nextval, 'title', 1, 1,
        '/upload/goods/prada01jpg', 'content',
        'prada', '2024-10-02');
    commit;
    select * from brands;
    
    -- 상품이미지
    INSERT INTO brands_image(brands_image_no, brands_image_name, brands_no)
    VALUES (brands_image_seq.nextval, '/upload/goods/prada02.jpg', 1);
    INSERT INTO brands_image(brands_image_no, brands_image_name, brands_no)
    VALUES (brands_image_seq.nextval, '/upload/goods/prada03.jpg', 1);
    commit;
    select * from brands_image;
    
    -- 상품사이즈
    INSERT INTO brands_size(brands_size_no, brands_size_name, brands_no)
    VALUES (brands_size_seq.nextval, 'S', 1);
    INSERT INTO brands_size(brands_size_no, brands_size_name, brands_no)
    VALUES (brands_size_seq.nextval, 'M', 1);
    INSERT INTO brands_size(brands_size_no, brands_size_name, brands_no)
    VALUES (brands_size_seq.nextval, 'L', 1);


    commit; 
    select * from brands_size;
    
    -- 상품컬러
    INSERT INTO brands_color(brands_color_no, brands_color_name, brands_no)
    VALUES (brands_color_seq.nextval, 'BLACK', 1);
    INSERT INTO brands_color(brands_color_no, brands_color_name, brands_no)
    VALUES (brands_color_seq.nextval, 'GRAY', 1);
    INSERT INTO brands_color(brands_color_no, brands_color_name, brands_no)
    VALUES (brands_color_seq.nextval, 'NAVY', 1);

    commit;
    select * from brands_color;
    
    -- 브랜드가격
    INSERT INTO brands_price(brands_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, brands_no)
    VALUES(brands_rice_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-19', '2024-10-30', 1);
    -- 지난가격
    INSERT INTO brands_price(brands_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, brands_no)
    VALUES(brands_price_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-10', '2024-10-18', 1);
    INSERT INTO brands_price(brands_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, brands_no)
    VALUES(brands_price_seq.nextval, 100000, 0, 0, 100000, 0, 0,
        '2024-10-02', '2024-10-9', 1);
    -- 예약가격
    INSERT INTO brands_price(brands_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, brands_no)
    VALUES(brands_price_seq.nextval, 100000, 10000, 0, 90000, 0, 0,
        '2024-11-02', '2024-11-9', 1);
    INSERT INTO brands_price(brands_price_no, price, discount, discount_rate, sale_price,
        saved_rate, delivery_charge, sale_start_date, sale_end_date, brands_no)
    VALUES(brands_price_seq.nextval, 100000, 0, 50, 50000, 0, 0,
        '2024-11-10', '2024-12-30', 1);
    commit;
    select * from brands_price;
    
    









