package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.admin.domain.iteach.VisitLog;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface VisitLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VisitLog record);

    int insertSelective(VisitLog record);

    VisitLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VisitLog record);

    int updateByPrimaryKey(VisitLog record);

    VisitLog selectBySid(String sid);

    List<VisitLog> selectAll();

    int countAll();

    //查询那天的访问数目（总数目）
    int countByDay(Date date);

    //查询近一周的访问数目（总数目）
    int countThisWeek();

    //查询近一月的访问数目（总数目）
    int countThisMonth();

    //根据日期查询该天每个小时的访问量
    List<Map> countHourByDay(Date date);
    List<Map> countHourByDaySelect(Map map);    //与输入map相同
    List<Map> countHourByDayNotSelect(Map map); //不等于输入map

    //近N天每个小时的访问量
    List<Map> avgHourLastbyDay(Integer day);

    //根据月 该月的每一天访问量 0本月  1上个月 2上上月
    List<Map> countDaybyMonth(Integer month);

    //查询时段访问
    List<Map> countAllGroupByTemptime();

    //查询国内分地区
    List<Map> countALLChinaGroupByRegion();

    //查询国内分地区
    List<Map> countALLNotChina();

    int selectRunningDay();





}