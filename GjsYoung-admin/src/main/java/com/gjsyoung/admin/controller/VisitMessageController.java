package com.gjsyoung.admin.controller;

import com.gjsyoung.admin.mapper.iteach.VisitLogMapper;
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

        bf1.setLength(0);
        for(Map map : afterYesterdayLine){
            bf1.append(  "[" + map.get("hour") + "," + map.get("count") + "] ,");
        }
        String afterYesterdayData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("afterYesterdayData",afterYesterdayData);
        bf1.setLength(0);


        //平均时间段访问量
        List<Map> avg30Line = visitLogMapper.avgHourLastbyDay(30);
        for(Map map : avg30Line){
            bf1.append(  "[" + map.get("hour") + "," + Long.parseLong(map.get("count").toString()) + "] ,");
        }
        String avg30Data = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("avg30Data",avg30Data);
        bf1.setLength(0);
        List<Map> avg7Line = visitLogMapper.avgHourLastbyDay(7);
        for(Map map : avg7Line){
            bf1.append(  "[" + map.get("hour") + "," + Long.parseLong(map.get("count").toString()) + "] ,");
        }
        String avg7Data = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("avg7Data",avg7Data);
        bf1.setLength(0);
        List<Map> avg3Line = visitLogMapper.avgHourLastbyDay(3);
        for(Map map : avg3Line){
            bf1.append(  "[" + map.get("hour") + "," + Long.parseLong(map.get("count").toString()) + "] ,");
        }
        String avg3Data = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("avg3Data",avg3Data);
        bf1.setLength(0);


        //月趋势
        List<Map> thisMonth = visitLogMapper.countDaybyMonth(0);
        List<Map> LastMonth = visitLogMapper.countDaybyMonth(1);
        List<Map> afterLastMonth = visitLogMapper.countDaybyMonth(2);
        for(Map map : thisMonth){
            bf1.append(  "[" + map.get("day") + "," + Long.parseLong(map.get("count").toString()) + "] ,");
        }
        String thisMonthData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("thisMonthData",thisMonthData);
        bf1.setLength(0);
        for(Map map : LastMonth){
            bf1.append(  "[" + map.get("day") + "," + Long.parseLong(map.get("count").toString()) + "] ,");
        }
        String LastMonthData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("LastMonthData",LastMonthData);
        bf1.setLength(0);
        for(Map map : afterLastMonth){
            bf1.append(  "[" + map.get("day") + "," + Long.parseLong(map.get("count").toString()) + "] ,");
        }
        String afterLastMonthData = bf1.deleteCharAt(bf1.length() - 1).toString();
        mav.addObject("afterLastMonthData",afterLastMonthData);
        bf1.setLength(0);


        //柱图，分时间段
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
