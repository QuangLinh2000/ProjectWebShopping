package com.example.projectwebshopping.model.client;

import java.io.Serializable;
import java.sql.ResultSet;

public class BoSuaTap implements Serializable {
    private String id;
    private String name;
    private String tieuDe;
    private String mota;
    private String hinhAnh;
    private int check;
    //empty constructor
    public BoSuaTap(){

    }
    //constructor
    public BoSuaTap(String id, String name, String tieuDe, String mota, String hinhAnh) {
        this.id = id;
        this.name = name;
        this.tieuDe = tieuDe;
        this.mota = mota;
        this.hinhAnh = hinhAnh;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public int getCheck() {
        return check;
    }

    public void setCheck(int check) {
        this.check = check;
    }

    public void addBoST(ResultSet resultSet){
        try{
            this.id = resultSet.getString("IdBST");
            this.name = resultSet.getString("name");
            this.tieuDe = resultSet.getString("tieuDe");
            this.mota = resultSet.getString("motaBST");
            this.hinhAnh = resultSet.getString("URL");
            this.check = resultSet.getInt("check");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}



