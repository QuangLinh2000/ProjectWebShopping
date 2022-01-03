package com.example.projectwebshopping.model.client;

import java.io.Serializable;
import java.util.List;

public class LoaiSP implements Serializable {
    private String maLoai;
    private String tenLoai;
    private String moTa;
    List<List<Product>> listProduct;
    //emty constructor
    public LoaiSP(){

    }
    //constructor
    public LoaiSP(String maLoai, String tenLoai, String moTa, List<List<Product>> listProduct) {
        this.maLoai = maLoai;
        this.tenLoai = tenLoai;
        this.moTa = moTa;
        this.listProduct = listProduct;
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

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public List<List<Product>> getListProduct() {
        return listProduct;
    }

    public void setListProduct(List<List<Product>> listProduct) {
        this.listProduct = listProduct;
    }
}
