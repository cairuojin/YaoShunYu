package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.iteach.domain.Celebrity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CelebrityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Celebrity record);

    int insertSelective(Celebrity record);

    Celebrity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Celebrity record);

    int updateByPrimaryKeyWithBLOBs(Celebrity record);

    int updateByPrimaryKey(Celebrity record);

    List<Celebrity> selectAll();

    Celebrity selectByName(String name);

    List<Celebrity> selectByNameLike(String name);

    List<Celebrity> selectByDynasty(Integer dynasty);

    int countAll();
}