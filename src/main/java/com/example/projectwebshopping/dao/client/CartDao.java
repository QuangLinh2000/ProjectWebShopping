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

    public void addGioHang(String idUser,String idSanPham,int soLuong) {
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT * FROM giohang WHERE IDUSER = ? AND IDSP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1,idUser);
            preparedStatement.setString(2,idSanPham);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                int soLuongCurent = resultSet.getInt("SOLUONG");

                resultSet.updateInt("SOLUONG",soLuongCurent+soLuong);
                resultSet.updateRow();

            }else{
                String sql2 = "INSERT INTO giohang(IDUSER,IDSP,SOLUONG) VALUES(?,?,?)";
                preparedStatement = connection.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                preparedStatement.setString(1,idUser);
                preparedStatement.setString(2,idSanPham);
                preparedStatement.setInt(3,soLuong);
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
}
