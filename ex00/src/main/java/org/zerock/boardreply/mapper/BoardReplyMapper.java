package org.zerock.boardreply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.boardreply.vo.BoardReplyVO;
import org.zerock.util.page.PageObject;

@Repository
public interface BoardReplyMapper {

	// 1-1  getTotalRow

	public Long getTotalRow(
		@Param("pageObject") PageObject pageObject,
		@Param("no") Long no);
	// 1-2. list
	public List<BoardReplyVO> list(
		@Param("pageObject") PageObject pageObject,
		@Param("no") Long no);
	// 2. write
	public Integer write(BoardReplyVO vo);
	// 3. update
	public Integer update(BoardReplyVO vo);
	// 4. delete
	public Integer delete(BoardReplyVO vo);
}
