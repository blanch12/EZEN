package org.zerock.cart.vo;

import lombok.Data;

@Data
public class CartVO {

    // 장바구니 항목의 고유 번호 (DB 컬럼명: cart_no)
    private Long cartNo;

    // 장바구니 항목에 포함된 상품의 고유 번호 (DB 컬럼명: goods_no)
    private Long goodsNo;

    // 장바구니 항목에 포함된 상품의 이름 (DB 컬럼명: goods_name)
    private String goodsName;

    // 장바구니 항목에 포함된 상품의 이미지 파일 이름 (DB 컬럼명: image_name)
    private String imageName;

    // 장바구니 항목에 포함된 상품의 수량 (DB 컬럼명: quantity)
    private int quantity;

    // 상품의 배송비 (DB 컬럼명: delivery_charge)
    private double deliveryCharge;

    // 상품의 세일 가격 (DB 컬럼명: saleprice)
    private double saleprice;

    // CartVO 객체를 문자열로 반환하는 toString 메소드
    @Override
    public String toString() {
        return "CartVO [cartNo=" + cartNo + ", goodsNo=" + goodsNo + ", goodsName=" + goodsName
                + ", imageName=" + imageName
                + ", quantity=" + quantity + ", deliveryCharge=" + deliveryCharge + ", saleprice=" + saleprice + "]";
    }
}
