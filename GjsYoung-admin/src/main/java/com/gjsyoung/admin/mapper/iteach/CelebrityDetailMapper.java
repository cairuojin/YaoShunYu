package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.admin.domain.iteach.CelebrityDetail;
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