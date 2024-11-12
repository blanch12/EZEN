package org.zerock.qna.service;

import java.util.List;

import org.zerock.qna.vo.QnaVO;
import org.zerock.util.page.PageObject;

public interface QnaService {

	public List<QnaVO> list(PageObject pageObject);
	
	public Integer write(QnaVO vo);
	
	public QnaVO view(Long no);
	
	public Integer viewStatus(QnaVO vo);
	
	public List<QnaVO> ownList(PageObject pageObject, String id);
}
