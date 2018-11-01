package com.gjsyoung.iteach.service.Impl;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.iteach.mq.Sender;
import com.gjsyoung.iteach.service.VisitLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * create by cairuojin on 2018/09/28
 */
@Service
public class VisitLogServiceImpl implements VisitLogService {

    @Autowired
    Sender sender;


    /**
     * 记录IP访问记录
     * @param clientIpAddress
     * @param sessionId
     */
    @Async
    @Override
    public void recordVisitLog(String clientIpAddress, String sessionId) {
        Map data = new HashMap();
        data.put("clientIpAddress",clientIpAddress);
        data.put("sessionId",sessionId);
        String dataJson = JSON.toJSONString(data);
        sender.sendLog(dataJson);
    }
}
