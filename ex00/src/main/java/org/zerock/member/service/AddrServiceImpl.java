package org.zerock.member.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.member.mapper.AddrMapper;
import org.zerock.member.vo.AddrVO;

@Service
public class AddrServiceImpl implements AddrService {

    @Autowired
    private AddrMapper addrMapper;
    
    @Override
    public AddrVO getAddrById(int id) {
        return addrMapper.getAddrById(id);
    }

    @Override
    public List<AddrVO> getAllAddrs(String memberId) {
        return addrMapper.getAllAddrs(memberId);
    }

    @Override
    public boolean insertAddr(AddrVO addrVO) {
        // 새로운 주소가 기본 주소로 설정된 경우, 기존 기본 주소 해제
        if ("Y".equals(addrVO.getIsDefault())) {
            addrMapper.updateExistingDefault(addrVO.getMemberId());
        }
        return addrMapper.insertAddr(addrVO) > 0;
    }

    @Override
    public boolean updateAddr(AddrVO addrVO) {
        // 기존 주소를 업데이트하면서 기본 주소로 설정할 경우, 다른 기본 주소를 해제
        if ("Y".equals(addrVO.getIsDefault())) {
            addrMapper.updateExistingDefault(addrVO.getMemberId());
        }
        return addrMapper.updateAddr(addrVO) > 0;
    }

    @Override
    public boolean deleteAddr(int id, String memberId) {
        return addrMapper.deleteAddr(id, memberId) > 0; // memberId 추가
    }

    @Override
    public boolean updateExistingDefault(String memberId) {
        return addrMapper.updateExistingDefault(memberId) > 0;
    }

    @Override
    @Transactional
    public boolean setDefaultAddress(String memberId, int addrId) {
        addrMapper.updateExistingDefault(memberId); // 기존 기본 주소를 'N'으로 설정
        return addrMapper.setDefaultAddr(addrId, memberId) > 0; // 새로운 기본 주소를 'Y'로 설정
    }
}
