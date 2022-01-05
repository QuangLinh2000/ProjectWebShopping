package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.model.client.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDao {
    //pattern singleton
    private static CartDao instance;

    public static CartDao getInstance() {
        if (instance == null) {
            instance = new CartDao();
        }
        return instance;
    }

    private CartDao() {
    }

    public void addGioHang(String idUser,String idSanPham,int soLuong,String size) {
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT * FROM giohang WHERE IDUSER = ? AND IDSP = ? AND SIZE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1,idUser);
            preparedStatement.setString(2,idSanPham);
            preparedStatement.setString(3,size);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                int soLuongCurent = resultSet.getInt("SOLUONG");

                resultSet.updateInt("SOLUONG",soLuongCurent+soLuong);
                resultSet.updateRow();

            }else{
                String sql2 = "INSERT INTO giohang(IDUSER,IDSP,SOLUONG,SIZE) VALUES(?,?,?,?)";
                preparedStatement = connection.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                preparedStatement.setString(1,idUser);
                preparedStatement.setString(2,idSanPham);
                preparedStatement.setInt(3,soLuong);
                preparedStatement.setString(4,size);
                preparedStatement.executeUpdate();

            }

            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public int getSizeCart(String idUser) {
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT SUM(SOLuong) SL FROM giohang WHERE IDUSER = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            int soLuong = 0;
            if(resultSet.next()){
                 soLuong = resultSet.getInt("SL");



            }

            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return soLuong;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
