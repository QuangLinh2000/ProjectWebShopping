package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.UUID;

public class UserDAO {
    //create singleton
    private static UserDAO instance;

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    public boolean isValidUser(String username, String password,String mail) {
        try {
            Connection connection =  DataSourceConnection.getConnection();
            //inser sql user

            PreparedStatement preparedStatement = connection.prepareStatement("insert into users value(?,?,?,?,?,?,?,?)");
            UUID uuid = UUID.randomUUID();
            preparedStatement.setString(1,uuid.toString());
            preparedStatement.setString(2,username);
            preparedStatement.setString(3,password);
            preparedStatement.setString(4,mail);
            preparedStatement.setInt(5,1);
            preparedStatement.setString(6,UUID.randomUUID().toString());
            preparedStatement.setLong(7, System.currentTimeMillis());
            preparedStatement.setInt(8,1);
            if(preparedStatement.executeUpdate()==1){
                return true;
            }
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return false;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    //hash password using SHA-512
    public String hashPassword(String password) {
        String hash = null;
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-512");
            byte[] hashBytes = md.digest(password.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < hashBytes.length; i++) {
                sb.append(Integer.toString((hashBytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            hash = sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hash;
    }
}
