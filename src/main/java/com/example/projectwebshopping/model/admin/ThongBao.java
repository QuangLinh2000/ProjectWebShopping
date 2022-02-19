package com.example.projectwebshopping.model.admin;

import java.sql.Date;
import java.sql.ResultSet;

public class ThongBao {
    private String idThongBao;
    private String title;
    private String mota;
    private String link;
    private Date ngayCapNhat;
    //0 là chưa đọc 1 đã xem
    private int trangThai;
    // 0 chờ xác nhận, 1 đã hủy , 2 đã xác nhận, 3 đang giao hàng, 4 đã giao hàng
    private int loaiThongBao;
    //0 là admin 1 là user
    private int phanLoai;
    private String idUser;
    //26aff6a7-5032-4b51-8c7f-4beaf0a90417

    //emty contructor
    public ThongBao() {
    }
    //seter and geter
    public String getIdThongBao() {
        return idThongBao;
    }

    public void setIdThongBao(String idThongBao) {
        this.idThongBao = idThongBao;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Date getNgayCapNhat() {
        return ngayCapNhat;
    }

    public void setNgayCapNhat(Date ngayCapNhat) {
        this.ngayCapNhat = ngayCapNhat;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public int getLoaiThongBao() {
        return loaiThongBao;
    }

    public void setLoaiThongBao(int loaiThongBao) {
        this.loaiThongBao = loaiThongBao;
    }

    public int getPhanLoai() {
        return phanLoai;
    }

    public void setPhanLoai(int phanLoai) {
        this.phanLoai = phanLoai;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public void getThongBao(ResultSet rs) {
        try {
            this.setIdThongBao(rs.getString("idThongBao"));
            this.setTitle(rs.getString("title"));
            this.setMota(rs.getString("mota"));
            this.setLink(rs.getString("link"));
            this.setNgayCapNhat(rs.getDate("ngayCapNhat"));
            this.setTrangThai(rs.getInt("trangThai"));
            this.setLoaiThongBao(rs.getInt("loaiThongBao"));
            this.setPhanLoai(rs.getInt("phanLoai"));
            this.setIdUser(rs.getString("idUser"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
