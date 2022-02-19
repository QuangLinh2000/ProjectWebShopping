package com.example.projectwebshopping.model.admin;

import java.util.List;
import java.util.Map;

public class DeleteProduct {
    private List<String> productId;
    private Map<Integer,Integer> map;

    //full contructor
    public DeleteProduct(List<String> productId, Map<Integer,Integer> map) {
        this.productId = productId;
        this.map = map;
    }

    public List<String> getProductId() {
        return productId;
    }

    public void setProductId(List<String> productId) {
        this.productId = productId;
    }

    public Map<Integer, Integer> getMap() {
        return map;
    }

    public void setMap(Map<Integer, Integer> map) {
        this.map = map;
    }
}
