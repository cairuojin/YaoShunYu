package com.gjsyoung.admin.domain.admin;

import java.util.Date;

public class UpdateLog {
    private Integer id;

    private String updateversion;

    private Date updatetime;

    private String updatecontent;

    private String updatepersion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUpdateversion() {
        return updateversion;
    }

    public void setUpdateversion(String updateversion) {
        this.updateversion = updateversion == null ? null : updateversion.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public String getUpdatecontent() {
        return updatecontent;
    }

    public void setUpdatecontent(String updatecontent) {
        this.updatecontent = updatecontent == null ? null : updatecontent.trim();
    }

    public String getUpdatepersion() {
        return updatepersion;
    }

    public void setUpdatepersion(String updatepersion) {
        this.updatepersion = updatepersion == null ? null : updatepersion.trim();
    }
}