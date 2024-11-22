package org.zerock.naver.service;

import org.zerock.naver.vo.NaverUser;

public interface NaverService {
    
    // 네이버 인증 코드와 state 값으로 Access Token 요청
    String getAccessToken(String code, String state) throws Exception;

    // Access Token을 사용하여 사용자 정보 조회
    NaverUser getUserInfo(String accessToken) throws Exception;
}
