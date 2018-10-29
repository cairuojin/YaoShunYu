package com.gjsyoung.iteach.config;

import com.gjsyoung.iteach.service.VisitLogService;
import com.gjsyoung.iteach.utils.GetIpAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create by cairuojin on 2018/09/05
 * 首页配置器
 */
@Controller
public class DefaultView {

    @Autowired
    VisitLogService visitLogService;

    @RequestMapping({"/","/index"})
    public ModelAndView index(HttpSession session, HttpServletRequest request){
        String clientIpAddress = GetIpAddress.getClientIpAddress(request);
        if(clientIpAddress != null){
            visitLogService.recordVisitLog(clientIpAddress, session.getId());       //访问记录
        }
        ModelAndView nav = new ModelAndView();
        nav.setViewName("index");
        session.setAttribute("pageHeader", 0);
        return nav;
    }
    @RequestMapping("/text")
    public void text(HttpSession session){
    }
}
