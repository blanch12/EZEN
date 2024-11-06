-- 상품 테이블

   -- 테이블 삭제
    drop table goods_price CASCADE CONSTRAINTS;
    drop table goods_image CASCADE CONSTRAINTS;
    drop table goods_color CASCADE CONSTRAINTS;
    drop table goods_size CASCADE CONSTRAINTS;
    drop table goods CASCADE CONSTRAINTS;
    drop table category CASCADE CONSTRAINTS;
    
    -- 시퀀스 삭제
    drop SEQUENCE goods_price_seq;
    drop SEQUENCE goods_image_seq;
    drop SEQUENCE goods_color_seq;
    drop SEQUENCE goods_size_seq;
    drop SEQUENCE goods_seq;

-- 2. 객체 생성 (테이블&스키마)
    -- 2-1. 카테고리
    create table category (
        cate_code1 NUMBER(3), --대분류 ( 여성의류, 남성의류 등 큰카테고리)
        -- midcate=0 && smcate=0 이면 대분류
        cate_code2 NUMBER(3) DEFAULT 0, -- 중분류 ( 셔츠, 청바지 등 종류 카테고리)
        cate_name VARCHAR2(30) NOT NULL,
        CONSTRAINT category_pk PRIMARY KEY (cate_code1, cate_code2)
    );
    -- 2-2. 상품
    create table goods (
        goods_no NUMBER PRIMARY KEY,
        goods_name VARCHAR2(300) NOT NULL,
        cate_code1 NUMBER(3) NOT NULL,
        cate_code2 NUMBER(3) NOT NULL,
        image_name VARCHAR2(300) NOT NULL,
        content VARCHAR2(2000),
        company VARCHAR2(60) NOT NULL,
        CONSTRAINT goods_fk FOREIGN KEY (cate_code1, cate_code2) REFERENCES category(cate_code1, cate_code2)
    );
    -- 2-3. 상품사이즈
    create table goods_size (
        goods_size_no NUMBER PRIMARY KEY,
        size_name VARCHAR2(30) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-4. 상품색상
    create table goods_color (
        goods_color_no NUMBER PRIMARY KEY,
        color_name VARCHAR2(30) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-5. 상품이미지
    create table goods_image (
        goods_image_no NUMBER PRIMARY KEY,
        image_name VARCHAR2(300) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-6. 상품가격
    create table goods_price (
        goods_price_no NUMBER PRIMARY KEY,
        price NUMBER(9) NOT NULL,
        discount NUMBER(9) DEFAULT 0,
        delivery_charge NUMBER(6) DEFAULT 0,
        sale_start_date DATE DEFAULT sysdate,
        sale_end_date DATE DEFAULT '9999-12-31',
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );

    -- 시퀀스 생성
    CREATE SEQUENCE goods_seq;
    CREATE SEQUENCE goods_size_seq;
    CREATE SEQUENCE goods_color_seq;
    CREATE SEQUENCE goods_image_seq;
    CREATE SEQUENCE goods_price_seq;
    

 -- 샘플 데이터
    --카테고리
    
    -- 대분류
    INSERT INTO category(cate_code1, cate_name)
    VALUES((SELECT NVL(max(cate_code1),0)+1 FROM category), 'Man');
    INSERT INTO category(cate_code1, cate_name)
    VALUES((SELECT NVL(max(cate_code1),0)+1 FROM category), 'Woman');
    INSERT INTO category(cate_code1, cate_name)
    VALUES((SELECT NVL(max(cate_code1),0)+1 FROM category), 'Hermes');
    commit;
    select * from category;
    
    -- 중분류
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1,(SELECT NVL(max(cate_code2),0)+1 FROM category), 'Shirt');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1,(SELECT NVL(max(cate_code2),0)+1 FROM category), 'Jeans');
    
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(2,(SELECT NVL(max(cate_code2),0)+1 FROM category), 'Coat');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(2,(SELECT NVL(max(cate_code2),0)+1 FROM category), 'Skirt');
    
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(3,(SELECT NVL(max(cate_code2),0)+1 FROM category), 'Watch');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(3,(SELECT NVL(max(cate_code2),0)+1 FROM category), 'Necklace');
    commit;

    select * from category;
    
    -- 대분류 의 요소
    select * from category where cate_code1 = 2;
    
    -- 중분류만
    select * from category where cate_code1 = 1 and cate_code2 != 0;
    
    -- 상품
    INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '샘플셔츠', 1, 1, 'man_sampleshirt.jpg', '샘플셔츠 상세내용',
        'EZEN');
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '샘플청바지', 1, 2, 'man_samplejeans.jpg', '샘플청바지 상세내용',
        'Uniqlo');
        
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '샘플코트', 2, 3, 'woman_samplecoat.jpg', '샘플코트 상세내용',
        'Hermes');
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '샘플치마', 2, 4, 'woman_sampleskirt.jpg', '샘플치마 상세내용',
        'Ralph lauren');
        
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '샘플시계', 3, 5, 'sample_watch.jpg', '샘플시계 상세내용',
        'Balenciaga');
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '샘플목걸이', 3, 6, 'sample_necklace.jpg', '샘플목걸이 상세내용',
        'Balenciaga');
    commit;
    select * from goods;
    
    -- 상품 이미지
    INSERT INTO goods_image(goods_image_no, image_name, goods_no)
    VALUES(goods_image_seq.nextval, 'goods_image_sample1.jpg', 1);
    INSERT INTO goods_image(goods_image_no, image_name, goods_no)
    VALUES(goods_image_seq.nextval, 'goods_image_sample2.jpg', 1);
    commit;
    select * from goods_image;
    
    -- 상품 사이즈
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES(goods_size_seq.nextval, 'M', 1);
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES(goods_size_seq.nextval, 'L', 1);
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES(goods_size_seq.nextval, 'XL', 1);
    commit;
    select * from goods_size;
    
    -- 상품 컬러
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES(goods_color_seq.nextval, 'Black', 1);
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES(goods_color_seq.nextval, 'Gray', 1);
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES(goods_color_seq.nextval, 'Navy', 1);
    commit;
    select * from goods_color;
    
    -- 상품가격 및 판매기간
    INSERT INTO goods_price(goods_price_no, price, discount,delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 50000, 0, 0, '2024-10-20', '2024-10-31', 1);
    INSERT INTO goods_price(goods_price_no, price, discount, delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 70000, 0, 0, '2024-10-11', '2024-10-19', 2);
    INSERT INTO goods_price(goods_price_no, price, discount,delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 100000, 0, 0, '2024-10-03', '2024-10-10', 3);
    INSERT INTO goods_price(goods_price_no, price, discount,delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 150000, 120000, 0, '2024-11-01', '2024-11-10', 4);
    INSERT INTO goods_price(goods_price_no, price, discount, delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 200000, 150000, 0, '2024-11-11', '2024-11-30', 5);
    INSERT INTO goods_price(goods_price_no, price, discount, delivery_charge, sale_start_date, sale_end_date, goods_no)
    VALUES(goods_price_seq.nextval, 200000, 0, 0, '2024-10-20', '2024-11-30', 6);
    commit;
    select * from goods_price;
    select * from goods;