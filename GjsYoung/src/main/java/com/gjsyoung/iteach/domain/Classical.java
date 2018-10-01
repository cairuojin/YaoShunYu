package com.gjsyoung.iteach.domain;

import java.util.Date;

public class Classical {
    private Integer id;

    private String title;

    private String content; //HTML原文

    private String introduce;  //原文

    private Integer difficultyid;

    private String image;

    private Integer simplenum;

    private Integer hardnum;

    private String translation; //译文

    private Date createtime;

    private Date lastupdatetime;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public Integer getDifficultyid() {
        return difficultyid;
    }

    public void setDifficultyid(Integer difficultyid) {
        this.difficultyid = difficultyid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getSimplenum() {
        return simplenum;
    }

    public void setSimplenum(Integer simplenum) {
        this.simplenum = simplenum;
    }

    public Integer getHardnum() {
        return hardnum;
    }

    public void setHardnum(Integer hardnum) {
        this.hardnum = hardnum;
    }

    public String getTranslation() {
        return translation;
    }

    public void setTranslation(String translation) {
        this.translation = translation == null ? null : translation.trim();
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}