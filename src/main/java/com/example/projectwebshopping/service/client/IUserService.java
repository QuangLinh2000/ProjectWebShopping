package com.example.projectwebshopping.service.client;

import com.example.projectwebshopping.model.client.User;

public interface IUserService {
    //check if user is valid
    boolean isValidUser(String username, String email);

    //send mail
    void sendMail(String email, String subject, String text);
    void sendMailHtml(String email, String s, String mainText);
    boolean isVerification(String idUser, String verificationCode);

    boolean insertUser(String username, String password, String mail, String vetificationCode, String idUser);

    User checkLogin(String username, String password);


    User getUserByUsername(String userName, String vetificationCode);

    int updatePassword(String userName, String password, String code, String newCode);
}
