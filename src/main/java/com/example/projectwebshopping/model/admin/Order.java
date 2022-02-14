package com.example.projectwebshopping.model.admin;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class Order {
    private String orderId;
    private String userId;
    private Date orderDate;
    // 0 chờ xác nhận, 1 đã hủy , 2 đã xác nhận, 3 đang giao hàng, 4 đã giao hàng
    private int status;
    private Date ngayNhanHang;
    private int soNgayDuKien;
    private int totalPrice;
    private String email;
    private String name;
    private String phone;
    private String address;
    private String tinhTP;
    private String quanHuyen;
    private String phuongXa;
    //constructor
    public Order() {
    }
     //getter and setter
    public String getOrderId() {
        return orderId;
    }
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }


    public int getTotalPrice() {
        return totalPrice;
    }
    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public Date getNgayNhanHang() {
        return ngayNhanHang;
    }
    public void setNgayNhanHang(Date ngayNhanHang) {
        this.ngayNhanHang = ngayNhanHang;
    }
    public int getSoNgayDuKien() {
        return soNgayDuKien;
    }
    public void setSoNgayDuKien(int soNgayDuKien) {
        this.soNgayDuKien = soNgayDuKien;
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
    public String getTrangThai() {
        switch (status) {
            case 0:
                return "Chờ xác nhận";
            case 1:
                return "Đã hủy";
            case 2:
                return "Đã xác nhận";
            case 3:
                return "Đang giao hàng";
            case 4:
                return "Đã giao hàng";
            default:
                return "Chờ xác nhận";
        }
    }
    public void setTrangThai(int status) {
        this.status = status;
    }

    public String getClassTrangThai() {
        switch (status) {
            case 0:
                return "alert-warning";
            case 1:
                return "alert-danger";
            case 2:
                return "alert-primary";
            case 3:
                return "alert-info";
            case 4:
                return "alert-success";
            default:
                return "alert-warning";
        }
    }

    public void addOrder(ResultSet resultSet) throws SQLException {
        String MAHOADON =resultSet.getString("MAHOADON");
        String IDUSER =resultSet.getString("IDUSER");
        Date NgayDatHang = resultSet.getDate("NgayDatHang");
        int TrangThai = resultSet.getInt("TrangThai");
        Date ngayNhanHang = resultSet.getDate("ngayNhanHang");
        int SoNgayDuKien = resultSet.getInt("SoNgayDuKien");
        double tongTien = resultSet.getDouble("tongTien");
        String USERMAIL = resultSet.getString("USERMAIL");
        String HoTen = resultSet.getString("HoTen");
        String DiaChi = resultSet.getString("DiaChi");
        String TinhTP = resultSet.getString("TinhTP");
        String QuanHuyen = resultSet.getString("QuanHuyen");
        String PhuongXa = resultSet.getString("PhuongXa");

        this.setOrderId(MAHOADON);
        this.setUserId(IDUSER);
        this.setOrderDate(NgayDatHang);
        this.setStatus(TrangThai);
        this.setNgayNhanHang(ngayNhanHang);
        this.setSoNgayDuKien(SoNgayDuKien);
        this.setTotalPrice((int)tongTien);
        this.setEmail(USERMAIL);
        this.setName(HoTen);
        this.setPhone(DiaChi);
        this.setAddress(TinhTP);
        this.setTinhTP(TinhTP);
        this.setQuanHuyen(QuanHuyen);
        this.setPhuongXa(PhuongXa);

    }
    public void addOrderUser(ResultSet resultSet) throws SQLException {
        String MAHOADON =resultSet.getString("MAHOADON");
        String IDUSER =resultSet.getString("IDUSER");
        Date NgayDatHang = resultSet.getDate("NgayDatHang");
        int TrangThai = resultSet.getInt("TrangThai");
        Date ngayNhanHang = resultSet.getDate("ngayNhanHang");
        int SoNgayDuKien = resultSet.getInt("SoNgayDuKien");
        double tongTien = resultSet.getDouble("tongTien");

        this.setOrderId(MAHOADON);
        this.setUserId(IDUSER);
        this.setOrderDate(NgayDatHang);
        this.setStatus(TrangThai);
        this.setNgayNhanHang(ngayNhanHang);
        this.setSoNgayDuKien(SoNgayDuKien);
        this.setTotalPrice((int)tongTien);

    }

    public String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        return sdf.format(date);
    }



}
