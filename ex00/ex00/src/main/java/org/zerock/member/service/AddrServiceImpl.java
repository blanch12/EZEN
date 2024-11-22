package org.zerock.member.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.member.mapper.AddrMapper;
import org.zerock.member.vo.AddrVO;

@Service
public class AddrServiceImpl implements AddrService {

    // AddrMapper 의존성 주입
    @Autowired
    private AddrMapper addrMapper;
    
    // 1. 주소 ID로 특정 주소 조회
    @Override
    public AddrVO getAddrById(int id) {
        return addrMapper.getAddrById(id); // 주어진 ID에 해당하는 주소 반환
    }

    // 2. 특정 회원의 모든 주소 조회
    @Override
    public List<AddrVO> getAllAddrs(String memberId) {
        return addrMapper.getAllAddrs(memberId); // 해당 회원의 모든 주소 리스트 반환
    }

    // 3. 새로운 주소 추가
    @Override
    public boolean insertAddr(AddrVO addrVO) {
        // 새로운 주소가 기본 주소로 설정된 경우, 기존 기본 주소 해제
        if ("Y".equals(addrVO.getIsDefault())) { 
            addrMapper.updateExistingDefault(addrVO.getMemberId()); // 기존 기본 주소 해제
        }
        // 주소 추가 성공 여부 반환
        return addrMapper.insertAddr(addrVO) > 0;
    }

    // 4. 주소 업데이트
    @Override
    public boolean updateAddr(AddrVO addrVO) {
        // 주소가 기본 주소로 설정된 경우, 기존 기본 주소 해제
        if ("Y".equals(addrVO.getIsDefault())) {
            addrMapper.updateExistingDefault(addrVO.getMemberId()); // 기존 기본 주소 해제
        }
        // 주소 업데이트 성공 여부 반환
        return addrMapper.updateAddr(addrVO) > 0;
    }

    // 5. 주소 삭제
    @Override
    public boolean deleteAddr(int id, String memberId) {
        // 주소 삭제 성공 여부 반환
        return addrMapper.deleteAddr(id, memberId) > 0; // memberId 추가하여 해당 회원의 주소만 삭제
    }

    // 6. 특정 회원의 기존 기본 주소 해제
    @Override
    public boolean updateExistingDefault(String memberId) {
        // 기존 기본 주소 해제 성공 여부 반환
        return addrMapper.updateExistingDefault(memberId) > 0;
    }

    // 7. 새로운 기본 주소 설정
    @Override
    @Transactional // 트랜잭션 관리 - 두 작업이 모두 성공해야 변경 사항이 반영됨
    public boolean setDefaultAddress(String memberId, int addrId) {
        // 기존 기본 주소를 'N'으로 설정
        addrMapper.updateExistingDefault(memberId);
        // 새로운 기본 주소를 'Y'로 설정
        return addrMapper.setDefaultAddr(addrId, memberId) > 0;
    }
}
