package org.zerock.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.board.mapper.BoardMapper;
import org.zerock.board.vo.BoardVO;
import org.zerock.qna.mapper.QnaMapper;
import org.zerock.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@Qualifier("boardServiceImpl")
public class BoardServiceImpl implements BoardService {
	

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	// 1. 일반 게시판 리스트
	@Override
	public List<BoardVO> list(PageObject pageObject) {
		log.info("list() 실행 =====");
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	// 2. 일반 게시판 글보기
	@Override
	public BoardVO view(Long no, int inc) {
		log.info("view() 실행 =====");
		if (inc == 1) mapper.increase(no);
		return mapper.view(no);
	}
	
	// 3. 일반 게시판 글등록
	@Override
	public Integer write(BoardVO vo) {
		Integer result = mapper.write(vo); 
		log.info("write() 실행 =====");
		return result;
	}
	
	// 4. 일반 게시판 글수정
	@Override
	public Integer update(BoardVO vo) {
		log.info("update() 실행 =====");
		return mapper.update(vo);
	}
	
	// 5. 일반 게시판 글삭제
	@Override
	public Integer delete(BoardVO vo) {
		log.info("delete() 실행 =====");
		return mapper.delete(vo);
	}
}










