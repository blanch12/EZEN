package org.zerock.brands.vo;

import lombok.Data;

@Data
public class BrandsSearchVO {

	private Integer brands_cate_code1; // 대분류
	private Integer brands_cate_code2; // 중분류
	private String brands_name; // 상품이름
	private String brands_cate_name; //브랜드 이
	private Integer min_price; // 최저가격
	private Integer max_price; // 최대가격
	
	
	
	public String getSearchQuery() {
		return ""
			+ "brands_cate_code1=" + toStr(brands_cate_code1) 
			+ "&brands_cate_code2=" + toStr(brands_cate_code2) 
			+ "&brands_name=" + toStr(brands_name)
			+ "&brands_cate_name=" + toStr(brands_cate_name)
			+ "&min_price=" + toStr(min_price) 
			+ "&max_price=" + toStr(max_price) 
			;
	}
	
	public String toStr (Object obj) {
		return ((obj==null)?"":obj.toString());
	}
}












