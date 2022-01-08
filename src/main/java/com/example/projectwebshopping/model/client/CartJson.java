package com.example.projectwebshopping.model.client;

public class CartJson {
    private String id;
    private String size;
    //empty constructor
    public CartJson(){}
    //constructor
    public CartJson(String id, String size){
        this.id = id;
        this.size = size;
    }
    //getter and setter
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
    //toString
    @Override
    public String toString() {
        return "CartJson{" + "id=" + id + ", size=" + size + '}';
    }
}
