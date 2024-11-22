package org.zerock.member.service;

import java.util.List;
import org.zerock.member.vo.AddrVO;

public interface AddrService {
    List<AddrVO> getAllAddrs(String memberId); // 모든 주소 조회
    boolean insertAddr(AddrVO addrVO); // 주소 추가
    boolean updateAddr(AddrVO addrVO); // 주소 업데이트
    boolean deleteAddr(int id, String memberId); // memberId 추가
    
    AddrVO getAddrById(int id); // 특정 주소 조회

    // 새로운 기본 주소를 설정할 때 기존 기본 주소 해제
    boolean updateExistingDefault(String memberId);

    // 특정 주소를 기본 주소로 설정
    boolean setDefaultAddress(String memberId, int addrId);
}
