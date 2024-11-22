package org.zerock.myreview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.myreview.mapper.MyreviewMapper;
import org.zerock.myreview.vo.MyreviewVO;
import org.zerock.util.page.PageObject;

import lombok.Setter;

@Service
@Qualifier("myreviewServiceImpl")
public class MyreviewServiceImpl implements MyreviewService{

	@Setter(onMethod_ = @Autowired)
	private MyreviewMapper mapper;
	
	@Override
	public List<MyreviewVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public Integer write(MyreviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

}
