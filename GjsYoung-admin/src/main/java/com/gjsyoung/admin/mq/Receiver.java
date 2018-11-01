package com.gjsyoung.admin.mq;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.admin.domain.admin.VisitLog;
import com.gjsyoung.admin.mapper.admin.VisitLogMapper;
import com.gjsyoung.admin.utils.GetGeographicOfIp;
import com.rabbitmq.client.Channel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
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

    @RabbitListener(queues = "${LogQueue}") //监听发送短信队列
    public void SmsReceiver(Message message, Channel channel) throws UnsupportedEncodingException {
        Map map = JSON.parseObject(new String(message.getBody()), Map.class);
        String clientIpAddress = map.get("clientIpAddress").toString();
        String sessionId = map.get("sessionId").toString();
        try {
            Map<String, Object> stringObjectMap = GetGeographicOfIp.getrealAddress(clientIpAddress);
            VisitLog visitLog = (VisitLog) stringObjectMap.get("visitLog");
            visitLog.setIp(clientIpAddress);
            visitLog.setVisittime(new Date());
            visitLog.setSid(sessionId);
            if("false".equals(stringObjectMap.get("status"))){
                visitLog.setStatus(1);
                visitLog.setErrmessage((String) stringObjectMap.get("errMessage"));
            } else {
                visitLog.setStatus(0);
            }
            visitLogMapper.insert(visitLog);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
