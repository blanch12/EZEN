package org.zerock.boardreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.boardreply.mapper.BoardReplyMapper;
import org.zerock.boardreply.vo.BoardReplyVO;
import org.zerock.util.page.PageObject;

import lombok.Setter;

@Service
@Qualifier("boardReplyServiceImpl")
public class BoardReplyServiceImpl implements BoardReplyService {

    // BoardReplyMapper 자동 주입
    @Setter(onMethod_ = @Autowired)
    private BoardReplyMapper mapper;

    // 1. 댓글 목록 조회
    @Override
    public List<BoardReplyVO> list(PageObject pageObject, Long no) {
        // 전체 데이터 수를 설정 - 페이지 처리를 위함
        pageObject.setTotalRow(mapper.getTotalRow(pageObject, no));
        // 댓글 목록 반환
        return mapper.list(pageObject, no);
    }

    // 2. 댓글 작성
    @Override
    public Integer write(BoardReplyVO vo) {
        // 댓글 작성 처리
        return mapper.write(vo);
    }

    // 3. 댓글 수정
    @Override
    public Integer update(BoardReplyVO vo) {
        // 댓글 수정 처리
        return mapper.update(vo);
    }

    // 4. 댓글 삭제
    @Override
    public Integer delete(BoardReplyVO vo) {
        // 댓글 삭제 처리
        return mapper.delete(vo);
    }
}
