package org.zerock.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.board.mapper.BoardMapper;
import org.zerock.board.vo.BoardVO;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("boardServiceImpl")
public class BoardServiceImpl implements BoardService {

    @Inject
    private BoardMapper mapper;

    // 1. 일반 게시판 리스트
    @Override
    public List<BoardVO> list(PageObject pageObject) {
        log.info("list() 실행 =====");
        // 총 게시글 수 설정
        pageObject.setTotalRow(mapper.getTotalRow(pageObject));
        // 게시글 목록 반환
        return mapper.list(pageObject);
    }

    // 2. 일반 게시판 글보기
    @Override
    public BoardVO view(Long no, int inc) {
        log.info("view() 실행 =====");
        // 조회수 증가 조건 처리
        if (inc == 1) mapper.increase(no);
        // 게시글 정보 반환
        return mapper.view(no);
    }

    // 3. 일반 게시판 글등록
    @Override
    public Integer write(BoardVO vo) {
        log.info("write() 실행 =====");
        // 게시글 작성 처리
        return mapper.write(vo);
    }

    // 4. 일반 게시판 글수정
    @Override
    public Integer update(BoardVO vo) {
        log.info("update() 실행 =====");
        // 게시글 수정 처리
        return mapper.update(vo);
    }

    // 5. 일반 게시판 글삭제
    @Override
    public Integer delete(BoardVO vo) {
        log.info("delete() 실행 =====");
        // 게시글 삭제 처리
        return mapper.delete(vo);
    }
}
