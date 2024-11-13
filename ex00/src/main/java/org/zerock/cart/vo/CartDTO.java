package org.zerock.cart.vo;

import lombok.Data;

@Data
public class CartDTO {
	
	private int cartno;
    private String id;
    private int goodsno;
    private String goodsname;
    private String imagename;
    private int quantity;
    private int deliverycharge;
    private int saleprice;

}
