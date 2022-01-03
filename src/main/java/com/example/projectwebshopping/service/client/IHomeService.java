package com.example.projectwebshopping.service.client;

import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.model.client.QuangCao;

import java.util.List;

public interface IHomeService {
    List<BoSuaTap> getBSHome();
    List<QuangCao> getAllQC();
    List<LoaiSP> getAllLoaiSP();
    List<Product> getAllProductByBSTId(String idBoSuaTap,int limit);
    List<Product> getSanPhamNoiBat(int loaiSlected,int limit);
    List<Product> getSanPhamHeader(String idLoai,int limit,int loaiSlected);
    List<Product> getProducts(String idLoai,int loaiSlected);
}
