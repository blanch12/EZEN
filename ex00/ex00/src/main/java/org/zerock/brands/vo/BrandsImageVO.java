package org.zerock.brands.vo;

import lombok.Data;

/**
 * BrandsImageVO 클래스
 * <p>
 * 이 클래스는 브랜드의 이미지 정보를 담기 위한 VO(Value Object) 클래스입니다.
 * 브랜드와 관련된 이미지 번호, 이미지 파일 이름, 브랜드 번호를 포함합니다.
 * </p>
 */
@Data
public class BrandsImageVO {

    /**
     * 이미지 고유 번호
     * <p>
     * 각 이미지마다 고유하게 부여된 번호입니다.
     * </p>
     */
    private Long brands_image_no;

    /**
     * 이미지 파일 이름
     * <p>
     * 브랜드와 관련된 이미지 파일의 이름입니다.
     * 예: "image1.jpg", "product-image.png" 등.
     * </p>
     */
    private String brands_image_name;

    /**
     * 브랜드 번호
     * <p>
     * 이 이미지가 속한 브랜드의 고유 번호입니다.
     * 브랜드와 이미지를 연결하는 외래 키 역할을 합니다.
     * </p>
     */
    private Long brands_no;
}
