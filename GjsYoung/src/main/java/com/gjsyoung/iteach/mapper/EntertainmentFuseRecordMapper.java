package com.gjsyoung.iteach.mapper;

import com.gjsyoung.iteach.domain.EntertainmentFuseRecord;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface EntertainmentFuseRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EntertainmentFuseRecord record);

    int insertSelective(EntertainmentFuseRecord record);

    EntertainmentFuseRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EntertainmentFuseRecord record);

    int updateByPrimaryKey(EntertainmentFuseRecord record);
}