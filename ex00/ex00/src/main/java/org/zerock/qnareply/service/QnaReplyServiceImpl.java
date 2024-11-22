package org.zerock.qnareply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.qnareply.mapper.QnaReplyMapper;
import org.zerock.qnareply.vo.QnaReplyVO;
import org.zerock.util.page.PageObject;

import lombok.Setter;

// 자동생성 어노테이션
// @Controller, @RestController
// @Service
// @Repository
// @Component
// @~~Advice
@Service
@Qualifier("qnaReplyServiceImpl")
public class QnaReplyServiceImpl implements QnaReplyService {

	// 자동 DI
	@Setter(onMethod_ = @Autowired)
	private QnaReplyMapper mapper;
	
	@Override
	public List<QnaReplyVO> list(PageObject pageObject, Long no) {
		// TODO Auto-generated method stub
		// 전체 데이터 세팅 - 페이지 처리를 위해서
		pageObject.setTotalRow(mapper.getTotalRow(pageObject, no));
		return mapper.list(pageObject, no);
	}

	@Override
	public Integer write(QnaReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public Integer update(QnaReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public Integer delete(QnaReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

}