package com.gjsyoung.admin.mapper.admin;

import com.gjsyoung.admin.domain.admin.UpdateLog;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UpdateLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UpdateLog record);

    int insertSelective(UpdateLog record);

    UpdateLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UpdateLog record);

    int updateByPrimaryKey(UpdateLog record);

    List<UpdateLog> selectOrderTimeLimit(Integer limit);
}