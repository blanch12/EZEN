package org.zerock.member.service;

import java.util.List;
import org.zerock.member.vo.AddrVO;

public interface AddrService {

    // 모든 주소 조회
    // 주어진 memberId에 대한 모든 주소를 반환
    List<AddrVO> getAllAddrs(String memberId);

    // 주소 추가
    // 새 주소 정보를 추가하고 성공 여부를 반환
    boolean insertAddr(AddrVO addrVO);

    // 주소 업데이트
    // 주어진 주소 정보를 업데이트하고 성공 여부를 반환
    boolean updateAddr(AddrVO addrVO);

    // 주소 삭제
    // 주어진 주소 ID와 memberId로 주소를 삭제하고 성공 여부를 반환
    boolean deleteAddr(int id, String memberId);

    // 특정 주소 조회
    // 주소 ID를 이용해 특정 주소를 반환
    AddrVO getAddrById(int id);

    // 새로운 기본 주소를 설정할 때 기존 기본 주소 해제
    // 회원의 기존 기본 주소를 해제하고 새로운 기본 주소를 설정 가능
    boolean updateExistingDefault(String memberId);

    // 특정 주소를 기본 주소로 설정
    // 주어진 주소를 기본 주소로 설정하고 성공 여부를 반환
    boolean setDefaultAddress(String memberId, int addrId);
}
