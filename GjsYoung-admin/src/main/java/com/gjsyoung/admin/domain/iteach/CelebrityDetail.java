package com.gjsyoung.admin.domain.iteach;

public class CelebrityDetail {
    private Integer id;

    private Integer celebrityid;

    private String title;

    private String image;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCelebrityid() {
        return celebrityid;
    }

    public void setCelebrityid(Integer celebrityid) {
        this.celebrityid = celebrityid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}