package org.zerock.woman.vo;

import lombok.Data; // Lombok을 이용해 getter, setter 등 자동 생성

@Data // 자동으로 getter, setter, toString, equals, hashCode 생성
public class WomanImageVO {

    private Long woman_image_no; // 상품 이미지 고유 번호
    private String woman_image_name; // 상품 이미지 파일 이름
    private Long woman_no; // 해당 이미지가 속한 상품 번호 (상품과 연결)
}
