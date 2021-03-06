package com.gjsyoung.iteach.mapper;

import com.gjsyoung.iteach.domain.AuthorApply;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AuthorApplyMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(AuthorApply record);

    int insertSelective(AuthorApply record);

    AuthorApply selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(AuthorApply record);

    int updateByPrimaryKey(AuthorApply record);
}