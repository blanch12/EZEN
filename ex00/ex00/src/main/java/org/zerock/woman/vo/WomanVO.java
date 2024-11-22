package org.zerock.woman.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat; // 날짜 포맷을 지정하기 위해 사용

import lombok.Data; // Lombok을 사용하여 getter, setter 자동 생성

@Data // Lombok을 통해 클래스의 getter, setter, toString, equals, hashCode 메소드 자동 생성
public class WomanVO {

    private Long woman_no; // 상품 고유 번호
    private String woman_name; // 상품 이름
    private Integer woman_cate_code1; // 대분류 코드
    private Integer woman_cate_code2; // 중분류 코드
    private String woman_cate_name; // 카테고리 이름
    private String woman_image_name; // 상품 이미지 파일 이름
    private String content; // 상품 설명
    private String company; // 제조사 또는 회사 이름

    @DateTimeFormat(pattern = "yyyy-MM-dd") // 날짜 포맷을 지정
    private Date product_date; // 상품 출시일

    private Long woman_price_no; // 가격 고유 번호
    private Integer price; // 원래 가격
    private Integer discount; // 할인 금액
    private Integer discount_rate; // 할인율 (%)
    private Integer sale_price; // 판매 가격
    private Integer saved_rate; // 절약된 비율
    private Integer delivery_charge; // 배송비
    @DateTimeFormat(pattern = "yyyy-MM-dd") // 할인 시작일
    private Date sale_start_date;
    @DateTimeFormat(pattern = "yyyy-MM-dd") // 할인 종료일
    private Date sale_end_date;

    // 할인 가격 계산 메소드
    public Integer sale_price() {
        if (discount != 0) { // 할인 금액이 있을 경우
            return price - discount; // 원래 가격에서 할인 금액을 빼는 방식
        }
        // 할인율이 있을 경우
        return (price - (price * discount_rate / 100)) / 100 * 100; // 할인율을 적용한 가격
    }
}
