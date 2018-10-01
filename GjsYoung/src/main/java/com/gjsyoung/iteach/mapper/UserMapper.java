package com.gjsyoung.iteach.mapper;

import com.gjsyoung.iteach.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByActiveCode(String code);

    User selectByUsername(String username);

    List<User> selectAuthorsLimit(Integer limit);

    Integer selectByNickname(String nickname);
}