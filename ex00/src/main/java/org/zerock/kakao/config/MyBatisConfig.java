package org.zerock.kakao.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "org.zerock.member.mapper") // 실제 MyBatis 매퍼가 있는 패키지로 수정
public class MyBatisConfig {
    // 이 클래스는 MyBatis 매퍼 경로 설정용으로 사용됩니다.
}

