package com.gjsyoung.iteach.mapper;

import com.gjsyoung.iteach.domain.ClassicalDetail;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ClassicalDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ClassicalDetail record);

    int insertSelective(ClassicalDetail record);

    ClassicalDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ClassicalDetail record);

    int updateByPrimaryKey(ClassicalDetail record);

    List<ClassicalDetail> queryDetailById(Integer classicalId);
}