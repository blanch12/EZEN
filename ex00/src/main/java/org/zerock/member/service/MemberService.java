package org.zerock.member.service;

import java.util.List;

import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

public interface MemberService {

	// 로그인
	public LoginVO login(LoginVO vo);
	
	public Integer write(LoginVO vo);
	
	public List<LoginVO> list(PageObject pageObject);
	
	public LoginVO view(String id); 
	
	public Integer changeStatus(LoginVO vo);
	
	public Integer changeGradeNo(LoginVO vo);
}
