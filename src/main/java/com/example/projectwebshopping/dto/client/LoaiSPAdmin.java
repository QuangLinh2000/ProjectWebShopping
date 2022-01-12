package com.example.projectwebshopping.dto.client;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LoaiSPAdmin {
    private String idLoai;
    private String nameLoai;
    private String mota;
    private int soluongSP;
    private int soluongSPBan;
    //empty constructor
    public LoaiSPAdmin() {
    }
    //full getter and setter
    public String getIdLoai() {
        return idLoai;
    }
    public void setIdLoai(String idLoai) {
        this.idLoai = idLoai;
    }
    public String getNameLoai() {
        return nameLoai;
    }
    public void setNameLoai(String nameLoai) {
        this.nameLoai = nameLoai;
    }
    public String getMota() {
        return mota;
    }
    public void setMota(String mota) {
        this.mota = mota;
    }
    public int getSoluongSP() {
        return soluongSP;
    }
    public void setSoluongSP(int soluongSP) {
        this.soluongSP = soluongSP;
    }
    public int getSoluongSPBan() {
        return soluongSPBan;
    }
    public void setSoluongSPBan(int soluongSPBan) {
        this.soluongSPBan = soluongSPBan;
    }
    public void addTheLoaiAdmin(ResultSet rs) throws SQLException {

            this.idLoai = rs.getString("idLoai");
            this.nameLoai = rs.getString("nameLoai");
            this.mota = rs.getString("MOTATHELOAI");
            this.soluongSP = rs.getInt("soLuongSP");
            this.soluongSPBan = rs.getInt("soLuongMua");

    }
}
