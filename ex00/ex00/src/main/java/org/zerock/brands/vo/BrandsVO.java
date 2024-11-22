package org.zerock.brands.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BrandsVO {

    private Long brands_no; // 브랜드 번호 (Brand ID)
    private String brands_name; // 브랜드 이름 (Brand name)
    private Integer brands_cate_code1; // 대분류 코드 (Main category code)
    private Integer brands_cate_code2; // 중분류 코드 (Subcategory code)
    private String brands_cate_name; // 브랜드 카테고리 이름 (Category name)

    private String brands_image_name; // 브랜드 이미지 파일명 (Image file name)
    private String content; // 브랜드 설명 (Brand description)
    private String company; // 회사 이름 (Company name)

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date product_date; // 제품 출시일 (Product release date)

    private Long brands_price_no; // 가격 번호 (Price ID)
    private Integer price; // 기본 가격 (Original price)
    private Integer discount; // 할인 금액 (Discount amount)
    private Integer discount_rate; // 할인율 (Discount rate)
    private Integer sale_price; // 판매 가격 (Sale price)
    private Integer saved_rate; // 적립율 (Saved rate)
    private Integer delivery_charge; // 배송비 (Delivery charge)

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sale_start_date; // 세일 시작일 (Sale start date)

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sale_end_date; // 세일 종료일 (Sale end date)
    
    // 세일 가격을 계산하는 메소드
    public Integer sale_price() {
        // 할인 금액이 있는 경우, 할인 금액을 차감
        if (discount != 0) {
            return price - discount;
        }

        // 할인율이 있는 경우, 할인율을 반영한 가격 계산
        return (price - (price * discount_rate / 100)) / 100 * 100;
    }

    // Getter, Setter
    public String getBrands_cate_name() {
        return brands_cate_name;
    }

    public void setBrands_cate_name(String brands_cate_name) {
        this.brands_cate_name = brands_cate_name;
    }
}
