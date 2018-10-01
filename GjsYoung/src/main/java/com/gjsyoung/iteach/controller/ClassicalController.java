package com.gjsyoung.iteach.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjsyoung.iteach.domain.Classical;
import com.gjsyoung.iteach.domain.ClassicalDetail;
import com.gjsyoung.iteach.mapper.ClassicalDetailMapper;
import com.gjsyoung.iteach.mapper.ClassicalMapper;
import com.gjsyoung.iteach.utils.CommonUtils;
import com.gjsyoung.iteach.vo.ArticleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * create by cairuojin on 2018/09/25
 * 文言文controller
 */
@Controller
public class ClassicalController {

    @Autowired
    ClassicalMapper classicalMapper;

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    ClassicalDetailMapper classicalDetailMapper;

    final String OrdeyByTime = "lastUpdateTime desc";

    /**
     * 跳转到文言文页面
     * @param page
     * @param session
     * @return
     */
    @RequestMapping("/classical")
    public ModelAndView classical(Integer page, HttpSession session){
        ModelAndView nav = new ModelAndView("classical");
        PageHelper.startPage(page,12,OrdeyByTime);
        List<Classical> classicals = classicalMapper.selectAll();
        PageInfo pageInfo = new PageInfo<>(classicals,12);  //分页信息
        session.setAttribute("pageHeader",2);//头
        nav.addObject("classicals",classicals);
        nav.addObject("totalPage",pageInfo.getPages());
        nav.addObject("random",commonUtils.getRandomInt(5));
        nav.addObject("page",page);
        return nav;
    }

    /**
     * 文言文详细页面
     * @param classicalId
     * @return
     */
    @RequestMapping("/classicalDetail/{id}")
    public ModelAndView celebrityEdit(@PathVariable("id") int classicalId){
        //todo 保留历史记录
        Classical classical = classicalMapper.selectByPrimaryKey(classicalId);
        if(classical == null)
            return commonUtils.throwException("找不到该文言文信息哦！");
        List<ClassicalDetail> classicalDetails = classicalDetailMapper.queryDetailById(classicalId);
        ModelAndView mav = new ModelAndView("classicalDetail");
        mav.addObject("classicalDetails",classicalDetails);
        mav.addObject("classical",classical);
        return mav;
    }
}
