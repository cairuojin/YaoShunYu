package com.gjsyoung.iteach.controller.socket;

/**
 * create by cairuojin on 2018/08/29
 * websock监听器
 */
import com.gjsyoung.iteach.domain.User;
import com.gjsyoung.iteach.utils.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class GreetingController {

    @Autowired
    RedisCache redisCache;
    @MessageMapping("/hello")   //监听，发送到
    @SendTo("/topic/greetings") //广播模式
    public Message greeting(Message message, SimpMessageHeaderAccessor headerAccessor) throws Exception {
        Thread.sleep(500);
        List<String> data = redisCache.getObject("ChatHistory");
        if(data == null){
            data = new LinkedList<>();
        }
        String name = null;
        if(headerAccessor.getSessionAttributes().get("user") == null)
            name = "游客";
        else
            name = ((User)headerAccessor.getSessionAttributes().get("user")).getNickname();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = format.format(new Date());
        String mes = name + "  " + now + "<br>" + message.getMessage();
        if(data.size() > 5)
            data.remove(0);
        data.add(mes);
        redisCache.putObject("ChatHistory",data);
        message.setMessage(mes);
        return message;
    }
}
