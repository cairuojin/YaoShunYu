package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.admin.domain.Author;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AuthorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Author record);

    int insertSelective(Author record);

    Author selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Author record);

    int updateByPrimaryKey(Author record);

    Author selectByAuthorId(Integer AuthorId);

    Author selectByNickname(String nickname);
}