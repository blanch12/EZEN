package org.zerock.myreview.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MyreviewVO {

	private Long rno;
	private Long no;
	private String content;
	private String title;
	private String id;
	private String filename;
	private Date writeDate;
	private Long stars;
	
}
