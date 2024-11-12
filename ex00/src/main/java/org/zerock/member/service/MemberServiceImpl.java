package org.zerock.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.member.mapper.MemberMapper;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("memberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public LoginVO login(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}

	@Override
	public Integer write(LoginVO vo) {
		// TODO Auto-generated method stub
		Integer result = mapper.write(vo);
		return result;
	}

	@Override
	public List<LoginVO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public LoginVO view(String id) {
		// TODO Auto-generated method stub
		return mapper.view(id);
	}

	@Override
	public Integer changeStatus(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.changeStatus(vo);
	}

	@Override
	public Integer changeGradeNo(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.changeGradeNo(vo);
	}

	@Override
	public Integer conUpdate(String id) {
		// TODO Auto-generated method stub
		return mapper.conUpdate(id);
	}

	@Override
	public Integer update(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public Integer delete(LoginVO vo) {
		// TODO Auto-generated method stub
		return mapper.delete(vo);
	}

}
