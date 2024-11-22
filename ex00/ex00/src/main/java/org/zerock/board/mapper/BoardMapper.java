package org.zerock.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.board.vo.BoardVO;
import org.zerock.util.page.PageObject;

@Repository
public interface BoardMapper {

    // 1. 일반 게시판 리스트 관련 메서드

    // 전체 게시글 개수 조회
    public Long getTotalRow(PageObject pageObject);

    // 게시글 목록 조회
    public List<BoardVO> list(PageObject pageObject);

    // 2. 일반 게시판 글보기 관련 메서드

    // 조회수 증가
    public Integer increase(Long no);

    // 게시글 상세보기
    public BoardVO view(Long no);

    // 3. 일반 게시판 글쓰기 관련 메서드

    // 게시글 작성
    public Integer write(BoardVO vo);

    // 4. 일반 게시판 글수정 관련 메서드

    // 게시글 수정
    public Integer update(BoardVO vo);

    // 5. 일반 게시판 글삭제 관련 메서드

    // 게시글 삭제
    public Integer delete(BoardVO vo);
}
