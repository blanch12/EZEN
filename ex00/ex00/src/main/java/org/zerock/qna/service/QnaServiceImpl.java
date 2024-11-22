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

	// QNA 글수정
	@Override
	public Integer update(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	// QNA 글삭제
	@Override
	public Integer delete(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

	// QNA 글수정중 이미지 변경처리
	@Override
	public Integer deleteImage(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteImage(vo);
	}

	// QNA 답변 작성
	@Override
	public Integer writeReply(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.writeReply(vo);
	}

	// QNA 글 상태 처리
	@Override
	public Integer changeStatus(QnaVO vo) {
		// TODO Auto-generated method stub
		return mapper.changeStatus(vo);
	}

	
}
