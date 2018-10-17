package com.gjsyoung.iteach.service.Impl;

import com.gjsyoung.iteach.domain.EntertainmentFuseImage;
import com.gjsyoung.iteach.domain.EntertainmentFuseRecord;
import com.gjsyoung.iteach.domain.User;
import com.gjsyoung.iteach.mapper.EntertainmentFuseImageMapper;
import com.gjsyoung.iteach.mapper.EntertainmentFuseRecordMapper;
import com.gjsyoung.iteach.service.EntertainmentService;
import com.gjsyoung.iteach.utils.FaceUtils;
import com.gjsyoung.iteach.utils.GetIpAddress;
import com.gjsyoung.iteach.utils.ImageUtils;
import net.coobird.thumbnailator.Thumbnails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

/**
 * create by cairuojin on 2018/10/17
 */
@Service
public class EntertainmentServiceImpl implements EntertainmentService{

    @Value("${UploadPath}")
    String UploadPath;

    @Autowired
    EntertainmentFuseImageMapper entertainmentFuseImageMapper;

    @Autowired
    EntertainmentFuseRecordMapper entertainmentFuseRecordMapper;

    @Autowired
    FaceUtils faceUtils;

    @Autowired
    ImageUtils imageUtils;

    private static final Logger logger = LoggerFactory.getLogger(EntertainmentServiceImpl.class);
    
    
    /**
     * 人脸融合
     * @param file 用户上传文件
     * @param id    融合模板
     * @param request
     * @param session
     * @return
     * @throws IOException
     */
    @Override
    public String faceFuse(MultipartFile file, String id, HttpServletRequest request, HttpSession session) throws IOException {
        Integer intId = Integer.valueOf(id.substring(5));
        EntertainmentFuseRecord record = new EntertainmentFuseRecord(); //融合记录
        String ip = GetIpAddress.getClientIpAddress(request);
        record.setIp(ip);
        record.setSid(session.getId());
        record.setCreatetime(new Date());
        record.setTemplateId(intId);
        Object obj = session.getAttribute("user");
        if(obj != null)
            record.setId(((User)obj).getId());

        //用户上传文件保存
        String filename = file.getOriginalFilename();
        if(filename.length()>8)
            filename = filename.substring(filename.length()-8);
        logger.debug("人脸融合--保存用户图片" + filename);
        String path ="images/entertainment/UploadImg/"  + System.currentTimeMillis() + filename;
        File personalFile = new File(UploadPath + path);
        //压缩图片
        Thumbnails.of(file.getInputStream()).size(500,500).toFile(personalFile);
        record.setMergeFile(path);
        byte[] buff = new byte[(int) personalFile.length()];
        FileInputStream fis = new FileInputStream(personalFile);
        fis.read(buff);
        fis.close();

        //获得融合模板图
        EntertainmentFuseImage template = entertainmentFuseImageMapper.selectByPrimaryKey(intId);
        String fileUrl = "classpath:static/" + template.getImage();
        File template_file = ResourceUtils.getFile(fileUrl);
        byte[] template_buff = new byte[(int) template_file.length()];
        fis = new FileInputStream(template_file);
        fis.read(template_buff);
        fis.close();
        String template_rectangle = template.getTopsize()+ "," + template.getLeftsize() + "," + template.getWidthsize() + "," + template.getHeightsize();

        //调用人脸融合接口
        try {
            Map resultData = faceUtils.MergeFace(buff, template_buff, template_rectangle);
            if(null != resultData.get("error_message")){    //错误信息
                logger.error("人脸融合接口返回错误：" + resultData.get("error_message").toString());
                record.setStatus(1);
                record.setErrmessage(resultData.get("error_message").toString());
                return resultData.get("error_message").toString();
            }
            else {
                Object result = resultData.get("result");   //Base64转图片
                String mergeFace = imageUtils.changeBase64ToImage(result.toString(), "images/entertainment/MergeFace");
                if("err".equals(mergeFace)){
                    logger.error("Base64ToImage图片转换失败");
                    record.setStatus(1);
                    record.setErrmessage("err Base64ToImage");
                    return "err";
                }
                record.setStatus(0);
                record.setResultFile(mergeFace);
                return "OK" + mergeFace;
            }
        } catch (Exception e) {
            logger.error("人脸融合接口出现异常" + e);
            e.printStackTrace();
        }finally {
            entertainmentFuseRecordMapper.insert(record);
        }
        return null;
    }
}
