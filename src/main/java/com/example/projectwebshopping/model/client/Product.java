package com.example.projectwebshopping.model.client;

import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.data.DataString;

import java.io.Serializable;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;
import java.util.Random;

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
    private int S;
    private int M;
    private int L;
    private int XL;
    //emty constructor
    public Product() {
    }
    //constructor
    public Product(String maSP, String tenSP, String idBoST, String moTa, double gia, double sell, String mau, Date nayNhap, Date ngayBatDausell, Date ngayHetHansell, String loaiSP, int trangThai, List<String> listUrlImg, int s, int m, int l, int xl) {
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
        this.S = s;
        this.M = m;
        this.L = l;
        this.XL = xl;
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

    public int getS() {
        return S;
    }

    public void setS(int s) {
        S = s;
    }

    public int getM() {
        return M;
    }

    public void setM(int m) {
        M = m;
    }

    public int getL() {
        return L;
    }

    public void setL(int l) {
        L = l;
    }

    public int getXL() {
        return XL;
    }

    public void setXL(int xl) {
        XL = xl;
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
    public void addProduct(ResultSet resultSet) throws SQLException {
        String maSP = resultSet.getString("MASP");
        String tenSP = resultSet.getString("TENSP");
        String url = resultSet.getString("URL");
        String idBoSuaTap2 = resultSet.getString("IDBoSuuTap");
        String moTa = resultSet.getString("MOTA");
        Double donGia = resultSet.getDouble("DONGIA");
        Double sell = resultSet.getDouble("SALE");
        String mau = resultSet.getString("MAU");
        String loaiSP = resultSet.getString("LOAISP");
        int trangThai = resultSet.getInt("TRANGTHAI");
        int S = resultSet.getInt("S");
        int M = resultSet.getInt("M");
        int L = resultSet.getInt("L");
        int XL = resultSet.getInt("XL");
        Date ngayNhap = resultSet.getDate("NGAYNHAP");
        Date ngayBatDauSell = resultSet.getDate("NGAYBATDAUSALE");
        Date ngayHetHanSell = resultSet.getDate("NGAYKETTHUCSALE");

       //get date local now
//        Date date = LocalDateTime.now().toLocalDate().;


        setMaSP(maSP);
        setTenSP(tenSP);
        setIdBoST(idBoSuaTap2);
        setMoTa(moTa);
        setGia(donGia);
        setNgayBatDausell(ngayBatDauSell);
        setNgayHetHansell(ngayHetHanSell);
        if(DataString.isBetween(ngayBatDauSell,ngayHetHanSell)){
            setSell(sell);
        }else{
            setSell(0);
        }
        setMau(mau);
        setLoaiSP(loaiSP);
        setTrangThai(trangThai);
        setNayNhap(resultSet.getDate("NgayNhap"));
        setS(S);
        setM(M);
        setL(L);
        setXL(XL);
        setNayNhap(ngayNhap);

    }
    //format tiền
    public static String formatMoney(Double money){
        String s = String.format("%,.0f",money);
        return s;
    }
   //toJson

//    public static void main(String[] args) {
//        //random date
//        Random random = new Random();
//        int count = 0;
//        while (count < 330){
//            int ngay = random.nextInt(100)+1;
//
//            System.out.println(ngay);
//
//
//
//            count++;
//
//        }
//    }



}
