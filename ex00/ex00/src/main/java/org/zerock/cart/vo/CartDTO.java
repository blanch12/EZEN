package org.zerock.cart.vo;

import lombok.Data;

@Data
public class CartDTO {
    
    // 장바구니 항목의 고유 번호
    private int cartno;
    
    // 장바구니 항목에 속한 사용자의 ID
    private String id;
    
    // 장바구니에 추가된 상품의 고유 번호
    private int goodsno;
    
    // 장바구니에 추가된 상품의 이름
    private String goodsname;
    
    // 상품 이미지의 파일 이름 (이미지 파일을 표시하기 위해 사용)
    private String imagename;
    
    // 장바구니에 담은 상품의 수량
    private int quantity;
    
    // 상품의 배송비
    private int deliverycharge;
    
    // 상품의 세일 가격
    private int saleprice;

}
