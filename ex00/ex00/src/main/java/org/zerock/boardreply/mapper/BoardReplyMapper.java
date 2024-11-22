package org.zerock.boardreply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.boardreply.vo.BoardReplyVO;
import org.zerock.util.page.PageObject;

@Repository
public interface BoardReplyMapper {

    // 1-1. 댓글 총 개수 조회
    public Long getTotalRow(
        @Param("pageObject") PageObject pageObject,
        @Param("no") Long no);

    // 1-2. 댓글 목록 조회
    public List<BoardReplyVO> list(
        @Param("pageObject") PageObject pageObject,
        @Param("no") Long no);

    // 2. 댓글 작성
    public Integer write(BoardReplyVO vo);

    // 3. 댓글 수정
    public Integer update(BoardReplyVO vo);

    // 4. 댓글 삭제
    public Integer delete(BoardReplyVO vo);
}
