package org.zerock.naver.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.zerock.naver.service.NaverService;
import org.zerock.naver.service.NaverServiceImpl;

@Configuration
public class NaverConfig {

    @Bean
    public NaverService naverService() {
        return new NaverServiceImpl();
    }
}
