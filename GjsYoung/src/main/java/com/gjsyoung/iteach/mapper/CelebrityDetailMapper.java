package com.gjsyoung.iteach.mapper;

import com.gjsyoung.iteach.domain.CelebrityDetail;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CelebrityDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CelebrityDetail record);

    int insertSelective(CelebrityDetail record);

    CelebrityDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CelebrityDetail record);

    int updateByPrimaryKeyWithBLOBs(CelebrityDetail record);

    int updateByPrimaryKey(CelebrityDetail record);

    List<CelebrityDetail> selectByCelebrityId(int celebrityId);

    List<CelebrityDetail> selectAll();  //查询全部 慎用
}