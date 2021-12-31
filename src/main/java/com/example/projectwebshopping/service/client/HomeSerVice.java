package com.example.projectwebshopping.service.client;

import com.example.projectwebshopping.dao.client.BoSuaTapDao;
import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.dao.client.QuangCaoDao;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.model.client.QuangCao;

import java.util.List;

public class HomeSerVice implements IHomeService{
    @Override
    public List<BoSuaTap> getBSHome() {
        return BoSuaTapDao.getInstance().getBSHome();
    }

    @Override
    public List<QuangCao> getAllQC() {
        return QuangCaoDao.getInstance().getAllQC();
    }

    @Override
    public List<LoaiSP> getAllLoaiSP() {
        return LoaiSPDao.getInstance().getAllLoaiSP();
    }

    @Override
    public List<Product> getAllProductByBSTId(String idBoSuaTap) {
        return ProductDao.getInstance().getAllProductByBSTId(idBoSuaTap);
    }

    @Override
    public List<Product> getSanPhamNoiBat(int loaiSlected) {
        return ProductDao.getInstance().getSanPhamNoiBat(loaiSlected);
    }
}
