package org.zerock.member.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.member.vo.AddrVO;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

@Repository
public interface MemberMapper {

    // 일반 로그인
    public LoginVO login(LoginVO vo);

    // 회원 가입
    public Integer write(LoginVO vo);

    // 회원 목록 조회
    public List<LoginVO> list(PageObject pageObject);

    // 총 회원 수 조회
    public Long getTotalRow(PageObject pageObject);

    // 회원 상세 조회
    public LoginVO view(String id);

    // 회원 상태 변경
    public Integer changeStatus(LoginVO vo);

    // 회원 등급 변경
    public Integer changeGradeNo(LoginVO vo);
    
    public Integer conUpdate(String id);
	
	public Integer update(LoginVO vo);
	
	public Integer delete(LoginVO vo);

    // 카카오 사용자 조회
    public LoginVO findByKakaoId(String kakaoId);

    // 새로운 카카오 사용자 저장
    public void insertKakaoUser(LoginVO loginVO);

    // 네이버 사용자 조회
    public LoginVO findByNaverId(String naverId);

    // 새로운 네이버 사용자 저장
    public void insertNaverUser(LoginVO loginVO);
    
    // 회원 정보 수정
    public int updateMember(LoginVO vo);  // 회원 정보 업데이트 메서드 추가

    // 비밀번호 확인용 메서드
    public String getPasswordById(String id); // ID로 비밀번호 조회 메서드 추가
    
    int deleteMember(String id);  // 회원 탈퇴 메서드 추가
    
    List<AddrVO> getAllAddrs(String memberId);
}
