package com.gjsyoung.iteach.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * create by cairuojin on 2018/10/17
 */
public interface EntertainmentService {

    public String faceFuse(MultipartFile file, String id, HttpServletRequest request, HttpSession session) throws IOException;

}
