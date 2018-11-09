package com.gjsyoung.admin.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * create by chenguitao on 2018/2/9
 */
public class DateUtils {

    /**
     * 返回两个日期间相差的天数
     * @param startTime
     * @param endTime
     * @return
     */
    public static Long getDays(Date startTime, Date endTime){
        LocalDate LocalstarTime=getLocalDate(startTime);
        LocalDate localendTime=getLocalDate(endTime);
        Long days= getDays(LocalstarTime,localendTime);
        return days;
    }
    /**
     * 返回两个日期间相差的天数
     * @param startTime
     * @param endTime
     * @return
     */
    public static Long getDays(LocalDate startTime,LocalDate endTime){
        Long days= ChronoUnit.DAYS.between(startTime,endTime);
        return days;
    }
    /**
     * 返回两个日期间相差的分钟数
     * @param startTime
     * @param endTime
     * @return
     */
    public static Long getMins(LocalDateTime startTime,LocalDateTime endTime){
        Long mins= ChronoUnit.MINUTES.between(startTime,endTime);
        return mins;
    }
    /**
     * 返回两个日期间的相差过程
     * 过程：相差几个月几天
     * @param startTime
     * @param endTime
     * @return months,days
     */
    public static Map<String,Object> getDaysAndMonths(Date startTime, Date endTime){
        Map<String,Object>dateMap=new HashMap<String,Object>();
        LocalDate LocalstarTime=getLocalDate(startTime);
        LocalDate localendTime= getLocalDate(endTime);
        Integer months=LocalstarTime.until(localendTime).getMonths();
        Integer days=LocalstarTime.until(localendTime).getDays();
        dateMap.put("months",months);
        dateMap.put("days",days);
        return dateMap;
    }
    /**
     * 返回两个日期间的相差过程
     * 过程：相差几个月几天
     * @param startTime
     * @param endTime
     * @return months,days
     */
    public static Map<String,Object> getDaysAndMonths(LocalDate startTime,LocalDate endTime){
        Map<String,Object>dateMap=new HashMap<String,Object>();
        Integer months=startTime.until(endTime).getMonths();
        Integer days=startTime.until(endTime).getDays();
        dateMap.put("months",months);
        dateMap.put("days",days);
        return dateMap;
    }

    /**
     * 转换成localdate类型
     * @param date
     * @return LocalDate 类型
     */
    public static LocalDate getLocalDate(Date date){
        ZoneId id=ZoneId.systemDefault();
        LocalDate localDate=date.toInstant().atZone(id).toLocalDate();
        return localDate;
    }
    /**
     * 转换成localdateTime类型
     * @param date
     * @return LocalDateTime 类型
     */
    public static LocalDateTime getLocalDateTime(Date date){
        ZoneId id=ZoneId.systemDefault();
        LocalDateTime localDateTime=date.toInstant().atZone(id).toLocalDateTime();
        return localDateTime;
    }
    /**
     * 转换成localdate类型
     * @param date
     * @return LocalDate 类型
     */
    public static LocalDate getLocalDate(String date){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date TempDate= null;
        try {
            TempDate = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return LocalDate.parse(sdf.format(TempDate));
    }
    /**
     * localdate 转化为date
     */
    public static Date getDate(LocalDate localDate){
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDate.atStartOfDay(zoneId);
        return Date.from(zdt.toInstant());
    }
    /**
     * localdateTime 转化为date
     */
    public static Date getDate(LocalDateTime localDateTime){
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        return Date.from(zdt.toInstant());
    }
}
