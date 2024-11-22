package org.zerock.womancategory.vo;

import lombok.Data;

@Data
public class WomanCategoryVO {

	// 대분류 코드 (예: 0으로 표시되는 대분류)
	private Integer woman_cate_code1;

	// 중분류 코드 (대분류에 속하는 세부 카테고리 코드)
	private Integer woman_cate_code2;

	// 카테고리 이름 (대분류 또는 중분류의 이름)
	private String woman_cate_name;
}
