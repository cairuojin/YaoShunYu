package com.gjsyoung.admin.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * create by chenguitao on 2017/9/14
 * 获取ip的登陆地理位置
 */
public class GetGeographicOfIp {

    private static Logger logger = LoggerFactory.getLogger(GetGeographicOfIp.class);

    private static String apiurl = "http://ip.taobao.com/service/getIpInfo.php";


    public static Map<String, Object> getrealAddress(String IP) throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        URL url = new URL(apiurl + "?ip=" + IP);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(5000);
        connection.setRequestMethod("GET");
        connection.connect();
        if (connection.getResponseCode() != 200) {      //接口错误
            resultMap.put("status", false);
            resultMap.put("errMessage",connection.getResponseCode() + connection.getResponseMessage());
            logger.error("IP归属地查询接口错误：" + connection.getResponseCode() + connection.getResponseMessage() + " - " + IP);
            return resultMap;
        }
        InputStream inputStream = connection.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        String readLine;
        StringBuffer buffer = new StringBuffer();
        while ((readLine = reader.readLine()) != null) {
            buffer.append(readLine);
        }
        JSONObject jsonObject = JSON.parseObject(buffer.toString());
        inputStream.close();
        Integer codeStatus = jsonObject.getInteger("code");
        if (codeStatus == 1) {
            resultMap.put("status", false);
            resultMap.put("errMessage","获取地理位置失败");
            logger.error("获取地理位置失败！" + connection.getResponseCode() + connection.getResponseMessage() + " - " + IP);
            return resultMap;
        }
        JSONObject realData = jsonObject.getJSONObject("data");
        resultMap.put("realData",realData);
        resultMap.put("status", true);
        return resultMap;
    }

}
