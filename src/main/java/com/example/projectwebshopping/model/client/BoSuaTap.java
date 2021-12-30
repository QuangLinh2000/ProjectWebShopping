package com.example.projectwebshopping.model.client;

public class BoSuaTap {
    private String id;
    private String tieuDe;
    private String mota;
    private String hinhAnh;
    private String linnk;
    //empty constructor
    public BoSuaTap(){

    }
    //constructor
    public BoSuaTap(String id, String tieuDe, String mota, String hinhAnh, String linnk) {
        this.id = id;
        this.tieuDe = tieuDe;
        this.mota = mota;
        this.hinhAnh = hinhAnh;
        this.linnk = linnk;
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

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public String getLinnk() {
        return linnk;
    }

    public void setLinnk(String linnk) {
        this.linnk = linnk;
    }


}
