package org.zerock.notice.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeVO {
	
	// 공지사항 번호
	private Long no;
	
	// 공지사항 제목
	private String title;
	
	// 공지사항 내용
	private String content;
	
	// 공지 시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	
	// 공지 종료일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	
	// 작성일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date writeDate;
	
	// 수정일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateDate;
}
