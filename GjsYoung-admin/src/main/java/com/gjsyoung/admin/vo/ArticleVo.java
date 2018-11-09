package com.gjsyoung.admin.vo;

import com.gjsyoung.iteach.domain.Article;

/**
 * create by cairuojin on 2018/09/13
 */
public class ArticleVo extends Article {
    private String nickname;

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
}
