package org.zerock.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

    // 게시글 번호
    private Long no;

    // 게시글 제목
    private String title;

    // 게시글 내용
    private String content;

    // 작성자
    private String writer;

    // 작성일
    private Date writeDate;

    // 조회수
    private Long hit;

    // 비밀번호 (글 수정/삭제 시 사용)
    private String pw;
}
