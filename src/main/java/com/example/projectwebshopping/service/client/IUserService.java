package com.example.projectwebshopping.service.client;

public interface IUserService {
    //check if user is valid
    boolean isValidUser(String username, String email);

    //send mail
    void sendMail(String email, String subject, String text);

    boolean isVerification(String idUser, String verificationCode);

    boolean insertUser(String username, String password, String mail, String vetificationCode, String idUser);

    boolean checkLogin(String username, String password);


}
