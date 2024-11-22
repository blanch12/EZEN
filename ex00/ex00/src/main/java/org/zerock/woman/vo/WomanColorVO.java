package org.zerock.woman.vo;

import lombok.Data; // Lombok을 이용해 getter, setter 등 자동 생성

@Data // 자동으로 getter, setter, toString, equals, hashCode 생성
public class WomanColorVO {

    private Long woman_color_no; // 상품 컬러 번호
    private String woman_color_name; // 상품 컬러 이름
    private Long woman_no; // 상품 번호 (상품과 연결)
}
