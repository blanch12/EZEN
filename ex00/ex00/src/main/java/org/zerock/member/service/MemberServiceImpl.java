package org.zerock.member.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.member.mapper.MemberMapper;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Qualifier("memberServiceImpl")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;
    
    // 1. 회원 상태 변경
    @Override
    public Integer conUpdate(String id) {
        // 회원의 상태를 변경하는 메서드 (예: 활성/비활성 상태)
        return mapper.conUpdate(id);
    }

    // 2. 회원 정보 수정
    @Override
    public Integer update(LoginVO vo) {
        // 회원 정보를 수정하는 메서드
        return mapper.update(vo);
    }

    // 3. 회원 삭제
    @Override
    public Integer delete(LoginVO vo) {
        // 회원 정보를 삭제하는 메서드
        return mapper.delete(vo);
    }
    
    // 4. 회원 탈퇴
    @Override
    public boolean deleteMember(String id) {
        // 회원 ID를 사용하여 회원을 탈퇴시키는 메서드
        int result = mapper.deleteMember(id);
        return result > 0;  // 삭제 성공 시 true 반환
    }
    
    // 5. 회원 정보 업데이트
    @Override
    public boolean updateMember(LoginVO vo) {
        // 회원 정보를 업데이트하는 메서드
        int result = mapper.updateMember(vo);
        return result > 0; // 업데이트 성공 시 true 반환
    }

    // 6. 비밀번호 확인
    @Override
    public boolean checkPassword(String id, String password) {
        // 주어진 ID에 해당하는 비밀번호를 조회하고 입력된 비밀번호와 비교
        String storedPassword = mapper.getPasswordById(id);
        return storedPassword != null && storedPassword.equals(password);
    }

    // 7. 네이버 ID로 사용자 조회
    @Override
    public LoginVO findByNaverId(String naverId) {
        // 네이버 ID로 사용자를 조회
        return mapper.findByNaverId(naverId);
    }
    
    // 8. 새로운 네이버 사용자 저장
    @Override
    public void saveNaverUser(LoginVO loginVO) {
        // 새로운 네이버 사용자를 저장
        mapper.insertNaverUser(loginVO);
    }

    // 9. 일반 로그인
    @Override
    public LoginVO login(LoginVO vo) {
        // 로그인 정보를 사용하여 일반 로그인을 처리
        return mapper.login(vo);
    }

    // 10. 회원 가입
    @Override
    public Integer write(LoginVO vo) {
        // 새 회원 가입 처리
        return mapper.write(vo);
    }

    // 11. 회원 목록 조회
    @Override
    public List<LoginVO> list(PageObject pageObject) {
        // 페이징 처리된 회원 목록을 조회
        pageObject.setTotalRow(mapper.getTotalRow(pageObject));
        return mapper.list(pageObject);
    }

    // 12. 회원 상세 조회
    @Override
    public LoginVO view(String id) {
        // 특정 회원의 상세 정보 조회
        return mapper.view(id);
    }

    // 13. 회원 상태 변경
    @Override
    public Integer changeStatus(LoginVO vo) {
        // 회원의 상태를 변경 (예: 활성/비활성 상태)
        return mapper.changeStatus(vo);
    }

    // 14. 회원 등급 변경
    @Override
    public Integer changeGradeNo(LoginVO vo) {
        // 회원의 등급을 변경 (예: 일반 회원 -> VIP 등)
        return mapper.changeGradeNo(vo);
    }

    // 15. 카카오 ID로 사용자 조회
    @Override
    public LoginVO findByKakaoId(String kakaoId) {
        // 카카오 ID로 사용자를 조회
        return mapper.findByKakaoId(kakaoId);
    }

    // 16. 새로운 카카오 사용자 저장
    @Override
    public void saveKakaoUser(LoginVO loginVO) {
        // 새로운 카카오 사용자를 저장
        mapper.insertKakaoUser(loginVO);
    }
}
