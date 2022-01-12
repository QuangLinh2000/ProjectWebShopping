package com.example.projectwebshopping.model.client;

import java.io.Serializable;
import java.util.List;

public class LoaiSP implements Serializable {
    private String maLoai;
    private String tenLoai;
    List<List<Product>> listProduct;
    //emty constructor
    public LoaiSP(){

    }


    //getter and setter
    public String getMaLoai() {
        return maLoai;
    }

    public void setMaLoai(String maLoai) {
        this.maLoai = maLoai;
    }

    public String getTenLoai() {
        return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }


    public List<List<Product>> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<List<Product>> listProduct) {
        this.listProduct = listProduct;
    }
}
