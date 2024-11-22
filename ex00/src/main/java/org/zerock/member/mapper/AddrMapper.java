package org.zerock.member.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.zerock.member.vo.AddrVO;
import java.util.List;

@Mapper
public interface AddrMapper {
    List<AddrVO> getAllAddrs(String memberId); // 모든 주소 조회
    int insertAddr(AddrVO addrVO); // 주소 추가
    int updateAddr(AddrVO addrVO); // 주소 업데이트
    int deleteAddr(@Param("id") int id, @Param("memberId") String memberId); // 주소 삭제

    // 특정 memberId의 기존 기본 주소를 해제
    int updateExistingDefault(String memberId);

    // 특정 주소를 기본 주소로 설정
    int setDefaultAddr(@Param("addrId") int addrId, @Param("memberId") String memberId);

    // 특정 주소 조회 (ID로 조회)
    AddrVO getAddrById(int id); // 특정 주소 조회
}
