package org.zerock.board.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.board.vo.BoardVO;
import org.zerock.util.page.PageObject;

@Repository
public interface BoardMapper {

	// 1. 일반 게시판 리스트

	public Long getTotalRow(PageObject pageObject);

	public List<BoardVO> list(PageObject pageObject);

	
	// 2. 일반 게시판 글보기
	
	// 조회수 증가
	public Integer increase(Long no);
	
	// 글보기 (글정보)
	public BoardVO view(Long no);
	
	// 3. 일반 게시판 글쓰기
	public Integer write(BoardVO vo);


	// 4. 일반 게시판 글수정
	public Integer update(BoardVO vo);
	
	// 5. 일반 게시판 글삭제
	public Integer delete(BoardVO vo);
}









