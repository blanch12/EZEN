package org.zerock.qna.vo;

import java.util.Date;


import lombok.Data;

@Data
public class QnaVO {
	
	// qna table
	private Long no; // 글번호
	private String title; // 제목
	private String content; // 내용
	private String writer; // 작성자
	private Date writeDate; // 작성일
	private String filename; // 첨부파일 이름
	private String status; // 처리상태
	
	// member table
	private String id;
}
