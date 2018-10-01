package com.gjsyoung.iteach.controller;

import com.gjsyoung.iteach.domain.CelebrityDetail;
import com.gjsyoung.iteach.mapper.CelebrityDetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.List;

/**
 * create by cairuojin on 2018/09/21
 * 后台管理系统controller
 */
@Controller
public class AdminController {

    @Autowired
    CelebrityDetailMapper celebrityDetailMapper;

    /**
     * 进入人物百科编辑页面
     * @return
     */
    @RequestMapping("/admin/celebrityEdit")
    public ModelAndView celebrityEdit(){
        List<CelebrityDetail> celebrityDetails = celebrityDetailMapper.selectAll();
        ModelAndView nav = new ModelAndView();
        nav.setViewName("admin/celebrityEdit");
        nav.addObject("celebrityDetails",celebrityDetails);
        return nav;
    }

    /**
     * 后台增加人物细节
     * @param out
     * @param celebrityDetail
     */
    @RequestMapping("/admin/addcelebrity")
    public void addcelebrity(PrintWriter out, CelebrityDetail celebrityDetail){
        celebrityDetailMapper.insert(celebrityDetail);
        out.write("ok");
    }


}
