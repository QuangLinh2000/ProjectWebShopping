package com.example.projectwebshopping.model.client;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class Product implements Serializable {
    private String maSP;
    private String tenSP;
    private String idBoST;
    private String moTa;
    private double gia;
    private double sell;
    private String mau;
    private Date nayNhap;
    private Date ngayBatDausell;
    private Date ngayHetHansell;
    private String loaiSP;
    private int trangThai;
    private List<String> listUrlImg;
    //emty constructor
    public Product() {
    }
    //constructor
    public Product(String maSP, String tenSP, String idBoST, String moTa, double gia, double sell, String mau, Date nayNhap, Date ngayBatDausell, Date ngayHetHansell, String loaiSP, int trangThai, List<String> listUrlImg) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.idBoST = idBoST;
        this.moTa = moTa;
        this.gia = gia;
        this.sell = sell;
        this.mau = mau;
        this.nayNhap = nayNhap;
        this.ngayBatDausell = ngayBatDausell;
        this.ngayHetHansell = ngayHetHansell;
        this.loaiSP = loaiSP;
        this.trangThai = trangThai;
        this.listUrlImg = listUrlImg;
    }


    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getIdBoST() {
        return idBoST;
    }

    public void setIdBoST(String idBoST) {
        this.idBoST = idBoST;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public double getSell() {
        return sell;
    }

    public void setSell(double sell) {
        this.sell = sell;
    }

    public String getMau() {
        return mau;
    }

    public void setMau(String mau) {
        this.mau = mau;
    }

    public Date getNayNhap() {
        return nayNhap;
    }

    public void setNayNhap(Date nayNhap) {
        this.nayNhap = nayNhap;
    }

    public Date getNgayBatDausell() {
        return ngayBatDausell;
    }

    public void setNgayBatDausell(Date ngayBatDausell) {
        this.ngayBatDausell = ngayBatDausell;
    }

    public Date getNgayHetHansell() {
        return ngayHetHansell;
    }

    public void setNgayHetHansell(Date ngayHetHansell) {
        this.ngayHetHansell = ngayHetHansell;
    }

    public String getLoaiSP() {
        return loaiSP;
    }

    public void setLoaiSP(String loaiSP) {
        this.loaiSP = loaiSP;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public List<String> getListUrlImg() {
        return listUrlImg;
    }

    public void setListUrlImg(List<String> listUrlImg) {
        this.listUrlImg = listUrlImg;
    }
 //toString
    @Override
    public String toString() {
        return "Product{" +
                "maSP='" + maSP + '\'' +
                ", tenSP='" + tenSP + '\'' +
                ", idBoST='" + idBoST + '\'' +
                ", moTa='" + moTa + '\'' +
                ", gia=" + gia +
                ", sell=" + sell +
                ", mau='" + mau + '\'' +
                ", nayNhap=" + nayNhap +
                ", ngayBatDausell=" + ngayBatDausell +
                ", ngayHetHansell=" + ngayHetHansell +
                ", loaiSP='" + loaiSP + '\'' +
                ", trangThai=" + trangThai +
                ", listUrlImg=" + listUrlImg +
                '}';
    }
    //format tiền
    public static String formatMoney(Double money){
        String s = String.format("%,.0f",money);
        return s;
    }




}
