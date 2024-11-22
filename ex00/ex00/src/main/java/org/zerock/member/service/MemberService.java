package org.zerock.member.service;

import java.util.List;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

public interface MemberService {
    
    // 1. 회원 상태 변경 (회원의 상태를 활성화/비활성화 등으로 변경)
    public Integer conUpdate(String id);
    
    // 2. 회원 정보 수정
    public Integer update(LoginVO vo);
    
    // 3. 회원 탈퇴
    public Integer delete(LoginVO vo);

    // 4. 일반 로그인
    public LoginVO login(LoginVO vo); // 로그인 정보를 사용하여 로그인 처리

    // 5. 회원 가입
    public Integer write(LoginVO vo); // 새 회원 가입 처리

    // 6. 회원 목록 조회
    public List<LoginVO> list(PageObject pageObject); // 페이징 처리된 회원 목록 조회

    // 7. 회원 상세 조회
    public LoginVO view(String id); // 특정 회원의 상세 정보 조회

    // 8. 회원 상태 변경
    public Integer changeStatus(LoginVO vo); // 회원의 상태를 변경 (예: 활성/비활성)

    // 9. 회원 등급 변경
    public Integer changeGradeNo(LoginVO vo); // 회원의 등급을 변경 (예: 일반 회원, VIP 등)

    // 10. 카카오 로그인
    public LoginVO findByKakaoId(String kakaoId); // 카카오 ID로 회원 정보 조회
    public void saveKakaoUser(LoginVO loginVO); // 새로운 카카오 사용자의 정보를 저장

    // 11. 네이버 로그인
    public LoginVO findByNaverId(String naverId); // 네이버 ID로 회원 정보 조회
    public void saveNaverUser(LoginVO loginVO); // 새로운 네이버 사용자의 정보를 저장

    // 12. 회원 정보 수정
    public boolean updateMember(LoginVO vo);  // 회원 정보를 수정하는 메서드 (예: 이름, 이메일 등)

    // 13. 비밀번호 확인
    public boolean checkPassword(String id, String password); // 주어진 ID와 비밀번호를 확인하는 메서드

    // 14. 회원 탈퇴
    public boolean deleteMember(String id); // 특정 회원을 탈퇴시키는 메서드
}
