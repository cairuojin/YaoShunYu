package com.gjsyoung.iteach.vo;

/**
 * create by cairuojin on 2018/09/10
 */
public class GjsYoungException extends RuntimeException{
    private String message;
    private Integer errorCode;

    public GjsYoungException(String message){
        this.message=message;
    }
    public GjsYoungException(String message,Integer errorCode){
        this.message=message;
        this.errorCode=errorCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(Integer errorCode) {
        this.errorCode = errorCode;
    }




}
