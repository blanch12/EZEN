package org.zerock.category.vo;

import lombok.Data;

@Data
public class CategoryVO {

    // 대분류 카테고리 코드 (cate_code1)
    private Integer cate_code1;
    
    // 중분류 카테고리 코드 (cate_code2)
    private Integer cate_code2;
    
    // 카테고리 이름 (cate_name)
    private String cate_name;
}
