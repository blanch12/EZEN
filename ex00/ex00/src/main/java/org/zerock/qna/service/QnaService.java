package org.zerock.qna.service;

import java.util.List;

import org.zerock.qna.vo.QnaVO;
import org.zerock.util.page.PageObject;

public interface QnaService {

	public List<QnaVO> list(PageObject pageObject);
	
	public Integer write(QnaVO vo);
	
	public QnaVO view(Long no);
	
	public Integer update(QnaVO vo);
	
	public Integer delete(QnaVO vo);
	
	public Integer deleteImage(QnaVO vo);
	
	public Integer writeReply(QnaVO vo);
	
	public Integer changeStatus(QnaVO vo);
}
