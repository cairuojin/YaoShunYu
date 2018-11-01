package com.gjsyoung.iteach.mq;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * create by cairuojin on 2018/08/20
 * 日志生产者
 */
@Component
public class Sender {

    @Autowired
    RabbitTemplate rabbitTemplate;

    private static final Logger logger = LoggerFactory.getLogger(Sender.class);

    /**
     * 发送访问记录
     * @param message  taskId
     */
    public void sendLog(Object message){
        logger.debug("访问记录：" + message);
        rabbitTemplate.convertAndSend("LogExchange","LogRoutingKey",message);
    }

}
