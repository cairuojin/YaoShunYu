package com.gjsyoung.iteach.mapper;

import com.gjsyoung.iteach.domain.VisitLog;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface VisitLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VisitLog record);

    int insertSelective(VisitLog record);

    VisitLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VisitLog record);

    int updateByPrimaryKey(VisitLog record);
}