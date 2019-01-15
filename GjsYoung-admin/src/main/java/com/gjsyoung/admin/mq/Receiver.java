package com.gjsyoung.admin.mq;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.gjsyoung.admin.mapper.iteach.VisitLogMapper;
import com.gjsyoung.admin.utils.GetGeographicOfIp;
import com.gjsyoung.admin.domain.iteach.VisitLog;
import com.rabbitmq.client.Channel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;

/**
 * create by cairuojin on 2018/08/20
 * 日志消费者
 */
@Component("LogReceiver")
public class Receiver {


    @Autowired
    RabbitTemplate rabbitTemplate;

    @Autowired
    VisitLogMapper visitLogMapper;

    @Value("${MQStatus}")
    String MQStatus;

    private static final Logger logger = LoggerFactory.getLogger(Receiver.class);

    @RabbitListener(queues = "${LogQueue}") //监听日志记录
    public void SmsReceiver(Message message, Channel channel){
        Map map = JSON.parseObject(new String(message.getBody()), Map.class);
        String clientIpAddress = map.get("clientIpAddress").toString();
        String sessionId = map.get("sessionId").toString();
        if(sessionId != null){
            //todo 缓存存储
            VisitLog visitLog = visitLogMapper.selectBySid(sessionId);
            if(visitLog != null){
                return;         //多次访问不记录
            }else {
                try {
                    visitLog = new VisitLog();
                    Map<String, Object> stringObjectMap = null;
                    try{
                        stringObjectMap = GetGeographicOfIp.getrealAddress(clientIpAddress);        //查询IP资料
                    } catch (Exception e){
                        logger.error("连接URL错误" + sessionId + "," + clientIpAddress);
                    }
                    Object status = stringObjectMap.get("status");
                    if(status != null && "true".equals(status)){
                        JSONObject realData = (JSONObject) stringObjectMap.get("realData");
                        visitLog.setCountry( new String(realData.getString("country").getBytes(),"UTF-8") );//获取国籍信息
                        visitLog.setArea( new String(realData.getString("area").getBytes(),"UTF-8"));//获取地区
                        visitLog.setRegion( new String(realData.getString("region").getBytes(),"UTF-8"));//获取省份
                        visitLog.setCity( new String(realData.getString("city").getBytes(),"UTF-8"));//获取城市
                        visitLog.setCounty( new String(realData.getString("county").getBytes(),"UTF-8"));//获取县市
                        visitLog.setIsp( new String(realData.getString("isp").getBytes(),"UTF-8"));//获取运营商
                        visitLog.setStatus(0);
                    } else {
                        visitLog.setStatus(1);
                        visitLog.setErrmessage((String) stringObjectMap.get("errMessage"));
                    }
                    visitLog.setIp(clientIpAddress);
                    visitLog.setSid(sessionId);
                    visitLog.setVisittime(new Date());
                    visitLogMapper.insert(visitLog);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
