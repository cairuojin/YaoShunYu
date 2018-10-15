package com.gjsyoung.iteach.controller;

import com.gjsyoung.iteach.domain.EntertainmentFuseImage;
import com.gjsyoung.iteach.domain.User;
import com.gjsyoung.iteach.mapper.EntertainmentFuseImageMapper;
import com.gjsyoung.iteach.utils.CommonUtils;
import com.gjsyoung.iteach.utils.FaceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * create by cairuojin on 2018/10/15
 * 娱乐模块controller
 */
@Controller
public class EntertainmentController {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    EntertainmentFuseImageMapper entertainmentFuseImageMapper;

    @Autowired
    FaceUtils faceUtils;

    /**
     * 进入娱乐模块
     * @return
     */
    @RequestMapping("/entertainment")
    public ModelAndView entertainment(HttpSession session){    //todo 动态查找娱乐模块列表及其网址
        ModelAndView mav = new ModelAndView("entertainment");
        session.setAttribute("pageHeader",4);//头
        return mav;
    }


    /**
     * 进入人脸融合模块
     * @param session
     * @return
     */
    @RequestMapping("/entertainmentFuse")
    public ModelAndView entertainmentFuse(HttpSession session){
//        Object obj = session.getAttribute("user");
//        if(obj == null){
//            return commonUtils.throwException("该模块为内测功能，请您登录后再重试！");
//        }
        ModelAndView mav = new ModelAndView("entertainmentFuse");
        List<EntertainmentFuseImage> entertainmentFuseImages = entertainmentFuseImageMapper.selectAllByStatus(0);//查找全部可用的模板
        mav.addObject("images",entertainmentFuseImages);
        return mav;
    }

    /**
     * 人脸融合
     * @param file  用户上传文件
     * @param id    融合模板
     * @param session
     * @return
     * @throws IOException
     */

    @ResponseBody
    @RequestMapping("/faceFuse")
    public String faceFuse(MultipartFile file,String id,HttpSession session) throws IOException {
        if(file == null)
            return "找不到您上传的文件哦！";
        String fileName = file.getOriginalFilename();
        String type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
        if(type == null) {
            return "您上传的类型有误！";
        } else if (!"GIF".equals(type.toUpperCase())&&!"PNG".equals(type.toUpperCase())&&!"JPG".equals(type.toUpperCase())){
            return "您上传的类型有误！";
        } else {
            byte[] buff = file.getBytes();
            Map detectFace = null;
            try {
                detectFace = faceUtils.DetectFace(buff);    //人脸检测
                Thread.sleep(3000);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println(detectFace);

            return "OK";
        }


    }



}
