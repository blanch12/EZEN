package org.zerock.myreview.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.myreview.vo.MyreviewVO;
import org.zerock.util.page.PageObject;

@Repository
public interface MyreviewMapper {

	public List<MyreviewVO> list(PageObject pageObject);
	
	public Long getTotalRow(PageObject pageObject);
	
	public Integer write(MyreviewVO vo);
}
