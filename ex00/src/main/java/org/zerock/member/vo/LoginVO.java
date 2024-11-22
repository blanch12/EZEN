package org.zerock.member.vo;

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class LoginVO {

    // member table
    private String id;
    private String pw;
    private String name;
    private String photo;
    private String gender;
    private String tel;
    private String email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;
    private Date regDate;
    private Date conDate;
    private String status;
    private Long newMsgCnt;
    private Integer gradeNo;

    // 추가된 필드
    private String loginType; // 로그인 유형 ("normal", "kakao", "naver")

    // grade table
    private String gradeName;
}
