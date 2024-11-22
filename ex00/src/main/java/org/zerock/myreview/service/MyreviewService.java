package org.zerock.myreview.service;

import java.util.List;

import org.zerock.myreview.vo.MyreviewVO;
import org.zerock.util.page.PageObject;

public interface MyreviewService {

	public List<MyreviewVO> list(PageObject pageObject);
	
	public Integer write(MyreviewVO vo);
}
