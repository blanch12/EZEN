package org.zerock.member.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

@Repository
public interface MemberMapper {

	// login
	public LoginVO login(LoginVO vo);
	
	public Integer write(LoginVO vo);
	
	public List<LoginVO> list(PageObject pageObject);
	
	public Long getTotalRow(PageObject pageObject);
	
	public LoginVO view(String id);
	
	public Integer changeStatus(LoginVO vo);
	
	public Integer changeGradeNo(LoginVO vo);
}
