package org.zerock.brands.vo;

import lombok.Data;

@Data
public class BrandsSizeVO {

    private Long brands_size_no; // 사이즈 번호 (Size ID)
    private String brands_size_name; // 사이즈 이름 (Size name)
    private Long brands_no; // 브랜드 번호 (Brand ID)
}
