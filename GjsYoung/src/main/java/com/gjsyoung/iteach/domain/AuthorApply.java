package com.gjsyoung.iteach.domain;

import java.util.Date;

public class AuthorApply {
    private Integer userid;

    private String realname;

    private String idcardnum;

    private String authorintroduction;

    private Integer status; //申请状态  0申请中 1申请成功 2申请驳回

    private Date createtime;

    private Date lastupdatetime;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getIdcardnum() {
        return idcardnum;
    }

    public void setIdcardnum(String idcardnum) {
        this.idcardnum = idcardnum == null ? null : idcardnum.trim();
    }

    public String getAuthorintroduction() {
        return authorintroduction;
    }

    public void setAuthorintroduction(String authorintroduction) {
        this.authorintroduction = authorintroduction == null ? null : authorintroduction.trim();
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

    public Date getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(Date lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }
}