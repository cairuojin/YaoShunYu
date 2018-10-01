package com.gjsyoung.iteach.domain;

import java.util.Date;

//用户表
public class User {
    private Integer id;

    private String username;    //用户名

    private String password;    //密码

    private String email;       //邮箱

    private String nickname;    //昵称

    private Integer sex;        //性别（未知：0，男：1，女：2）

    private Integer age;        //年龄

    private Integer status;     //状态（未激活：0，已激活的普通用户：1， 管理员权限：2）

    private String phonenum;    //手机号码

    private Date createtime;

    private Date lastupdatetime;

    private String image;       //头像

    private String code;        //激活码

    private String moodTxt;     //心情

    public String getMoodTxt() {
        return moodTxt;
    }

    public void setMoodTxt(String moodTxt) {
        this.moodTxt = moodTxt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(Date lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }


}