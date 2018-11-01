package com.gjsyoung.admin.mapper.admin;

import com.gjsyoung.admin.domain.admin.VisitLog;
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

    int countAll();

}