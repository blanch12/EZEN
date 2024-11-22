package org.zerock.qnareply.vo;

import java.util.Date;

import lombok.Data;

@Data
public class QnaReplyVO {

	private Long rno; // 댓글의 글번호
	private Long no;  // 일반게시판 글번호
	private String content; // 댓글 내용
	private String id; // 댓글작성자 id
	private Date writeDate; // 댓글작성일
}
