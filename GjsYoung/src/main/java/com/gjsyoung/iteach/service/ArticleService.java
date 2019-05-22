package com.gjsyoung.iteach.service;

import com.gjsyoung.iteach.vo.ArticleVo;

import java.util.List;
import java.util.Map;
import java.util.Set;

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
    public Set<ArticleVo> selectContentLike(String content);

    /**
     * 搜索作者相关
     * @param content
     * @return
     */
    public List<ArticleVo> selectAnthorLike(String content);
}
