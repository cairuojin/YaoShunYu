package com.gjsyoung.iteach.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import sun.misc.BASE64Decoder;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * create by cairuojin on 2018/10/17
 */
@Component
public class ImageUtils {

    @Value("${UploadPath}")
    String UploadPath;


    /**
     * base64格式的字符串=转换成图片
     * @param base64String
     * @return
     */
    public  String changeBase64ToImage(String base64String, String fileSource){
        if(base64String == null){
            return "err";
        }
        BASE64Decoder decoder =new BASE64Decoder();
        try {
            byte[] imageByte=decoder.decodeBuffer(base64String);

            String pathString = fileSource + "/" + System.currentTimeMillis() + base64String.substring(6,8) +  ".jpg";
            OutputStream out =new FileOutputStream(UploadPath + pathString);
            out.write(imageByte);
            out.flush();
            out.close();
            return pathString;
        } catch (IOException e) {
            return "err";
        }
    }
}
