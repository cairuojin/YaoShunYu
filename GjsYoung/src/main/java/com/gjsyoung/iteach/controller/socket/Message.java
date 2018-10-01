package com.gjsyoung.iteach.controller.socket;

import java.io.Serializable;

/**
 * @author cairuojin
 * @create 2018-09-13 22:19
 */
public class Message implements Serializable {

    private static final long serialVersionUID = -8366929034564774130L;

    private String message;

    public Message(){

    }

    public Message(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}