package com.gjsyoung.iteach.utils;

import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import sun.misc.BASE64Decoder;

import javax.net.ssl.SSLException;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

/**
 * create by cairuojin on 2018/10/15
 * Face++旷视工具
 */
@Component
public class FaceUtils {

    @Value("${APIKey}")
    String APIKey;

    @Value("${APISecret}")
    String APISecret;

    @Autowired
    RestTemplate restTemplate;

    @Autowired
    ImageUtils imageUtils;

    private static final Logger logger = LoggerFactory.getLogger(FaceUtils.class);

    /**
     * 检测照片Detect API接口
     * @param buff 文件的字节流
     * @param type 需要查询的类型
     * @return
     */
    public Map DetectFace(byte[] buff,String type) throws Exception {
        logger.debug("--人脸检测--");
        String url = "https://api-cn.faceplusplus.com/facepp/v3/detect";
        HashMap map = new HashMap<>();
        HashMap<String, byte[]> byteMap = new HashMap<>();
        map.put("api_key",APIKey);
        map.put("api_secret",APISecret);
        if(type != null){
            switch (type){
                case "allMessage":map.put("return_attributes","gender,age,smiling,headpose,facequality,blur,eyestatus,emotion,ethnicity,beauty,mouthstatus,eyegaze,skinstatus");break;

                default:
            }
        }
        byteMap.put("image_file",buff);
        byte[] bacd = post(url, map, byteMap);
        String str = new String(bacd);
        Map data = JSON.parseObject(str, Map.class);
        return data;
    }

    /**
     * 人脸融合MergeFaceAPI接口
     * @param merge_file        融合图
     * @param template_file     模板图
     * @param template_rectangle    模板图人脸位置
     * @return                  调用接口后的数据
     * @throws Exception
     */
    public Map MergeFace(byte[] merge_file, byte[] template_file,String template_rectangle) throws Exception {
        logger.debug("--调用人脸融合接口--");
        String url = "https://api-cn.faceplusplus.com/imagepp/v1/mergeface";
        HashMap map = new HashMap<>();
        HashMap<String, byte[]> byteMap = new HashMap<>();
        map.put("api_key",APIKey);
        map.put("api_secret",APISecret);
        map.put("template_rectangle",template_rectangle);       //模板图四个参数
        byteMap.put("template_file",template_file); //模板图
        byteMap.put("merge_file",merge_file);       //用户上传图
        byte[] bacd = post(url, map, byteMap);
        String str = new String(bacd);
        Map data = JSON.parseObject(str, Map.class);
        return data;
    }



    private final static int CONNECT_TIME_OUT = 30000;
    private final static int READ_OUT_TIME = 50000;
    private static String boundaryString = getBoundary();
    protected static byte[] post(String url, HashMap<String, String> map, HashMap<String, byte[]> fileMap) throws Exception {
        HttpURLConnection conne;
        URL url1 = new URL(url);
        conne = (HttpURLConnection) url1.openConnection();
        conne.setDoOutput(true);
        conne.setUseCaches(false);
        conne.setRequestMethod("POST");
        conne.setConnectTimeout(CONNECT_TIME_OUT);
        conne.setReadTimeout(READ_OUT_TIME);
        conne.setUseCaches(false);
        conne.setRequestProperty("accept", "*/*");
        conne.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundaryString);
        conne.setRequestProperty("connection", "Keep-Alive");
        conne.setRequestProperty("user-agent", "Mozilla/4.0 (compatible;MSIE 6.0;Windows NT 5.1;SV1)");
        DataOutputStream obos = new DataOutputStream(conne.getOutputStream());
        Iterator iter = map.entrySet().iterator();
        while(iter.hasNext()){
            Map.Entry<String, String> entry = (Map.Entry) iter.next();
            String key = entry.getKey();
            String value = entry.getValue();
            obos.writeBytes("--" + boundaryString + "\r\n");
            obos.writeBytes("Content-Disposition: form-data; name=\"" + key
                    + "\"\r\n");
            obos.writeBytes("\r\n");
            obos.writeBytes(value + "\r\n");
        }
        if(fileMap != null && fileMap.size() > 0){
            Iterator fileIter = fileMap.entrySet().iterator();
            while(fileIter.hasNext()){
                Map.Entry<String, byte[]> fileEntry = (Map.Entry<String, byte[]>) fileIter.next();
                obos.writeBytes("--" + boundaryString + "\r\n");
                obos.writeBytes("Content-Disposition: form-data; name=\"" + fileEntry.getKey()
                        + "\"; filename=\"" + encode(" ") + "\"\r\n");
                obos.writeBytes("\r\n");
                obos.write(fileEntry.getValue());
                obos.writeBytes("\r\n");
            }
        }
        obos.writeBytes("--" + boundaryString + "--" + "\r\n");
        obos.writeBytes("\r\n");
        obos.flush();
        obos.close();
        conne.connect();
        InputStream ins = null;
        int code = conne.getResponseCode();
        try{
            if(code == 200){
                ins = conne.getInputStream();
            }else{
                ins = conne.getErrorStream();
            }
        }catch (SSLException e){
            e.printStackTrace();
            return new byte[0];
        }
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] buff = new byte[4096];
        int len;
        while((len = ins.read(buff)) != -1){
            baos.write(buff, 0, len);
        }
        byte[] bytes = baos.toByteArray();
        ins.close();
        return bytes;
    }
    private static String getBoundary() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i = 0; i < 32; ++i) {
            sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-".charAt(random.nextInt("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_".length())));
        }
        return sb.toString();
    }
    private static String encode(String value) throws Exception{
        return URLEncoder.encode(value, "UTF-8");
    }
}
