package org.zerock.naver.service;

import org.zerock.naver.vo.NaverUser;

public interface NaverService {
    
    // 네이버 인증 코드로 Access Token 요청
    String getAccessToken(String code, String state) throws Exception;

    // Access Token으로 사용자 정보 조회
    NaverUser getUserInfo(String accessToken) throws Exception;
}
