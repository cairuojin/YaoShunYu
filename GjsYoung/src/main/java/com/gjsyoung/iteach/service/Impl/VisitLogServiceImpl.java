package com.gjsyoung.iteach.service.Impl;

import com.gjsyoung.iteach.domain.VisitLog;
import com.gjsyoung.iteach.mapper.VisitLogMapper;
import com.gjsyoung.iteach.service.VisitLogService;
import com.gjsyoung.iteach.utils.GetGeographicOfIp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Map;

/**
 * create by cairuojin on 2018/09/28
 */
@Service
public class VisitLogServiceImpl implements VisitLogService {

    @Autowired
    VisitLogMapper visitLogMapper;

    /**
     * 记录IP访问记录
     * @param clientIpAddress
     * @param sessionId
     */
    @Async
    @Override
    public void recordVisitLog(String clientIpAddress, String sessionId) {
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
