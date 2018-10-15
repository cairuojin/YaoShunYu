package com.gjsyoung.iteach.utils;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.Charset;

/**
 * @author cairuojin
 * @create 2018-08-26 9:44
 */
@Configuration
public class RestTemplateConfig {

    /**
     * RestTemplate交给Spring管理
     * @return
     */
    @Bean
    public RestTemplate getUTF8RestTemplate(){
        StringHttpMessageConverter m = new StringHttpMessageConverter(Charset.forName("UTF-8"));
        RestTemplate restTemplate = new RestTemplateBuilder().additionalMessageConverters(m).build();
        return restTemplate;
    }
}