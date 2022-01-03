package com.example.projectwebshopping.model.client;

import java.util.ArrayList;
import java.util.List;

public class ProductManager {
    //patern singleton
    private static ProductManager instance;
    private ProductManager(){}
    public static ProductManager getInstance(){
        if(instance == null){
            instance = new ProductManager();
        }
        return instance;
    }
    //sort list Product by price

    public List<Product> sortByPriceTC(List<Product> products){
        products.sort((p1,p2)->{
            if((1-p1.getSell())*p1.getGia() > (1-p2.getSell())*p2.getGia()){
                return 1;
            }else if((1-p1.getSell())*p1.getGia() < (1-p2.getSell())*p2.getGia()){
                return -1;
            }
            return 0;
        });
        return products;
    }
    public List<Product> sortByPriceCT(List<Product> products){
        products.sort((p1,p2)->{
            if((1-p1.getSell())*p1.getGia() < (1-p2.getSell())*p2.getGia()){
                return 1;
            }else if((1-p1.getSell())*p1.getGia() > (1-p2.getSell())*p2.getGia()){
                return -1;
            }
            return 0;
        });
        return products;
    }
    //sort list Product by name a - z
    public List<Product> sortByNameAZ(List<Product> products){
        products.sort((p1,p2)->{
            if(p1.getTenSP().compareTo(p2.getTenSP()) < 0){
                return -1;
            }else if(p1.getTenSP().compareTo(p2.getTenSP()) > 0){
                return 1;
            }
            return 0;
        });
        return products;
    }
    //sort list Product by name z - a
    public List<Product> sortByNameZA(List<Product> products){
        products.sort((p1,p2)->{
            if(p1.getTenSP().compareTo(p2.getTenSP()) > 0){
                return -1;
            }else if(p1.getTenSP().compareTo(p2.getTenSP()) < 0){
                return 1;
            }
            return 0;
        });
        return products;
    }
    // get color
    public List<String> getColor(List<Product> products){
        List<String> colors = new ArrayList<>();
        for(Product p: products){
            if(!colors.contains(p.getMau())){
                colors.add(p.getMau());
            }
        }
        return colors;
    }


}
