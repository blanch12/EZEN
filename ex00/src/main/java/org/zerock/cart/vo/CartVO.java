package org.zerock.cart.vo;

import lombok.Data;

@Data
public class CartVO {

	//cart 테이블
	//카트넘버
//	private Long cart_no;
//	//수량
//	private Long quantity;
//	
//	//goods 테이블	
//	//상품번호
//	private Long goods_no;
//	//상품명
//	private String goods_name;
//	//제품사진(이미지) - 경로+파일이름
//	private String image_name;
//	
//	//Goods_price table
//	//배송비
//	private Long delivery_charge;
//	//판매가
//	private Long saleprice;
	
    private Long cartNo;        // DB 컬럼명: cart_no
    private Long goodsNo;       // DB 컬럼명: goods_no
    private String goodsName;   // DB 컬럼명: goods_name
    private String imageName;   // DB 컬럼명: image_name
    private int quantity;       // DB 컬럼명: quantity
    private double deliveryCharge;  // DB 컬럼명: delivery_charge
    private double saleprice;   // DB 컬럼명: saleprice
	
	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", goodsNo=" + goodsNo + ", goodsName=" + goodsName
				+ ", imageName=" + imageName
				+ ", quantity=" + quantity + ", deliveryCharge=" + deliveryCharge + ", saleprice=" + saleprice + "]";
	}
}
