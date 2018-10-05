package com.gjsyoung.admin.controller;

import com.gjsyoung.admin.domain.Author;
import com.gjsyoung.admin.domain.User;
import com.gjsyoung.admin.mapper.iteach.AuthorMapper;
import com.gjsyoung.admin.mapper.admin.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ClassicalController {


    @Autowired
    AuthorMapper authorMapper;

    @Autowired
    UserMapper userMapper;

    @RequestMapping("/test")
    public String test(){
        User user = userMapper.selectByPrimaryKey(1);
        Author author = authorMapper.selectByPrimaryKey(1);
        System.out.println(user);
        System.out.println(author);
        return "";
    }

}
