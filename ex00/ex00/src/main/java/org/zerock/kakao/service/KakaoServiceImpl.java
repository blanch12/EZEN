package org.zerock.kakao.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.zerock.kakao.vo.KakaoUser;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class KakaoServiceImpl implements KakaoService {

    private static final String CLIENT_ID = "500f97700c324d62a552a79bdbf68945"; // 카카오 REST API 키
    private static final String REDIRECT_URI = "http://localhost/member/kakao/callback"; // 리디렉트 URI
    private static final String TOKEN_URL = "https://kauth.kakao.com/oauth/token";
    private static final String USER_INFO_URL = "https://kapi.kakao.com/v2/user/me";
    private final RestTemplate restTemplate = new RestTemplate();
    private final Logger logger = LoggerFactory.getLogger(KakaoServiceImpl.class);

    @Override
    public String getAccessToken(String code) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        String body = "grant_type=authorization_code"
                + "&client_id=" + CLIENT_ID
                + "&redirect_uri=" + REDIRECT_URI
                + "&code=" + code;

        HttpEntity<String> entity = new HttpEntity<>(body, headers);
        try {
            ResponseEntity<String> response = restTemplate.exchange(TOKEN_URL, HttpMethod.POST, entity, String.class);
            JSONObject jsonObject = new JSONObject(response.getBody());
            
            String accessToken = jsonObject.getString("access_token");
            logger.info("Received access token: " + accessToken);  // 액세스 토큰 출력
            
            return jsonObject.getString("access_token");
        } catch (Exception e) {
            logger.error("Failed to get access token from Kakao API", e);
            throw new RuntimeException("카카오 액세스 토큰을 가져오는 데 실패했습니다.");
        }
    }

    @Override
    public KakaoUser getUserInfo(String accessToken) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);
        try {
            ResponseEntity<String> response = restTemplate.exchange(USER_INFO_URL, HttpMethod.GET, entity, String.class);

            if (!response.getStatusCode().is2xxSuccessful()) {
                logger.error("Failed to retrieve user info: Status code = " + response.getStatusCode());
                logger.error("Response body: " + response.getBody());
                throw new RuntimeException("카카오 사용자 정보를 가져오는 데 실패했습니다.");
            }

            // 응답 전체를 로그로 출력하여 확인
            logger.info("카카오 API 응답 데이터: " + response.getBody());

            JSONObject jsonObject = new JSONObject(response.getBody());
            KakaoUser user = new KakaoUser();
            user.setId(jsonObject.getLong("id"));

            // kakao_account와 profile 필드에서 닉네임과 프로필 이미지를 가져옴
            if (jsonObject.has("kakao_account")) {
                JSONObject kakaoAccount = jsonObject.getJSONObject("kakao_account");
                if (kakaoAccount.has("profile")) {
                    JSONObject profile = kakaoAccount.getJSONObject("profile");
                    user.setNickname(profile.optString("nickname", "unknown"));
                    user.setProfileImage(profile.optString("profile_image_url", null));
                } else {
                    logger.warn("Profile information not found in kakao_account.");
                    user.setNickname("unknown"); // 기본값 설정
                }
            } else {
                logger.warn("kakao_account not found in response.");
                user.setNickname("unknown"); // 기본값 설정
            }

            return user;
        } catch (Exception e) {
            logger.error("Failed to retrieve user information from Kakao API", e);
            throw new RuntimeException("카카오 사용자 정보를 가져오는 데 실패했습니다.");
        }
    }
}
