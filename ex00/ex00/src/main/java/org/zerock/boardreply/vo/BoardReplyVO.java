package org.zerock.boardreply.vo;

import java.util.Date;

import lombok.Data;

// 댓글 정보를 담는 VO 클래스
@Data
public class BoardReplyVO {

    private Long rno;        // 댓글 번호 (고유 식별자)
    private Long no;         // 일반 게시판 글 번호
    private String content;  // 댓글 내용
    private String id;       // 댓글 작성자 ID
    private String name;     // 댓글 작성자 이름
    private Date writeDate;  // 댓글 작성일
}
