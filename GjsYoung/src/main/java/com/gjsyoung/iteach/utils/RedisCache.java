package com.gjsyoung.iteach.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * create by chenguitao on 2017/12/4
 */
@Component
public class RedisCache {

    private static final Logger logger= LoggerFactory.getLogger(RedisCache.class);

    private final ReadWriteLock readWriteLock=new ReentrantReadWriteLock();

    @Resource
    private RedisTemplate redisTemplate;

    private static final long expireTimeInMin=120;//redis 过期时间

    /**
     * 默认带有过期时间时间为2小时
     * @param key
     * @param value
     */
    public void putObject(Object key, Object value) {
        ValueOperations opsForValue=getRedisTemplate().opsForValue();
        opsForValue.set(key,value,expireTimeInMin, TimeUnit.MINUTES);
        logger.info("Put query result to redis,expireTime is "+expireTimeInMin+" MINUTES");
    }

    /**
     * 可配置过期时间的，
     * 单位可配置
     * @param key
     * @param value
     * @param expireTime
     * @param timeType
     */
    public void putObjectWithTimeParam(Object key,Object value,Long expireTime,TimeUnit timeType){
        ValueOperations opsForValue=getRedisTemplate().opsForValue();
        opsForValue.set(key,value,expireTime, timeType);
        logger.info("Put query result to redis,expireTime is "+expireTime+" "+timeType.toString());
    }

    /**
     * 无过期时间
     * @param key
     * @param value
     */
    public void putObjectWithoutTime(Object key, Object value) {
        ValueOperations opsForValue=getRedisTemplate().opsForValue();
        opsForValue.set(key,value);
        logger.info("Put query result to redis");
    }

    public <T> T getObject(Object key) {
        ValueOperations opsForValue=getRedisTemplate().opsForValue();
        logger.info("Get cached query result from redis");
        return (T) opsForValue.get(key);
    }

    /**
     * 根据key获取剩余过期时间，默认为秒
     * @param key
     * @return
     */
    public Long getExpire(String key){
        return getRedisTemplate().getExpire(key);
    }

    /**
     * 根据key获取剩余过期时间
     * 返回单位根据timeType来决定
     * @param key
     * @return
     */
    public Long getExpire(String key,TimeUnit timeType){
        return getRedisTemplate().getExpire(key,timeType);
    }

    public void removeObject(Object key) {
        getRedisTemplate().delete(key);
        logger.info("Remove cached query result from redis");
    }
    public void clear() {
        RedisTemplate redisTemplate = getRedisTemplate();
        redisTemplate.execute((RedisCallback) connection -> {
            connection.flushDb();
            connection.dbSize();
            return null;
        });
        logger.info("Clear all the cached query result from redis");
    }

    public Long getSize() {
        return (Long) getRedisTemplate().execute((RedisCallback) connection -> {
            return  connection.dbSize();
        });
    }

    public ReadWriteLock getReadWriteLock() {
        return readWriteLock;
    }

    public RedisTemplate getRedisTemplate(){
        if(this.redisTemplate==null){
            redisTemplate= ApplicationContextHolder.getBean("redisTemplate");
        }
        return redisTemplate;
    }
}
