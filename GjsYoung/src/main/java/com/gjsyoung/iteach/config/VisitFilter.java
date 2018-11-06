package com.gjsyoung.iteach.config;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.iteach.mq.Sender;
import com.gjsyoung.iteach.utils.GetIpAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * create by cairuojin on 2018/10/31
 * 全局过滤器
 */
@Component
@WebFilter(urlPatterns = "/*", filterName = "VisitFilter")
public class VisitFilter implements Filter {

    @Autowired
    Sender sender;

    //本地开关
    @Value("${Local}")
    String local;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    /**
     * 记录访问记录
     * @param servletRequest
     * @param servletResponse
     * @param filterChain
     */
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        if (request.getRequestURI().indexOf(".") == -1) {//拒绝静态请求
            String sessionId = request.getSession().getId();
            String clientIpAddress = GetIpAddress.getClientIpAddress(request);
            if(clientIpAddress != null && "0".equals(local)){
                Map data = new HashMap();
                data.put("clientIpAddress",clientIpAddress);
                data.put("sessionId",sessionId);
                String dataJson = JSON.toJSONString(data);
                sender.sendLog(dataJson);
            }
        }
        filterChain.doFilter(request, servletResponse);
    }

    @Override
    public void destroy() {

    }
}