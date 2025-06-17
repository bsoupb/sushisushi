package com.bsoupb.sushisushi.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RestControllerAdvice
public class SecurityConfig {
    private final JwtTokenProvider j
}
