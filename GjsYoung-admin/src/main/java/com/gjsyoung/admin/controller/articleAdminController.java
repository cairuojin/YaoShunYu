package com.gjsyoung.admin.controller;

import com.gjsyoung.admin.domain.iteach.Article;
import com.gjsyoung.admin.mapper.iteach.ArticleMapper;
import com.gjsyoung.admin.vo.ArticleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * create by cairuojin on 2018/11/23
 */
@Controller
public class articleAdminController {

    @Autowired
    ArticleMapper articleMapper;


    /**
     * 进入文章录入页面，查找所有文章
     * @param page
     * @return
     */
    @RequestMapping("articleAdmin")
    public ModelAndView articleAdmin(Integer page, HttpSession session){
        ModelAndView mav = new ModelAndView("articleAdmin");
        List<ArticleVo> articleVos = articleMapper.selectAll();
        mav.addObject("articleVos",articleVos);
        session.setAttribute("pageHeader",6.1);
        return mav;
    }

    /**
     * 进入更新页面
     * @param id
     * @return
     */
    @RequestMapping("articleAdmin.update")
    public ModelAndView update(Integer id){
        ModelAndView mav = new ModelAndView("articleAdminUpdate");
        Article article = articleMapper.selectByPrimaryKey(id);
        mav.addObject("article",article);
        return mav;
    }

    /**
     * 修改文章  todo完善
     * @param article
     * @return
     */
    @RequestMapping("articleAdmin.updateMessage")
    @ResponseBody
    public String updateMessage(Article article, HttpSession session){
        try{
            articleMapper.updateByPrimaryKeySelective(article); //添加图片等
            session.setAttribute("pageHeader",6.1);
            return "OK";
        } catch (Exception e){
            return e.toString();
        }
    }


}
