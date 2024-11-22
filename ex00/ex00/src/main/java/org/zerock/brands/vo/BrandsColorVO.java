package org.zerock.brands.vo;

import lombok.Data;

/**
 * BrandsColorVO 클래스
 * <p>
 * 이 클래스는 브랜드의 색상 정보를 담기 위한 VO(Value Object) 클래스입니다.
 * 브랜드와 관련된 색상 번호, 색상 이름, 브랜드 번호를 포함합니다.
 * </p>
 */
@Data
public class BrandsColorVO {

    /**
     * 색상 고유 번호
     * <p>
     * 각 색상마다 고유하게 부여된 번호입니다.
     * </p>
     */
    private Long brands_color_no;

    /**
     * 색상 이름
     * <p>
     * 색상의 이름을 나타냅니다. 예: "Red", "Blue" 등.
     * </p>
     */
    private String brands_color_name;

    /**
     * 브랜드 번호
     * <p>
     * 이 색상 정보가 속한 브랜드의 고유 번호입니다. 
     * 브랜드와 색상을 연결하는 외래 키 역할을 합니다.
     * </p>
     */
    private Long brands_no;
}
