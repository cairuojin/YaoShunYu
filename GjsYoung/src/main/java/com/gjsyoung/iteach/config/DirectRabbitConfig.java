package com.gjsyoung.iteach.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;


/**
 * create by cairuojin on 2018/08/20
 * SMS QUEUE配置
 */
@Configuration
public class DirectRabbitConfig {

    @Value("LogQueue")              //原始队列
    String LogQueue;
    @Value("LogExchange")           //原始交换机
    String LogExchange;
    @Value("LogRoutingKey")
    String LogRoutingKey;

    @Bean
    public Queue LogQueue(){    //创建队列
        return new Queue(LogQueue);
    }

    @Bean
    public DirectExchange LogExchange() {//创建发送邮件的交换机
        return new DirectExchange(LogExchange);
    }

    @Bean
    Binding bingSendEmailQueue() {//标识routingkey并将其绑定交换机和队列
        return BindingBuilder.bind(LogQueue()).to(LogExchange()).with(LogRoutingKey);
    }








}
