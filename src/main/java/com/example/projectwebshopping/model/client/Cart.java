package com.example.projectwebshopping.model.client;

public class Cart {
    private String idUser;
    private String idProduct;
    private int quantity;
    private String size;
    //EMPTY CONSTRUCTOR
    public Cart() {
    }
    //GETTERS AND SETTERS
    public String getIdUser() {
        return idUser;
    }
    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }
    public String getIdProduct() {
        return idProduct;
    }
    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public String getSize() {
        return size;
    }
    public void setSize(String size) {
        this.size = size;
    }

}
