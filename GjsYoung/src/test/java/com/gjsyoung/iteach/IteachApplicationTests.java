package com.gjsyoung.iteach;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisClusterConfiguration;
import org.springframework.data.redis.connection.RedisNode;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class IteachApplicationTests {

    @Autowired
    RedisTemplate redisTemplate;






    @Test
    public void contextLoads() {


//        redisTemplate.opsForValue().set("ABC", "Hello world");

        Object abc = redisTemplate.opsForValue().get("ppp");
        System.out.println(abc);
    }

}
