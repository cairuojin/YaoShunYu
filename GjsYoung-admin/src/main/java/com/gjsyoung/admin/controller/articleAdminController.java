package com.gjsyoung.admin.controller;

import com.gjsyoung.admin.domain.iteach.Article;
import com.gjsyoung.admin.mapper.iteach.ArticleMapper;
import com.gjsyoung.admin.vo.ArticleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam.Mode;
import java.util.List;

/**
 * create by cairuojin on 2018/11/23
 */
@Controller
@RequestMapping("articleAdmin")
public class articleAdminController {

    @Autowired
    ArticleMapper articleMapper;


    /**
     * 进入文章录入页面，查找所有文章
     * @param page
     * @return
     */
    @RequestMapping
    public ModelAndView articleAdmin(Integer page){
        ModelAndView mav = new ModelAndView("articleAdmin");
        List<ArticleVo> articleVos = articleMapper.selectAll();
        mav.addObject("articleVos",articleVos);
        mav.addObject("pageHeader",6.1);
        return mav;
    }

    /**
     * 进入更新页面
     * @param id
     * @return
     */
    @RequestMapping("update")
    public ModelAndView update(Integer id){
        ModelAndView mav = new ModelAndView("articleAdminUpdate");
        Article article = articleMapper.selectByPrimaryKey(id);
        mav.addObject("article",article);
        return mav;
    }


}
