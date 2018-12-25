package com.gjsyoung.iteach.config.i18n;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

/**
 * create by cairuojin on 2018/12/20
 * 国际化过滤器
 */
public class MyLocaleResolver implements LocaleResolver {

    /**
     * 每个路径均会通过此过滤器，获取session中的语言
     * @param httpServletRequest
     * @return
     */
    @Override
    public Locale resolveLocale(HttpServletRequest httpServletRequest) {
        //获取我们自己传入的参数
        String parameter = httpServletRequest.getParameter("language");
        Locale locale  = Locale.getDefault();   //默认语言
        if(!StringUtils.isEmpty(parameter)){    //有传入
            String[] split = parameter.split("_");
            locale= new Locale(split[0],split[1]);
            httpServletRequest.getSession().setAttribute("language",locale);
        } else {
            //如果没有传入，检测session
            Object language = httpServletRequest.getSession().getAttribute("language");
            if(language != null){
                locale = (Locale)language;
            }
        }
        return locale;
    }

    @Override
    public void setLocale(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Locale locale) {

    }
}