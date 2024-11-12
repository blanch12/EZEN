package org.zerock.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.qna.vo.QnaVO;
import org.zerock.util.page.PageObject;

@Repository
public interface QnaMapper {

	public List<QnaVO> list(PageObject pageObject);
	
	public Long getTotalRow(PageObject pageObject);
	
	public Integer write(QnaVO vo);
	
	public QnaVO view(Long no);
	
	public Integer viewStatus(QnaVO vo);
	
	public List<QnaVO> ownList(PageObject pageObject,@Param("id") String id);
}
