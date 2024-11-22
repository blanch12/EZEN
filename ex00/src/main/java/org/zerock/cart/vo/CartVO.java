package org.zerock.cart.vo;

import lombok.Data;

@Data
public class CartVO {


	
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
