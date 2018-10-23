package com.gjsyoung.iteach.controller;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.iteach.domain.CelebrityDetail;
import com.gjsyoung.iteach.domain.EntertainmentFuseImage;
import com.gjsyoung.iteach.mapper.CelebrityDetailMapper;
import com.gjsyoung.iteach.mapper.EntertainmentFuseImageMapper;
import com.gjsyoung.iteach.utils.FaceUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create by cairuojin on 2018/09/21
 * 后台管理系统controller
 */
@Controller
public class AdminController {

    @Autowired
    CelebrityDetailMapper celebrityDetailMapper;

    @Autowired
    EntertainmentFuseImageMapper entertainmentFuseImageMapper;

    @Autowired
    FaceUtils faceUtils;

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


    @RequestMapping("/admin/queryFuseImages")
    public void queryFuseImages(PrintWriter out) throws Exception {
        List<EntertainmentFuseImage> entertainmentFuseImages = entertainmentFuseImageMapper.selectAllByStatus(0);
        for(EntertainmentFuseImage images: entertainmentFuseImages){
            if(images.getTopsize() == null){
                String fileUrl = "classpath:static/" + images.getImage();
                File template_file = ResourceUtils.getFile(fileUrl);
                byte[] template_buff = new byte[(int) template_file.length()];
                FileInputStream fis = new FileInputStream(template_file);
                fis.read(template_buff);
                fis.close();
                try {
                    Map map = faceUtils.DetectFace(template_buff, null);
                    String facesString = map.get("faces").toString();
                    List<Map> facesList = JSON.parseObject(facesString, List.class);
                    Map faceMap = facesList.get(0);
                    Map face_rectangle = JSON.parseObject(faceMap.get("face_rectangle").toString(), Map.class);
                    images.setTopsize(Integer.valueOf(face_rectangle.get("top").toString()));
                    images.setLeftsize(Integer.valueOf(face_rectangle.get("left").toString()));
                    images.setWidthsize(Integer.valueOf(face_rectangle.get("width").toString()));
                    images.setHeightsize(Integer.valueOf(face_rectangle.get("height").toString()));
                    System.out.println();
                    entertainmentFuseImageMapper.updateByPrimaryKey(images);
                }catch (Exception e){
                    e.printStackTrace();
                    System.out.println(images.getName());
                }

            }
        }


        out.write("ok");
    }

}
