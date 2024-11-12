package org.zerock.qnareply.service;

import java.util.List;

import org.zerock.boardreply.vo.BoardReplyVO;
import org.zerock.qnareply.vo.QnaReplyVO;
import org.zerock.util.page.PageObject;

public interface QnaReplyService {

	// 1. list
	public List<QnaReplyVO> list(PageObject pageObject, Long no);
	// 2. write
	public Integer write(QnaReplyVO vo);
	// 3. update
	public Integer update(QnaReplyVO vo);
	// 4. delete
	public Integer delete(QnaReplyVO vo);
}
