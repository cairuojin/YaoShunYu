package com.gjsyoung.admin.domain.iteach;

public class Celebrity {
    private Integer id;

    private String name;

    private String image;

    private String introduction;

    private Integer dynasty;

    private String alias;

    private String evaluate;

    private String birthanddeath;

    private String assess;

    private String homeplace;

    private String bigimage;

    private String content;

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

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public Integer getDynasty() {
        return dynasty;
    }

    public void setDynasty(Integer dynasty) {
        this.dynasty = dynasty;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias == null ? null : alias.trim();
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate == null ? null : evaluate.trim();
    }

    public String getBirthanddeath() {
        return birthanddeath;
    }

    public void setBirthanddeath(String birthanddeath) {
        this.birthanddeath = birthanddeath == null ? null : birthanddeath.trim();
    }

    public String getAssess() {
        return assess;
    }

    public void setAssess(String assess) {
        this.assess = assess == null ? null : assess.trim();
    }

    public String getHomeplace() {
        return homeplace;
    }

    public void setHomeplace(String homeplace) {
        this.homeplace = homeplace == null ? null : homeplace.trim();
    }

    public String getBigimage() {
        return bigimage;
    }

    public void setBigimage(String bigimage) {
        this.bigimage = bigimage == null ? null : bigimage.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}