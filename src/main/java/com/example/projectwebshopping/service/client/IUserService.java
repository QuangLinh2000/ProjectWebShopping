package com.example.projectwebshopping.service.client;

public interface IUserService {
    //check if user is valid
    boolean isValidUser(String username, String password,String email);
    //send mail
    void sendMail(String email, String subject, String text);
}
