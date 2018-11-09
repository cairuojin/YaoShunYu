package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.iteach.domain.VisitLog;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
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

    int countAll();

    //查询那天的访问数目
    int countByDay(Date date);

    //查询近一周的访问数目
    int countThisWeek();

    //查询近一月的访问数目
    int countThisMonth();

    //根据日期查询该天每个小时的访问量
    List<Map> countHourByDay(Date date);
}