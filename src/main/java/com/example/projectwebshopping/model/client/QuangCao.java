package com.example.projectwebshopping.model.client;

import java.io.Serializable;

public class QuangCao implements Serializable {
    private String id;
    private String url;
    private String hinhAnh;
    //full contructor
    public QuangCao(String id, String url, String hinhAnh) {
        this.id = id;
        this.url = url;
        this.hinhAnh = hinhAnh;
    }
    //empty contructor
    public QuangCao() {
    }
    //getter and setter
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }
}
