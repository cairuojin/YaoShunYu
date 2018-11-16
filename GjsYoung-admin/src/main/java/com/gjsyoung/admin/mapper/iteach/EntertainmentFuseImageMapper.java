package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.admin.domain.iteach.EntertainmentFuseImage;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface EntertainmentFuseImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EntertainmentFuseImage record);

    int insertSelective(EntertainmentFuseImage record);

    EntertainmentFuseImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EntertainmentFuseImage record);

    int updateByPrimaryKey(EntertainmentFuseImage record);

    List<EntertainmentFuseImage> selectAllByStatus(Integer status);
}