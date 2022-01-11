package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class HoaDonDao {
    //pattern Singleton
    private static HoaDonDao instance;

    public static HoaDonDao getInstance() {
        if (instance == null) {
            instance = new HoaDonDao();
        }
        return instance;
    }

    private HoaDonDao() {
    }
    //total revenue
    public double getTotalRevenue() {
        double sum = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT SUM(PRICE * SOLUONG) FROM cthoadon";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
           sum = preparedStatement.executeQuery().getDouble(1);

            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sum;
    }
    //total  of bill
    public int getTotalSumOfBill() {
        int sum = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM hoadon";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            sum = preparedStatement.executeQuery().getInt(1);

            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sum;
    }
    //total product
    public int getTotalProduct() {
        int sum = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT SUM(S+L+M+XL) FROM products";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            sum = preparedStatement.executeQuery().getInt(1);

            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sum;
    }
    
}
