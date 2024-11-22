package org.zerock.woman.vo;

import java.util.Date; // 날짜 처리

import lombok.Data; // Lombok을 이용해 getter, setter 등 자동 생성

@Data // 자동으로 getter, setter, toString, equals, hashCode 생성
public class WomanPriceVO {

    private Long woman_price_no; // 상품 가격 고유 번호
    private Integer price; // 원래 가격
    private Integer discount; // 할인가 (고정값)
    private Integer discount_rate; // 할인율 (퍼센트)
    private Integer sale_price; // 최종 판매 가격
    private Integer saved_rate; // 절약된 금액 비율
    private Integer delivery_charge; // 배송비
    private Date sale_start_date; // 세일 시작 날짜
    private Date sale_end_date; // 세일 종료 날짜
    private Long woman_no; // 해당 가격 정보가 속한 상품 번호

    // 세일 가격 계산
    public Integer sale_price() {
        if (discount != 0) {
            // 할인가가 있을 경우
            return price - discount;
        }
        // 할인율이 있을 경우, 할인율에 따라 세일 가격 계산
        return (price - (price * discount_rate / 100)) / 100 * 100;
    }
}
