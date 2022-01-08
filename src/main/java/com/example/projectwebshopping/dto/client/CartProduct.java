package com.example.projectwebshopping.dto.client;

import com.google.gson.Gson;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class CartProduct {
    private String id;
    private String name;
    private double price;
    private double sale;
    private String mau;
    private int soLuong;
    private String image;
    private int S;
    private int M;
    private int L;
    private int XL;
    private int trangThai;
    private String size;

    public CartProduct() {
    }
    //Constructor




    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public String getMau() {
        return mau;
    }

    public void setMau(String mau) {
        this.mau = mau;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public void setXL(int XL) {
        this.XL = XL;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public CartProduct(String id, String name, double price, double sale, String mau, int soLuong, String image, int S, int M, int L, int XL, int trangThai, String size) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.sale = sale;
        this.mau = mau;
        this.soLuong = soLuong;
        this.image = image;
        this.S = S;
        this.M = M;
        this.L = L;
        this.XL = XL;
        this.trangThai = trangThai;
        this.size = size;
    }

    public void addCartProduct(ResultSet rs) {
        try {
            this.setId(rs.getString("MASP"));
            this.setName(rs.getString("TENSP"));
            this.setPrice(rs.getDouble("DONGIA"));
            this.setSale(rs.getDouble("SALE"));
            this.setMau(rs.getString("MAU"));
            this.setSoLuong(rs.getInt("SOLUONG"));
            this.setImage(rs.getString("URL"));
            this.setS(rs.getInt("S"));
            this.setM(rs.getInt("M"));
            this.setL(rs.getInt("L"));
            this.setXL(rs.getInt("XL"));
            this.setTrangThai(rs.getInt("TRANGTHAI"));
            this.setSize(rs.getString("SIZE"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCartProductSesstion(ResultSet rs) {
        try {
            this.setId(rs.getString("MASP"));
            this.setName(rs.getString("TENSP"));
            this.setPrice(rs.getDouble("DONGIA"));
            this.setSale(rs.getDouble("SALE"));
            this.setMau(rs.getString("MAU"));
            this.setImage(rs.getString("URL"));
            this.setS(rs.getInt("S"));
            this.setM(rs.getInt("M"));
            this.setL(rs.getInt("L"));
            this.setXL(rs.getInt("XL"));
            this.setTrangThai(rs.getInt("TRANGTHAI"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //conver t to string

    @Override
    public String toString() {
        return "{" +
                "id:'" + id + '\'' +
                ", name:'" + name + '\'' +
                ", price:" + price +
                ", sale:" + sale +
                ", mau:'" + mau + '\'' +
                ", soLuong:" + soLuong +
                ", image:'" + image + '\'' +
                ", S:" + S +
                ", M:" + M +
                ", L:" + L +
                ", XL:" + XL +
                ", trangThai':" + trangThai +
                ", 'size':'" + size + '\'' +
                '}';
    }
    public Map<String, Integer> getMapSize() {
        Map<String, Integer> map = new HashMap<>();
        map.put("S", S);
        map.put("M", M);
        map.put("L", L);
        map.put("XL", XL);
        return map;
    }


}

