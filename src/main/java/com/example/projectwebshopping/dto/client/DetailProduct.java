package com.example.projectwebshopping.dto.client;

import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.Product;

public class DetailProduct {
    private Product product;
    //emty constructor
    private BoSuaTap boSuaTap;
    public DetailProduct(){}
    //getter and setter
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public BoSuaTap getBoSuaTap() {
        return boSuaTap;
    }

    public void setBoSuaTap(BoSuaTap boSuaTap) {
        this.boSuaTap = boSuaTap;
    }



}
