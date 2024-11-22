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
	private Long rno; // 고유번호(답변 처리를 위한 변수)
	private Long ans; // 본글&답변 구분번호 - 본글: 0, 답변: 1
	private String parent_writer;
	private Long secret;
	
	
	// member table
	private String id;
	
}
