package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.iteach.domain.Classical;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ClassicalMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Classical record);

    int insertSelective(Classical record);

    Classical selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Classical record);

    int updateByPrimaryKey(Classical record);

    List<Classical> selectAll();

    int countAll();
}