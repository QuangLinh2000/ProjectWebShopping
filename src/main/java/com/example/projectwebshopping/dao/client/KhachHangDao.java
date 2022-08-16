package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.model.client.KhachHang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class KhachHangDao {
    //pattern singleton
    private static KhachHangDao instance;

    private KhachHangDao() {
    }

    public static KhachHangDao getInstance() {
        if (instance == null) {
            instance = new KhachHangDao();
        }
        return instance;
    }

    public int themKhachHang(KhachHang khachHang) {
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "INSERT INTO khachhang(IDUSER, HoTen, DienThoai, DiaChi, TinhTP, QuanHuyen, PhuongXa,JOB) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, khachHang.getMaKH());
            preparedStatement.setString(2, khachHang.getTenKH());
            preparedStatement.setString(3, khachHang.getSdt());
            preparedStatement.setString(4, khachHang.getDiaChi());
            preparedStatement.setString(5, khachHang.getTinhTP());
            preparedStatement.setString(6, khachHang.getQuanHuyen());
            preparedStatement.setString(7, khachHang.getPhuongXa());
            preparedStatement.setString(8, "");

            int result = preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return result;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;

    }

    public int suaKhachHang(KhachHang khachHang) {
        try {
            Connection connection = DataSourceConnection.getConnection();
            //sql update
            String sql = "UPDATE khachhang SET" +
                    " HoTen = ?, DienThoai = ?," +
                    " DiaChi = ?, TinhTP = ?, " +
                    "QuanHuyen = ?, PhuongXa = ?" +
                    " WHERE IDUSER = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, khachHang.getTenKH());
            preparedStatement.setString(2, khachHang.getSdt());
            preparedStatement.setString(3, khachHang.getDiaChi());
            preparedStatement.setString(4, khachHang.getTinhTP());
            preparedStatement.setString(5, khachHang.getQuanHuyen());
            preparedStatement.setString(6, khachHang.getPhuongXa());
            preparedStatement.setString(7, khachHang.getMaKH());

            int result = preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return result;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int xoaKhachHang(String idUser) {
        return 0;
    }

    public KhachHang getKhachHangByUserId(String idUser) {
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT * FROM users u JOIN khachhang k ON u.ID = k.IDUSER WHERE u.ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                KhachHang khachHang = new KhachHang();
                khachHang.addKhachHang(resultSet);
                resultSet.close();
                preparedStatement.close();
                DataSourceConnection.returnConnection(connection);
                return khachHang;
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return null;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
