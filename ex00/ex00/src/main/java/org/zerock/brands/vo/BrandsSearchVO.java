package org.zerock.brands.vo;

import lombok.Data;

@Data
public class BrandsSearchVO {

    private Integer brands_cate_code1; // 대분류 코드 (Main category code)
    private Integer brands_cate_code2; // 중분류 코드 (Subcategory code)
    private String brands_name; // 상품 이름 (Product name)
    private String brands_cate_name; // 브랜드 이름 (Brand name)
    private Integer min_price; // 최저 가격 (Minimum price)
    private Integer max_price; // 최대 가격 (Maximum price)
    
    // 검색 조건을 쿼리 문자열로 반환하는 메소드
    public String getSearchQuery() {
        return ""
            + "brands_cate_code1=" + toStr(brands_cate_code1) 
            + "&brands_cate_code2=" + toStr(brands_cate_code2) 
            + "&brands_name=" + toStr(brands_name)
            + "&brands_cate_name=" + toStr(brands_cate_name)
            + "&min_price=" + toStr(min_price) 
            + "&max_price=" + toStr(max_price);
    }
    
    // 객체를 문자열로 변환하는 메소드, 객체가 null인 경우 빈 문자열 반환
    public String toStr(Object obj) {
        return ((obj == null) ? "" : obj.toString());
    }
}
