-- ��ǰ ���̺�

   -- ���̺� ����
    drop table goods_price CASCADE CONSTRAINTS;
    drop table goods_image CASCADE CONSTRAINTS;
    drop table goods_color CASCADE CONSTRAINTS;
    drop table goods_size CASCADE CONSTRAINTS;
    drop table goods CASCADE CONSTRAINTS;
    drop table category CASCADE CONSTRAINTS;
    
    -- ������ ����
    drop SEQUENCE goods_price_seq;
    drop SEQUENCE goods_image_seq;
    drop SEQUENCE goods_color_seq;
    drop SEQUENCE goods_size_seq;
    drop SEQUENCE goods_seq;

-- 2. ��ü ���� (���̺�&��Ű��)
    -- 2-1. ī�װ�
    create table category (
        cate_code1 NUMBER(3), --��з� ( �����Ƿ�, �����Ƿ� �� ūī�װ�)
        -- midcate=0 && smcate=0 �̸� ��з�
        cate_code2 NUMBER(3) DEFAULT 0, -- �ߺз� ( ����, û���� �� ���� ī�װ�)
        cate_name VARCHAR2(30) NOT NULL,
        CONSTRAINT category_pk PRIMARY KEY (cate_code1, cate_code2)
    );
    -- 2-2. ��ǰ
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
    -- 2-3. ��ǰ������
    create table goods_size (
        goods_size_no NUMBER PRIMARY KEY,
        size_name VARCHAR2(30) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-4. ��ǰ����
    create table goods_color (
        goods_color_no NUMBER PRIMARY KEY,
        color_name VARCHAR2(30) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-5. ��ǰ�̹���
    create table goods_image (
        goods_image_no NUMBER PRIMARY KEY,
        image_name VARCHAR2(300) NOT NULL,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );
    -- 2-6. ��ǰ����
    create table goods_price (
        goods_price_no NUMBER PRIMARY KEY,
        price NUMBER(9) NOT NULL,
        discount NUMBER(9) DEFAULT 0,
        delivery_charge NUMBER(6) DEFAULT 0,
        sale_start_date DATE DEFAULT sysdate,
        sale_end_date DATE DEFAULT '9999-12-31',
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL
    );

    -- ������ ����
    CREATE SEQUENCE goods_seq;
    CREATE SEQUENCE goods_size_seq;
    CREATE SEQUENCE goods_color_seq;
    CREATE SEQUENCE goods_image_seq;
    CREATE SEQUENCE goods_price_seq;
    

 -- ���� ������
    --ī�װ�
    
    -- ��з�
    INSERT INTO category(cate_code1, cate_name)
    VALUES((SELECT NVL(max(cate_code1),0)+1 FROM category), 'Man');
    INSERT INTO category(cate_code1, cate_name)
    VALUES((SELECT NVL(max(cate_code1),0)+1 FROM category), 'Woman');
    INSERT INTO category(cate_code1, cate_name)
    VALUES((SELECT NVL(max(cate_code1),0)+1 FROM category), 'Hermes');
    commit;
    select * from category;
    
    -- �ߺз�
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
    
    -- ��з� �� ���
    select * from category where cate_code1 = 2;
    
    -- �ߺз���
    select * from category where cate_code1 = 1 and cate_code2 != 0;
    
    -- ��ǰ
    INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '���ü���', 1, 1, 'man_sampleshirt.jpg', '���ü��� �󼼳���',
        'EZEN');
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '����û����', 1, 2, 'man_samplejeans.jpg', '����û���� �󼼳���',
        'Uniqlo');
        
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '������Ʈ', 2, 3, 'woman_samplecoat.jpg', '������Ʈ �󼼳���',
        'Hermes');
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '����ġ��', 2, 4, 'woman_sampleskirt.jpg', '����ġ�� �󼼳���',
        'Ralph lauren');
        
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '���ýð�', 3, 5, 'sample_watch.jpg', '���ýð� �󼼳���',
        'Balenciaga');
        INSERT INTO goods(goods_no, goods_name, cate_code1, cate_code2, image_name, content, company)
    VALUES(goods_seq.nextval, '���ø����', 3, 6, 'sample_necklace.jpg', '���ø���� �󼼳���',
        'Balenciaga');
    commit;
    select * from goods;
    
    -- ��ǰ �̹���
    INSERT INTO goods_image(goods_image_no, image_name, goods_no)
    VALUES(goods_image_seq.nextval, 'goods_image_sample1.jpg', 1);
    INSERT INTO goods_image(goods_image_no, image_name, goods_no)
    VALUES(goods_image_seq.nextval, 'goods_image_sample2.jpg', 1);
    commit;
    select * from goods_image;
    
    -- ��ǰ ������
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES(goods_size_seq.nextval, 'M', 1);
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES(goods_size_seq.nextval, 'L', 1);
    INSERT INTO goods_size(goods_size_no, size_name, goods_no)
    VALUES(goods_size_seq.nextval, 'XL', 1);
    commit;
    select * from goods_size;
    
    -- ��ǰ �÷�
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES(goods_color_seq.nextval, 'Black', 1);
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES(goods_color_seq.nextval, 'Gray', 1);
    INSERT INTO goods_color(goods_color_no, color_name, goods_no)
    VALUES(goods_color_seq.nextval, 'Navy', 1);
    commit;
    select * from goods_color;
    
    -- ��ǰ���� �� �ǸűⰣ
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