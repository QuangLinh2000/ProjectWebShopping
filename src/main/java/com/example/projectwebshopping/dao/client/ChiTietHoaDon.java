package com.example.projectwebshopping.dao.client;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ChiTietHoaDon {
    private String maHoaDon;
    private double gia;
    private int soLuong;
    private String maSanPham;
    private String urlImg;
    private String size;
    private String name;
    //contructor
    public ChiTietHoaDon() {
    }
    //getter and setter
    public String getMaHoaDon() {
        return maHoaDon;
    }

    public void setMaHoaDon(String maHoaDon) {
        this.maHoaDon = maHoaDon;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    //method
    public static ChiTietHoaDon getChiTietHoaDon(ResultSet rs) throws SQLException {
        ChiTietHoaDon cthd = new ChiTietHoaDon();
        cthd.setMaHoaDon(rs.getString("maHoaDon"));
        cthd.setGia(rs.getDouble("gia"));
        cthd.setSoLuong(rs.getInt("soLuong"));
        cthd.setMaSanPham(rs.getString("maSanPham"));
        cthd.setUrlImg(rs.getString("urlImg"));
        cthd.setSize(rs.getString("size"));
        cthd.setName(rs.getString("name"));
        return cthd;
    }

    //addChiTietHoaDon
    public void addChiTietHoaDon( ResultSet resultSet) throws SQLException {
       String maHoaDon = resultSet.getString("MaHD");
       double gia = resultSet.getDouble("PRICE");
       int soLuong = resultSet.getInt("SoLuong");
       String maSanPham = resultSet.getString("MaSP");
       String urlImg = resultSet.getString("URL");
       String size = resultSet.getString("Size");
       String name = resultSet.getString("TENSP");
       this.setMaHoaDon(maHoaDon);
       this.setGia(gia);
       this.setSoLuong(soLuong);
       this.setMaSanPham(maSanPham);
       this.setUrlImg(urlImg);
       this.setSize(size);
       this.setName(name);

    }

}
