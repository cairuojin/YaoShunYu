package com.gjsyoung.iteach.vo;

import com.gjsyoung.iteach.domain.Article;

import java.util.Objects;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ArticleVo articleVo = (ArticleVo) o;
        return Objects.equals(getId(), articleVo.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(nickname);
    }
}
