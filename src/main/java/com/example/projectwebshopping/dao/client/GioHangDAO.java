package com.example.projectwebshopping.dao.client;

public class GioHangDAO {
    //pattern singleton
    private static GioHangDAO instance;

    public static GioHangDAO getInstance() {
        if (instance == null) {
            instance = new GioHangDAO();
        }
        return instance;
    }

    private GioHangDAO() {
    }

    public int addGioHang(String idUser,String idSanPham) {

        return 1;
    }
}
