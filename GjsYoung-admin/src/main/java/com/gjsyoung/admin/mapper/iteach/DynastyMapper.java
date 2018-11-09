package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.iteach.domain.Dynasty;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DynastyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dynasty record);

    int insertSelective(Dynasty record);

    Dynasty selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dynasty record);

    int updateByPrimaryKey(Dynasty record);

    List<Dynasty> selectAll();
}