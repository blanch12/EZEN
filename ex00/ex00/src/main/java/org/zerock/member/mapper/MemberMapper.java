package org.zerock.member.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.member.vo.AddrVO;
import org.zerock.member.vo.LoginVO;
import org.zerock.util.page.PageObject;

@Repository
public interface MemberMapper {

    // 일반 로그인
    // 로그인 정보를 바탕으로 회원 인증을 수행하여 로그인 객체를 반환
    public LoginVO login(LoginVO vo);

    // 회원 가입
    // 새 회원을 등록하고 회원 ID를 반환
    public Integer write(LoginVO vo);

    // 회원 목록 조회
    // 페이징 처리를 위해 PageObject를 기반으로 회원 목록을 반환
    public List<LoginVO> list(PageObject pageObject);

    // 총 회원 수 조회
    // 페이지네이션 처리를 위한 전체 회원 수를 반환
    public Long getTotalRow(PageObject pageObject);

    // 회원 상세 조회
    // 주어진 회원 ID에 대한 상세 정보를 반환
    public LoginVO view(String id);

    // 회원 상태 변경
    // 회원의 상태를 활성화/비활성화 등으로 변경
    public Integer changeStatus(LoginVO vo);

    // 회원 등급 변경
    // 회원의 등급을 변경 (ex. 일반회원 -> VIP)
    public Integer changeGradeNo(LoginVO vo);
    
    // 회원 정보 수정
    // 회원 정보 업데이트 (회원 이름, 이메일 등)
    public Integer conUpdate(String id);
    
    // 회원 정보 수정
    // 회원의 정보(이름, 이메일 등)를 업데이트
    public Integer update(LoginVO vo);
    
    // 회원 삭제
    // 회원을 삭제 (회원 ID로 삭제)
    public Integer delete(LoginVO vo);

    // 카카오 사용자 조회
    // 카카오 로그인 시, 카카오 ID로 사용자를 조회
    public LoginVO findByKakaoId(String kakaoId);

    // 새로운 카카오 사용자 저장
    // 카카오 로그인으로 새 사용자 정보를 저장
    public void insertKakaoUser(LoginVO loginVO);

    // 네이버 사용자 조회
    // 네이버 로그인 시, 네이버 ID로 사용자를 조회
    public LoginVO findByNaverId(String naverId);

    // 새로운 네이버 사용자 저장
    // 네이버 로그인으로 새 사용자 정보를 저장
    public void insertNaverUser(LoginVO loginVO);
    
    // 회원 정보 수정
    // 회원 정보를 업데이트하는 메소드 (이메일, 이름 등)
    public int updateMember(LoginVO vo);

    // 비밀번호 확인용 메서드
    // 회원 ID로 비밀번호를 조회
    public String getPasswordById(String id); 
    
    // 회원 탈퇴 메서드
    // 회원 ID로 회원 탈퇴를 처리하는 메소드
    public int deleteMember(String id);
    
    // 특정 회원의 모든 주소 조회
    // 주어진 회원 ID에 대한 모든 주소 정보를 반환
    public List<AddrVO> getAllAddrs(String memberId);
}
