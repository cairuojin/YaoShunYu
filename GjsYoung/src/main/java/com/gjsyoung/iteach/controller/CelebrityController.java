package com.gjsyoung.iteach.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjsyoung.iteach.domain.Celebrity;
import com.gjsyoung.iteach.domain.CelebrityDetail;
import com.gjsyoung.iteach.domain.Dynasty;
import com.gjsyoung.iteach.mapper.CelebrityDetailMapper;
import com.gjsyoung.iteach.mapper.CelebrityMapper;
import com.gjsyoung.iteach.mapper.DynastyMapper;
import com.gjsyoung.iteach.utils.CommonUtils;
import com.gjsyoung.iteach.vo.ArticleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author cairuojin
 * @create 2018-09-15 11:49
 * 人物百科controller
 */
@Controller
public class CelebrityController {

    @Autowired
    CelebrityDetailMapper celebrityDetailMapper;

    @Autowired
    CelebrityMapper celebrityMapper;

    @Autowired
    DynastyMapper dynastyMapper;

    @Autowired
    CommonUtils commonUtils;



    /**
     * 跳转到人物百科页面
     * @param page
     * @param session
     * @return
     */
    @RequestMapping("/celebrity")
    public ModelAndView celebrity(Integer page, HttpSession session){
        ModelAndView nav = new ModelAndView("celebrity");
        List<Dynasty> dynasties = dynastyMapper.selectAll();
        PageHelper.startPage(page,24);      //todo 朝代排序 添加生辰字段或排序依据
        List<Celebrity> celebrities = celebrityMapper.selectAll();
        PageInfo pageInfo = new PageInfo<>(celebrities,24);  //分页信息
        nav.addObject("celebrities",celebrities);
        nav.addObject("page",page);
        nav.addObject("dynasties",dynasties);
        nav.addObject("totalPage",pageInfo.getPages());
        nav.addObject("random",commonUtils.getRandomInt(5));
        session.setAttribute("pageHeader",1);//头
        return nav;
    }

    /**
     * 跳转到人物详细界面
     * @param celebrityId  人物id
     * @return
     */
    @RequestMapping("/celebrityDetail")
    public ModelAndView celebrityDetail(int celebrityId){
        ModelAndView nav = new ModelAndView("celebrityDetail");
        Celebrity celebrity = celebrityMapper.selectByPrimaryKey(celebrityId);
        if(celebrity == null)
            return commonUtils.throwException("找不到该人物哦！");
        List<CelebrityDetail> celebrityDetails = celebrityDetailMapper.selectByCelebrityId(celebrityId);
        if(celebrityDetails == null || celebrityDetails.size() == 0)
            return commonUtils.throwException("找不到该人物信息哦！");
        nav.addObject("celebrity",celebrity);
        nav.addObject("celebrityDetails",celebrityDetails);
        return nav;
    }


    /**
     * 朝代筛选
     * @param dynasty
     * @return
     */
    @RequestMapping("/celebrityDynasty")
    public ModelAndView celebrityDynasty(Integer dynasty){
        if(dynasty == null)
            return commonUtils.throwException("您输入的信息有误");
        List<Dynasty> dynasties = dynastyMapper.selectAll();
        List<Celebrity> celebrities = celebrityMapper.selectByDynasty(dynasty); //todo 分页
        ModelAndView mav = new ModelAndView("/celebrity");
        mav.addObject("celebrities",celebrities);
        mav.addObject("dynasties",dynasties);
        mav.addObject("nowDynasty",dynasty);
        return mav;
    }

    /**
     * 人物搜索
     * @param celebrityName
     * @return
     */
    @RequestMapping("/celebritySearch")
    public ModelAndView celebritySearch(String celebrityName){
        if(celebrityName == null || "".equals(celebrityName)){
            return commonUtils.throwException("您输入的信息有误");
        }
        Celebrity celebrity = celebrityMapper.selectByName(celebrityName);
        //有完整匹配的人物，直接跳转
        if(celebrity != null){
            ModelAndView mav = new ModelAndView("celebrityDetail");
            List<CelebrityDetail> celebrityDetails = celebrityDetailMapper.selectByCelebrityId(celebrity.getId());
            if(celebrityDetails == null || celebrityDetails.size() == 0){
                return commonUtils.throwException("找不到该人物信息哦！");
            } else {
                mav.addObject("celebrityDetails",celebrityDetails);
                mav.addObject("celebrity",celebrity);
                return mav;
            }
        } else{
            List<Celebrity> celebrities = celebrityMapper.selectByNameLike(celebrityName);
            ModelAndView mav = new ModelAndView("/celebrity");
            List<Dynasty> dynasties = dynastyMapper.selectAll();    //todo 分页查询
            mav.addObject("dynasties",dynasties);
            mav.addObject("celebrities",celebrities);
            mav.addObject("searchHistory",celebrityName);
            return mav;
        }
    }



}