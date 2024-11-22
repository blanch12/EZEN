package org.zerock.kakao.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.zerock.kakao.service.KakaoService;
import org.zerock.kakao.service.KakaoServiceImpl;

@Configuration
public class KakaoConfig {

    @Bean
    public KakaoService kakaoService() {
        return new KakaoServiceImpl();
    }
}
