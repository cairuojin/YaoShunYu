package com.gjsyoung.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * create by cairuojin on 2018/11/15
 */
@Controller
public class CanlendarController {

    @RequestMapping("calendar")
    public ModelAndView canlendar(){
        ModelAndView mav = new ModelAndView("calendar");


        mav.addObject("pageHeader",3);
        return mav;
    }


}
