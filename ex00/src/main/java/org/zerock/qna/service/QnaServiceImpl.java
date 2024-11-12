package org.zerock.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.qna.mapper.QnaMapper;
import org.zerock.qna.vo.QnaVO;
import org.zerock.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("qnaServiceImpl")
public class QnaServiceImpl implements QnaService{
	
	@Setter(onMethod_ = @Autowired)
	private QnaMapper mapper;
	
	// QnA 리스트(관리자)
	@Override
	public List<QnaVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	// QnA 글쓰기
	@Override
	public Integer write(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}
	
	// QnA 글보기
	@Override
	public QnaVO view(Long no) {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	// 관리자가 글 열람시 처리상태 변경 처리
	@Override
	public Integer viewStatus(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.viewStatus(vo);
	}

	// QnA 리스트(일반 회원)
	@Override
	public List<QnaVO> ownList(PageObject pageObject, String id) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.ownList(pageObject, id);
	}

}
