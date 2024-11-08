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
	// grade table
	private String gradeName;
}
