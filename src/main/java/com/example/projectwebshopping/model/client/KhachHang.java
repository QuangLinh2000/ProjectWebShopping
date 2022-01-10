package com.example.projectwebshopping.model.client;

import java.sql.ResultSet;
import java.sql.SQLException;

public class KhachHang {
    private String maKH;
    private String tenKH;
    private String diaChi;
    private String sdt;
    private String email;
    private String tinhTP;
    private String quanHuyen;
    private String phuongXa;

    // Constructor
    public KhachHang() {
    }

    public KhachHang(String maKH, String tenKH, String diaChi, String sdt, String email, String tinhTP, String quanHuyen, String phuongXa) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.email = email;
        this.tinhTP = tinhTP;
        this.quanHuyen = quanHuyen;
        this.phuongXa = phuongXa;
    }

    // Getter and Setter
    public String getMaKH() {
        return maKH;
    }

    public void setMaKH(String maKH) {
        this.maKH = maKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTinhTP() {
        return tinhTP;
    }

    public void setTinhTP(String tinhTP) {
        this.tinhTP = tinhTP;
    }

    public String getQuanHuyen() {
        return quanHuyen;
    }

    public void setQuanHuyen(String quanHuyen) {
        this.quanHuyen = quanHuyen;
    }

    public String getPhuongXa() {
        return phuongXa;
    }

    public void setPhuongXa(String phuongXa) {
        this.phuongXa = phuongXa;
    }
    //toString
    @Override
    public String toString() {
        return "KhachHang{" + "maKH=" + maKH + ", tenKH=" + tenKH + ", diaChi=" + diaChi + ", sdt=" + sdt + ", email=" + email + ", tinhTP=" + tinhTP + ", quanHuyen=" + quanHuyen + ", phuongXa=" + phuongXa + '}';
    }
    public void addKhachHang(ResultSet rs) throws SQLException {

            this.maKH = rs.getString("IDUSER");
            this.tenKH = rs.getString("HoTen");
            this.diaChi = rs.getString("DiaChi");
            this.sdt = rs.getString("DienThoai");
            this.email = rs.getString("USERMAIL");
            this.tinhTP = rs.getString("TinhTP");
            this.quanHuyen = rs.getString("QuanHuyen");
            this.phuongXa = rs.getString("PhuongXa");

    }

}
