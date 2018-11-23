package com.gjsyoung.admin.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create by cairuojin on 2018/11/09
 */
public class CommonUtils {

    private static StringBuffer bf1 = new StringBuffer();

    /**
     * 折线图，List<map>转string
     * @param list
     * @return
     */
    public static String lineMapToString(List<Map> list, String key, String value){
        bf1.setLength(0);
        for(Map map : list){
            bf1.append(  "[" + map.get(key) + "," + map.get(value) + "] ,");
        }
        if(bf1.length() != 0){
            String todayData = bf1.deleteCharAt(bf1.length() - 1).toString();
            return todayData;
        } else
            return "";
    }


}
