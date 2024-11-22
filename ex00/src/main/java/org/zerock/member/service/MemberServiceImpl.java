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
    
    // 회원 탈퇴 메서드 추가
    @Override
    public boolean deleteMember(String id) {
        int result = mapper.deleteMember(id);
        return result > 0;  // 삭제가 성공적으로 이루어진 경우 true 반환
    }
    
    // 회원 정보 업데이트 메서드 추가
    @Override
    public boolean updateMember(LoginVO vo) {
        int result = mapper.updateMember(vo);
        return result > 0; // 업데이트 성공 시 true 반환
    }

    // 비밀번호 확인 메서드 추가
    @Override
    public boolean checkPassword(String id, String password) {
        String storedPassword = mapper.getPasswordById(id);
        return storedPassword != null && storedPassword.equals(password);
    }

    // 네이버 ID로 사용자 조회 메서드
    @Override
    public LoginVO findByNaverId(String naverId) {
        return mapper.findByNaverId(naverId);
    }
    
    // 새로운 네이버 사용자 저장 메서드
    @Override
    public void saveNaverUser(LoginVO loginVO) {
        mapper.insertNaverUser(loginVO);
    }

    @Override
    public LoginVO login(LoginVO vo) {
        return mapper.login(vo);
    }

    @Override
    public Integer write(LoginVO vo) {
        return mapper.write(vo);
    }

    @Override
    public List<LoginVO> list(PageObject pageObject) {
        pageObject.setTotalRow(mapper.getTotalRow(pageObject));
        return mapper.list(pageObject);
    }

    @Override
    public LoginVO view(String id) {
        return mapper.view(id);
    }

    @Override
    public Integer changeStatus(LoginVO vo) {
        return mapper.changeStatus(vo);
    }

    @Override
    public Integer changeGradeNo(LoginVO vo) {
        return mapper.changeGradeNo(vo);
    }

    // 카카오 ID로 사용자 조회 메서드
    @Override
    public LoginVO findByKakaoId(String kakaoId) {
        return mapper.findByKakaoId(kakaoId);
    }

    // 새로운 카카오 사용자 저장 메서드
    @Override
    public void saveKakaoUser(LoginVO loginVO) {
        mapper.insertKakaoUser(loginVO);
    }
}
