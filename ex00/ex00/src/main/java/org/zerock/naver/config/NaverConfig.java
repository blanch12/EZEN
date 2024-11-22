package org.zerock.naver.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.zerock.naver.service.NaverService;
import org.zerock.naver.service.NaverServiceImpl;

@Configuration // 스프링 설정 클래스임을 나타냄
public class NaverConfig {

    // NaverService Bean 등록
    @Bean
    public NaverService naverService() {
        return new NaverServiceImpl(); // NaverService 구현체인 NaverServiceImpl 객체를 반환
    }
}
