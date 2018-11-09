package com.gjsyoung.admin.domain.iteach;

public class ClassicalDetail {
    private Integer id;

    private Integer classicalid;

    private String question;

    private String answer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClassicalid() {
        return classicalid;
    }

    public void setClassicalid(Integer classicalid) {
        this.classicalid = classicalid;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }
}