package org.zerock.naver.vo;

import lombok.Data;

// 네이버 사용자 정보를 담는 VO 클래스
@Data
public class NaverUser {
    private String id;        // 네이버 사용자 ID
    private String nickname;  // 닉네임
    private String email;     // 이메일
    private String name;      // 이름
    private String gender;    // 성별
}
