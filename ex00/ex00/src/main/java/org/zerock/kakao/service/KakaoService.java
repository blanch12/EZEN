package org.zerock.kakao.service;

import org.zerock.kakao.vo.KakaoUser;

public interface KakaoService {
	String getAccessToken(String code);
	KakaoUser getUserInfo(String accessToken);
}

