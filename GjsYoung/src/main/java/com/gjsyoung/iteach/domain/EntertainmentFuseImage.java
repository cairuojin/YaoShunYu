package com.gjsyoung.iteach.domain;

import java.util.Date;

public class EntertainmentFuseImage {
    private Integer id;

    private String name;

    private String image;

    private Integer status;

    private Date createtime;

    private Integer topsize;

    private Integer leftsize;

    private Integer widthsize;

    private Integer heightsize;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getTopsize() {
        return topsize;
    }

    public void setTopsize(Integer topsize) {
        this.topsize = topsize;
    }

    public Integer getLeftsize() {
        return leftsize;
    }

    public void setLeftsize(Integer leftsize) {
        this.leftsize = leftsize;
    }

    public Integer getWidthsize() {
        return widthsize;
    }

    public void setWidthsize(Integer widthsize) {
        this.widthsize = widthsize;
    }

    public Integer getHeightsize() {
        return heightsize;
    }

    public void setHeightsize(Integer heightsize) {
        this.heightsize = heightsize;
    }
}