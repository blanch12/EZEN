package org.zerock.member.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class LoginVO {

    // member table (회원 정보)
    private String id;            // 회원 ID
    private String pw;            // 회원 비밀번호
    private String name;          // 회원 이름
    private String photo;         // 회원 사진 URL (혹은 파일 경로)
    private String gender;        // 성별 (예: "M" 또는 "F")
    private String tel;           // 연락처
    private String email;         // 이메일
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;           // 생년월일 (yyyy-MM-dd 형식)
    private Date regDate;         // 회원 등록일
    private Date conDate;         // 회원 최종 접속일 (최근 로그인 시간)
    private String status;        // 회원 상태 (예: "active", "inactive", "suspended" 등)
    private Long newMsgCnt;       // 새로운 메시지 개수 (미확인 메시지 개수)
    private Integer gradeNo;      // 회원 등급 번호 (등급 구분)

    // 추가된 필드
    private String loginType;     // 로그인 유형 ("normal", "kakao", "naver") - 일반 로그인, 카카오 로그인, 네이버 로그인 구분

    // grade table (회원 등급 정보)
    private String gradeName;     // 회원 등급 이름 (예: "VIP", "Regular" 등)
}
