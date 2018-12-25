package com.gjsyoung.iteach.config.i18n;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;

/**
 * create by cairuojin on 2018/12/20
 */
@Configuration
public class MyMVCConfig {

    //注册国际化设置
    @Bean
    public LocaleResolver localeResolver(){
        return  new MyLocaleResolver();
    }

    @Bean
    public ResourceBundleMessageSource messageSource(){
        ResourceBundleMessageSource resourceBundleMessageSource = new ResourceBundleMessageSource();
        resourceBundleMessageSource.setDefaultEncoding("UTF-8");
        //resourceBundleMessageSource.setCacheSeconds(0);
        resourceBundleMessageSource.setBasename("i18n/message");
        return resourceBundleMessageSource;
    }
}
