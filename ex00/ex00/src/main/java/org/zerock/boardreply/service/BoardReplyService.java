package org.zerock.boardreply.service;

import java.util.List;

import org.zerock.boardreply.vo.BoardReplyVO;
import org.zerock.util.page.PageObject;

public interface BoardReplyService {

    // 1. 댓글 목록 조회
    public List<BoardReplyVO> list(PageObject pageObject, Long no);

    // 2. 댓글 작성
    public Integer write(BoardReplyVO vo);

    // 3. 댓글 수정
    public Integer update(BoardReplyVO vo);

    // 4. 댓글 삭제
    public Integer delete(BoardReplyVO vo);
}
