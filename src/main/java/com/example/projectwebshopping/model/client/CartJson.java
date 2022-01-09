package com.example.projectwebshopping.model.client;

public class CartJson {
    private String id;
    private String size;
    private int quantity;
    private String name;
    private String img;
    //empty constructor
    public CartJson(){}
    //constructor
    public CartJson(String id, String size, int quantity, String name, String img) {
        this.id = id;
        this.size = size;
        this.quantity = quantity;
        this.name = name;
        this.img = img;
    }
    //getters and setters
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    //toString
    @Override
    public String toString() {
        return "CartJson{" + "id=" + id + ", size=" + size + ", quantity=" + quantity + ", name=" + name + ", img=" + img + '}';
    }
}
