package org.zerock.kakao.vo;

import lombok.Data;

@Data
public class KakaoUser {
    private String nickname;
    private String profileImage;
    private Long id;
    private String email;
    private String gender;
}
