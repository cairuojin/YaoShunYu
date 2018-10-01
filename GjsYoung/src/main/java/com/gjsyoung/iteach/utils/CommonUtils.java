package com.gjsyoung.iteach.utils;

import com.alibaba.fastjson.JSON;
import com.gjsyoung.iteach.vo.GjsYoungException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.Random;
import java.util.UUID;

@Component
public class CommonUtils {


	/**
	 * 生成0到i的随机数
	 * @param i
	 * @return
	 */
	public int getRandomInt(int i){
		Random random = new Random();
		return random.nextInt(i);
	}

	/**
	 * 生成UUID
	 * @return
	 */
	public String getUUID()
	{
		return UUID.randomUUID().toString();
	}

	/**
	 * 转发到错误页面
	 * @param message
	 * @return
	 */
	public ModelAndView throwException(String message){
		GjsYoungException gjsYoungException = new GjsYoungException(message);
		ModelAndView mv = new ModelAndView("/errorPage");
		mv.addObject("errorMessage", gjsYoungException);
		return  mv;
	}
}
