package org.zerock.brandscategory.vo;

import lombok.Data;

@Data
public class BrandsCategoryVO {

	// 대분류 카테고리 코드
	private Integer brands_cate_code1;

	// 중분류 카테고리 코드
	private Integer brands_cate_code2;

	// 카테고리 이름
	private String brands_cate_name;
}
