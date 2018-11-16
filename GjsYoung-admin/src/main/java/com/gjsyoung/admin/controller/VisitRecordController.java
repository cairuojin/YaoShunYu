package com.gjsyoung.admin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjsyoung.admin.domain.iteach.VisitLog;
import com.gjsyoung.admin.mapper.iteach.VisitLogMapper;
import com.gjsyoung.admin.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

/**
 * create by cairuojin on 2018/11/14
 */
@Controller
public class VisitRecordController {

    @Autowired
    VisitLogMapper visitLogMapper;

    @RequestMapping("visitRecord")
    public ModelAndView visitRecord(){
        ModelAndView mav = new ModelAndView("visitRecord");
        List<VisitLog> visitLogs = visitLogMapper.selectAll();  //访问记录表的全部
        mav.addObject("visitLogs",visitLogs);


        int todayVisitNum = visitLogMapper.countByDay(new Date());  //今日访问量
        Date yesterday = DateUtils.getDate(LocalDateTime.now().minusDays(1));
        int yesterdayVisitNum = visitLogMapper.countByDay(yesterday);                                //昨日访问量
        Date beforeYesterday = DateUtils.getDate(LocalDateTime.now().minusDays(2));
        int beforeYesterdayVisitNum = visitLogMapper.countByDay(beforeYesterday);                            //前日访问量
        double yesterdayTrend =(double) Math.round((yesterdayVisitNum * 1.0 / beforeYesterdayVisitNum - 1) * 10000) /100;  //   昨天/前天-1 昨日趋势
        double todayTrend =(double) Math.round((todayVisitNum * 1.0 / yesterdayVisitNum - 1) * 10000) / 100;               //   今天/昨天-1  今日趋势
        double todayAvgHour = (double)Math.round(todayVisitNum * 1.0 / LocalDateTime.now().getHour() * 100) / 100;      //今日平均每个小时

        int allCount = visitLogMapper.countAll();                               //总访问量
        double allAvgDay =  (double)Math.round(allCount * 1.0 / visitLogMapper.selectRunningDay() * 100) / 100 ;    //总平均每天
        double allAvgHour = (double)Math.round(allAvgDay / 24 * 100) / 100;                                        //总平均每个小时
        double thisweekAvgDay = (double)Math.round(visitLogMapper.countThisWeek() * 1.0 / 7 * 100) / 100 ;



        mav.addObject("todayVisitNum",todayVisitNum);
        mav.addObject("yesterdayVisitNum",yesterdayVisitNum);
        mav.addObject("beforeYesterdayVisitNum",beforeYesterdayVisitNum);
        mav.addObject("todayTrend",todayTrend);
        mav.addObject("yesterdayTrend",yesterdayTrend);
        mav.addObject("todayAvgHour",todayAvgHour);
        mav.addObject("allAvgHour",allAvgHour);
        mav.addObject("thisweekAvgDay",thisweekAvgDay);
        mav.addObject("allAvgDay",allAvgDay);
        mav.addObject("allCount",allCount);





        mav.addObject("pageHeader",2);
        return mav;
    }
}
