package com.example.projectwebshopping.dto.client;

import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.Product;

import java.util.List;

public class DetailProduct {
    private Product product;
    //emty constructor
    private BoSuaTap boSuaTap;
    private List<Product> related;
    public DetailProduct(){}
    //getter and setter

    public List<Product> getRelated() {
        return related;
    }

    public void setRelated(List<Product> related) {
        this.related = related;
    }

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
