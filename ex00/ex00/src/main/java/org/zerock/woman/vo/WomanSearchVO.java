package org.zerock.woman.vo;

import lombok.Data; // Lombok 라이브러리로 자동으로 getter, setter 생성

@Data // getter, setter, toString, equals, hashCode 자동 생성
public class WomanSearchVO {

    private Integer woman_cate_code1; // 대분류 카테고리 코드
    private Integer woman_cate_code2; // 중분류 카테고리 코드
    private String woman_name; // 상품 이름
    private Integer min_price; // 최저 가격
    private Integer max_price; // 최대 가격
    
    // URL에 쿼리 문자열로 붙일 때 사용
    // 각 변수 값이 null이면 해당 변수는 비어있는 문자열로 변환하여 처리
    public String getSearchQuery() {
        return ""
            + "woman_cate_code1=" + toStr(woman_cate_code1) 
            + "&woman_cate_code2=" + toStr(woman_cate_code2) 
            + "&woman_name=" + toStr(woman_name) 
            + "&min_price=" + toStr(min_price) 
            + "&max_price=" + toStr(max_price);
    }

    // 객체가 null일 때 빈 문자열("")로 변환하는 함수
    public String toStr(Object obj) {
        return (obj == null) ? "" : obj.toString(); // null이면 빈 문자열 반환, 아니면 객체의 toString 반환
    }
}
