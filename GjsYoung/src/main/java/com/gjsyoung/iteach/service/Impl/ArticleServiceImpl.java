package com.gjsyoung.iteach.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjsyoung.iteach.mapper.ArticleMapper;
import com.gjsyoung.iteach.mapper.UserMapper;
import com.gjsyoung.iteach.service.ArticleService;
import com.gjsyoung.iteach.vo.ArticleVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * create by cairuojin on 2018/09/11
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    private static final Logger logger = LoggerFactory.getLogger(ArticleServiceImpl.class);

    @Autowired
    ArticleMapper articleMapper;

    @Autowired
    UserMapper userMapper;

    final String OrdeyByTime = "lastUpdateTime desc";


    @Override
    public Map findArticle(Integer page) {
        List<ArticleVo> top3 = articleMapper.selectRandomByStatusLimit(1, 3); //随机找寻置顶的3个文章
        PageHelper.startPage(page,7,OrdeyByTime);
        List<ArticleVo> newArticle = articleMapper.selectByStatus(0);//找寻最新的文章
        PageInfo pageInfo = new PageInfo<>(newArticle,7);  //分页信息
        List<ArticleVo> articles = new ArrayList<>();
        articles.addAll(top3);
        articles.addAll(newArticle);
        Map map = new HashMap<>();
        map.put("pageInfo",pageInfo);
        map.put("articles",articles);
        return map;
    }

    @Override
    public List<ArticleVo> selectContentLike(String value) {
        List<ArticleVo> articles = new ArrayList<>();
        PageHelper.startPage(0, 15, OrdeyByTime);
        articles.addAll(articleMapper.searchTitleLike(value));//搜索标题相似+内容相似
        if(articles.size() != 15){
            PageHelper.startPage(0,15-articles.size(),OrdeyByTime);
            articles.addAll(articleMapper.searchContentLike(value));
        }
        return articles;
    }

    @Override
    public List<ArticleVo> selectAnthorLike(String value) {
        Integer id = userMapper.selectByNickname(value);    //根据nicknane查id
        List<ArticleVo> articles = articleMapper.selectByAuthorId(id);
        return articles;
    }
}
