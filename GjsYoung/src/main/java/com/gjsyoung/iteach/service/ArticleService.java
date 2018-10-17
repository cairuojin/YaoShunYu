package com.gjsyoung.iteach.service;

import com.gjsyoung.iteach.domain.Article;
import com.gjsyoung.iteach.vo.ArticleVo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * create by cairuojin on 2018/09/11
 */
public interface ArticleService {

    /**
     * 找寻文章
     * @param page
     * @return
     */
    public Map findArticle(Integer page);

    /**
     * 根据内容搜索相关
     * @param content
     * @return
     */
    public List<ArticleVo> selectContentLike(String content);

    /**
     * 搜索作者相关
     * @param content
     * @return
     */
    public List<ArticleVo> selectAnthorLike(String content);
}
