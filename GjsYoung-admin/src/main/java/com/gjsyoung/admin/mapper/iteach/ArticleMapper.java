package com.gjsyoung.admin.mapper.iteach;

import com.gjsyoung.iteach.domain.Article;
import com.gjsyoung.iteach.vo.ArticleVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ArticleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    List<ArticleVo> selectByStatus(Integer status);

    List<ArticleVo> selectRandomByStatusLimit(@Param("status") Integer status, @Param("limit") Integer limit);

    List<ArticleVo> searchTitleLike(String title);

    List<ArticleVo> searchContentLike(String content);

    List<ArticleVo> selectByAuthorId(Integer authorId);

    Map queryDetailById(Integer articleId);

    int countAll();
}