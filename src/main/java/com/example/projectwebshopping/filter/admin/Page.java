package com.example.projectwebshopping.filter.admin;

import com.example.projectwebshopping.model.client.Product;

import java.util.List;

public class Page {
    private List<Product> products;
    private int productCount;
    // empty constructor
    public Page() {
    }

    //full getter and setter
    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }
    public int getPageCount(int pageSize) {
        if(productCount % pageSize == 0) {
            return productCount / pageSize;
        }
        return productCount / pageSize + 1;
    }

}
