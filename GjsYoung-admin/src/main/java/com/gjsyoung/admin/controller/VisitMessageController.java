package com.gjsyoung.admin.controller;

import com.gjsyoung.admin.mapper.iteach.VisitLogMapper;
import com.gjsyoung.admin.utils.CommonUtils;
import com.gjsyoung.admin.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.*;

/**
 * create by cairuojin on 2018/11/13
 */
@Controller
public class VisitMessageController {

    @Autowired
    VisitLogMapper visitLogMapper;

    @RequestMapping("visitMessage")
    public ModelAndView visitMessage(){
        ModelAndView mav = new ModelAndView("visitMessage");

        //日时间段访问量
        Date yesterday = DateUtils.getDate(LocalDateTime.now().minusDays(1));//获得昨天的实例
        Date alterYesterday = DateUtils.getDate(LocalDateTime.now().minusDays(2));//获得前天的实例
        List<Map> todayLine = visitLogMapper.countHourByDay(new Date());
        List<Map> yesterdayLine = visitLogMapper.countHourByDay(yesterday);
        List<Map> afterYesterdayLine = visitLogMapper.countHourByDay(alterYesterday);
        String todayData = CommonUtils.lineMapToString(todayLine,"hour","count");
        mav.addObject("todayData",todayData);
        String yesterdayData = CommonUtils.lineMapToString(yesterdayLine,"hour","count");
        mav.addObject("yesterdayData",yesterdayData);
        String afterYesterdayData = CommonUtils.lineMapToString(afterYesterdayLine,"hour","count");
        mav.addObject("afterYesterdayData",afterYesterdayData);

        //平均时间段访问量
        List<Map> avg30Line = visitLogMapper.avgHourLastbyDay(30);
        String avg30Data = CommonUtils.lineMapToString(avg30Line,"hour","count");
        mav.addObject("avg30Data",avg30Data);
        List<Map> avg7Line = visitLogMapper.avgHourLastbyDay(7);
        String avg7Data = CommonUtils.lineMapToString(avg7Line,"hour","count");
        mav.addObject("avg7Data",avg7Data);
        List<Map> avg3Line = visitLogMapper.avgHourLastbyDay(3);
        String avg3Data = CommonUtils.lineMapToString(avg3Line,"hour","count");
        mav.addObject("avg3Data",avg3Data);


        //月趋势
        List<Map> thisMonth = visitLogMapper.countDaybyMonth(0);
        List<Map> LastMonth = visitLogMapper.countDaybyMonth(1);
        List<Map> afterLastMonth = visitLogMapper.countDaybyMonth(2);
        String thisMonthData = CommonUtils.lineMapToString(thisMonth,"day","count");
        mav.addObject("thisMonthData",thisMonthData);
        String LastMonthData = CommonUtils.lineMapToString(LastMonth,"day","count");
        mav.addObject("LastMonthData",LastMonthData);
        String afterLastMonthData = CommonUtils.lineMapToString(afterLastMonth,"day","count");
        mav.addObject("afterLastMonthData",afterLastMonthData);


        //柱图，分时间段
        StringBuffer bf1 = new StringBuffer();
        Map yesterdayChinaMap = new HashMap();
        yesterdayChinaMap.put("date",yesterday);
        yesterdayChinaMap.put("country","中国");
        List<Map> yesterdayChina = visitLogMapper.countHourByDaySelect(yesterdayChinaMap);
        List<Map> yesterdayNotChina = visitLogMapper.countHourByDayNotSelect(yesterdayChinaMap);
        Map treeMap = new TreeMap();
        for(Map map : yesterdayChina){
            treeMap.put(map.get("hour"),map.get("count"));
        }
        for(int i = 0 ; i < 24; i++){
            if(treeMap.get(i) == null)
                bf1.append(  "[" + i + "," + "0 ] ,");
            else
                bf1.append(  "[" + i + "," + Long.parseLong(treeMap.get(i).toString()) + "] ,");
        }
        String yesterdayChinaData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("yesterdayChinaData",yesterdayChinaData);
        bf1.setLength(0);
        treeMap.clear();

        for(Map map : yesterdayNotChina){
            treeMap.put(map.get("hour"),map.get("count"));
        }
        for(int i = 0 ; i < 24; i++){
            if(treeMap.get(i) == null)
                bf1.append(  "[" + i + "," + "0 ] ,");
            else
                bf1.append(  "[" + i + "," + Long.parseLong(treeMap.get(i).toString()) + "] ,");
        }
        String yesterdayNotChinaData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("yesterdayNotChinaData",yesterdayNotChinaData);
        bf1.setLength(0);



        //饼图1
        List<Map> notChinaCount = visitLogMapper.countALLNotChina();
        List<Map> regionData = visitLogMapper.countALLChinaGroupByRegion();
        regionData.add(notChinaCount.get(0));
        mav.addObject("regionData",regionData);

        //饼图2
        List<Map> tempTimeData = visitLogMapper.countAllGroupByTemptime();
            mav.addObject("tempTimeData",tempTimeData);

        mav.addObject("pageHeader",1);
        return mav;


    }


}
