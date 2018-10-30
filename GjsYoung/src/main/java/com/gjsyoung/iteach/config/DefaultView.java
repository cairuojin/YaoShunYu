package com.gjsyoung.iteach.config;

import com.gjsyoung.iteach.mapper.*;
import com.gjsyoung.iteach.service.VisitLogService;
import com.gjsyoung.iteach.utils.GetIpAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

    @Autowired
    CelebrityMapper celebrityMapper;

    @Autowired
    VisitLogMapper visitLogMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    ArticleMapper articleMapper;


    @Value("${Local}")
    String local;

    /**
     * 进入首页
     * @param session
     * @param request
     * @return
     */
    @RequestMapping({"/","/index"})
    public ModelAndView index(HttpSession session, HttpServletRequest request){
        String clientIpAddress = GetIpAddress.getClientIpAddress(request);
        if(clientIpAddress != null && "0".equals(local)){
            visitLogService.recordVisitLog(clientIpAddress, session.getId());       //访问记录
        }
        ModelAndView nav = new ModelAndView();
        nav.setViewName("index");
        nav.addObject("celebrityNum",celebrityMapper.countAll());
        nav.addObject("visitNum",visitLogMapper.countAll());
        nav.addObject("userNum",userMapper.countAll() * 10);
        nav.addObject("articleNum",articleMapper.countAll());
        session.setAttribute("pageHeader", 0);
        return nav;
    }
    @RequestMapping("/text")
    public void text(HttpSession session){
    }
}
