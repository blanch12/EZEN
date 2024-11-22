package org.zerock.woman.vo;

import lombok.Data; // Lombok 라이브러리로 자동으로 getter, setter 생성

@Data // getter, setter, toString, equals, hashCode 자동 생성
public class WomanSizeVO {

    private Long woman_size_no; // 사이즈 번호
    private String woman_size_name; // 사이즈 이름
    private Long woman_no; // 해당 사이즈가 연결된 상품의 번호
}
