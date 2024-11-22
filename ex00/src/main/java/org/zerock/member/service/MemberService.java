package org.zerock.member.service;

import java.util.List;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

public interface MemberService {
	
	public Integer conUpdate(String id);
	
	public Integer update(LoginVO vo);
	
	public Integer delete(LoginVO vo);

    // 일반 로그인
    public LoginVO login(LoginVO vo);
    
    public Integer write(LoginVO vo);
    
    public List<LoginVO> list(PageObject pageObject);
    
    public LoginVO view(String id); 
    
    public Integer changeStatus(LoginVO vo);
    
    public Integer changeGradeNo(LoginVO vo);

    // 카카오 로그인
    LoginVO findByKakaoId(String kakaoId); // 카카오 ID를 String 타입으로 변경
    void saveKakaoUser(LoginVO loginVO); // 새로운 카카오 사용자 저장
    
    // 네이버 로그인
    LoginVO findByNaverId(String naverId); // 네이버 ID로 사용자 조회
    void saveNaverUser(LoginVO loginVO);   // 네이버 사용자 정보 저장
    
    // 회원 정보 수정
    boolean updateMember(LoginVO vo);  // 회원 정보 업데이트 메서드 추가
    
    // 비밀번호 확인
    boolean checkPassword(String id, String password); // 비밀번호 확인 메서드 추가
    boolean deleteMember(String id);
}
