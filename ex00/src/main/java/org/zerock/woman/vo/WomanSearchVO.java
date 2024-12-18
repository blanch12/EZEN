package org.zerock.woman.vo;

import lombok.Data;

@Data
public class WomanSearchVO {

	private Integer woman_cate_code1; // 대분류
	private Integer woman_cate_code2; // 중분류
	private String woman_name; // 상품이름
	private Integer min_price; // 최저가격
	private Integer max_price; // 최대가격
	
	// URL에다 붙일때 사용
	// 변수가 null이면 null이라는 문자열이 붙게 됩니다. => 처리해주어야한다.
	public String getSearchQuery() {
		return ""
			+ "woman_cate_code1=" + toStr(woman_cate_code1) 
			+ "&woman_cate_code2=" + toStr(woman_cate_code2) 
			+ "&woman_name=" + toStr(woman_name) 
			+ "&min_price=" + toStr(min_price) 
			+ "&max_price=" + toStr(max_price) 
			;
	}
	
	// 객체가 null일때 ""(비어있는 문자열)로 변경해주는 함수
	public String toStr (Object obj) {
		return ((obj==null)?"":obj.toString());
	}
}












