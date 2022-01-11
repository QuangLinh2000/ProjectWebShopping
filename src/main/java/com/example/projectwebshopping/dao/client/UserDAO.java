package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.model.client.User;

import java.sql.*;
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

    public boolean isValidUser(String username,String mail) {
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where username = ? or USERMAIL = ?");
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,mail);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                preparedStatement.close();
                DataSourceConnection.returnConnection(connection);
                return false;
            }
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean insertUser(String username,String password,String mail,String vetificationCode,String idUser){
        try {
            Connection connection =  DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into users value(?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1,idUser);
            preparedStatement.setString(2,username);
            preparedStatement.setString(3,hashPassword(password));
            preparedStatement.setString(4,mail);
            preparedStatement.setInt(5,1);
            preparedStatement.setString(6,vetificationCode);
            preparedStatement.setLong(7, System.currentTimeMillis());
            preparedStatement.setInt(8,1);
            if(preparedStatement.executeUpdate()==1){
                preparedStatement.close();
                DataSourceConnection.returnConnection(connection);
                return true;
            }
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return false;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean isVerification(String idUser,String verificationCode){
        try {
            Connection connection =  DataSourceConnection.getConnection();
            //inser sql user

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from users where id = ? and VERICAIONCODE = ?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1,idUser);
            preparedStatement.setString(2,verificationCode);
            ResultSet     resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int ve = resultSet.getInt("isvirification");
               if(ve == 1){
                   resultSet.updateInt("isvirification",0);
                   resultSet.updateRow();
               }
                resultSet.close();
                preparedStatement.close();
                DataSourceConnection.returnConnection(connection);
                return true;

            }
           resultSet.close();
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
    //check login
    public User checkLogin(String username, String password){
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where username = ? and USERPASSWORD = ?");
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,hashPassword(password));
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                int isVirification = resultSet.getInt("isvirification");
                if(isVirification == 1){
                    resultSet.close();
                    preparedStatement.close();
                    DataSourceConnection.returnConnection(connection);
                    return null;
                }
                User user = new User();
                user.setId(resultSet.getString("id"));
                user.setEmail(resultSet.getString("usermail"));
                user.setUsername(resultSet.getString("username"));
                resultSet.close();
                preparedStatement.close();
                DataSourceConnection.returnConnection(connection);
                return user;
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
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


    public User getUserByUsername(String userName, String vetificationCode) {
        try {
            Connection connection =  DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where username = ?",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1,userName);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                User user = new User();
                user.setId(resultSet.getString("id"));
                user.setEmail(resultSet.getString("usermail"));
                user.setUsername(resultSet.getString("username"));
                if (resultSet.getInt("ISVIRIFICATION") == 0){
                    resultSet.updateString("VERICAIONCODE",vetificationCode);
                    resultSet.updateRow();
                }
                user.setVerificationCode(resultSet.getString("VERICAIONCODE"));
                resultSet.close();
                preparedStatement.close();
                DataSourceConnection.returnConnection(connection);
                return user;
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int updatePassword(String userName, String password, String code, String newCode) {
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "update users set USERPASSWORD = ?,VERICAIONCODE = ? where username = ? and VERICAIONCODE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,hashPassword(password));
            preparedStatement.setString(2,newCode);
            preparedStatement.setString(3,userName);
            preparedStatement.setString(4,code);
            int result = preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return result;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
