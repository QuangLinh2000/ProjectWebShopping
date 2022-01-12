package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.model.admin.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
            String sql = "SELECT *  FROM hoadon";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                if(resultSet.getInt("trangthai") == 3) {
                    sum += resultSet.getDouble("tongtien");
                }
            }
            resultSet.close();
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
            String sql = "SELECT *  FROM hoadon";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery();
             while (resultSet.next()) {
                 if(resultSet.getInt("trangthai") == 3) {
                     sum++;
                 }
             }
            resultSet.close();
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
            String sql = "SELECT SUM(S+L+M+XL) tong FROM products";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                sum = resultSet.getInt("tong");
            }
            resultSet.close();

            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sum;
    }
   //total client
    public int getTotalClient() {
        int sum = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT COUNT(*) tong FROM users";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                sum = resultSet.getInt("tong");
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sum;
    }

    //get all bill
    public List<Order> getNewBell(int limit) {
        List<Order> orders = new ArrayList<>();

        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT h.MAHOADON,h.IDUSER,h.NgayDatHang,h.TrangThai,h.ngayNhanHang,h.SoNgayDuKien,h.tongTien,\n" +
                    "u.USERMAIL,k.HoTen,k.DiaChi,k.TinhTP,k.QuanHuyen,k.PhuongXa FROM hoadon h JOIN users u ON u.ID = h.IDUSER\n" +
                    "JOIN khachhang k ON u.ID = k.IDUSER ORDER BY h.NgayDatHang DESC LIMIT ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, limit);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.addOrder(resultSet);
                orders.add(order);


            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
