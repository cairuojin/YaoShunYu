package com.gjsyoung.admin.controller;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.admin.domain.admin.UpdateLog;
import com.gjsyoung.admin.mapper.admin.UpdateLogMapper;
import com.gjsyoung.admin.mapper.iteach.ArticleMapper;
import com.gjsyoung.admin.mapper.iteach.CelebrityMapper;
import com.gjsyoung.admin.mapper.iteach.ClassicalMapper;
import com.gjsyoung.admin.mapper.iteach.VisitLogMapper;
import com.gjsyoung.admin.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 首页controller
 */
@Controller
public class IndexController {

    @Autowired
    CelebrityMapper celebrityMapper;

    @Autowired
    ArticleMapper articleMapper;

    @Autowired
    ClassicalMapper classicalMapper;

    @Autowired
    VisitLogMapper visitLogMapper;

    @Autowired
    UpdateLogMapper updateLogMapper;

    /**
     * 管理系统首页
     * @return
     */
    @RequestMapping({"/","index"})
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView("index");
        //上端数据
        int celebrityNum = celebrityMapper.countAll();
        int classicalNum = classicalMapper.countAll();
        int articleNum = articleMapper.countAll();
        int todayVisitNum = visitLogMapper.countByDay(new Date());                                //今日访问人数
        Date yesterday = DateUtils.getDate(LocalDateTime.now().minusDays(1));                       //获得昨天的实例
        int yesterdayVisitNum = visitLogMapper.countByDay(yesterday);                                //昨日访问人数
        Date beforeYesterday = DateUtils.getDate(LocalDateTime.now().minusDays(2));                 //获得前天的实例
        int beforeYesterdayVisitNum = visitLogMapper.countByDay(beforeYesterday);                            //前日访问人数
        double yesterdayTrend =(double) Math.round((yesterdayVisitNum * 1.0 / beforeYesterdayVisitNum - 1) * 10000) /100;  //   昨天/前天-1
        double todayTrend =(double) Math.round((todayVisitNum * 1.0 / yesterdayVisitNum - 1) * 10000) /100;               //   今天/昨天-1
        mav.addObject("celebrityNum",celebrityNum);
        mav.addObject("classicalNum",classicalNum);
        mav.addObject("articleNum",articleNum);
        mav.addObject("todayTrend",todayTrend);
        mav.addObject("yesterdayTrend",yesterdayTrend);

        //折线图
        List<Map> todayLine = visitLogMapper.countHourByDay(new Date());
        List<Map> yesterdayLine = visitLogMapper.countHourByDay(yesterday);

        StringBuffer bf1 = new StringBuffer();
        for(Map map : todayLine){
            bf1.append(  "[" + map.get("hour") + "," + map.get("count") + "] ,");
        }
        String todayData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("todayData",todayData);
        bf1.setLength(0);
        for(Map map : yesterdayLine){
            bf1.append(  "[" + map.get("hour") + "," + map.get("count") + "] ,");
        }
        String yesterdayData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("yesterdayData",yesterdayData);

        //近三十天平均
        bf1.setLength(0);
        List<Map> avgLine = visitLogMapper.avgHourLastbyDay(30);
        for(Map map : avgLine){
            bf1.append(  "[" + map.get("hour") + "," + Long.parseLong(map.get("count").toString()) + "] ,");
        }
        String avgData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("avgData",avgData);

        //访问概要
        mav.addObject("todayVisitNum",todayVisitNum);
        mav.addObject("yesterdayVisitNum",yesterdayVisitNum);
        mav.addObject("beforeYesterdayVisitNum",beforeYesterdayVisitNum);
        mav.addObject("totalVisitNum",visitLogMapper.countAll());   //总访问量
        double avgWeekVisitNum = visitLogMapper.countThisWeek() * 1.0 / 7;
        mav.addObject("avgWeekVisitNum",Math.round(avgWeekVisitNum));//近一周平均
        double avgMonthVisitNum = visitLogMapper.countThisMonth() * 1.0 / 30;
        mav.addObject("avgMonthVisitNum",Math.round(avgMonthVisitNum));//近30天平均

        //版本表
        List<UpdateLog> updateLogs = updateLogMapper.selectOrderTimeLimit(5);
        mav.addObject("updateLogs",updateLogs);

        mav.addObject("pageHeader",0);
        return mav;
    }



}
