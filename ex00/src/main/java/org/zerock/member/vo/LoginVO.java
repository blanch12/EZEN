package org.zerock.member.vo;

import java.util.Date;

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
	private Date birth;
	private Date regDate;
	private Date conDate;
	private String status;
	private Long newMsgCnt;
	private Integer gradeNo;
	// grade table
	private String gradeName;
}
