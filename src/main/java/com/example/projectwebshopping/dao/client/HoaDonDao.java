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

    public List<Order> getAllBill(int limit,int start,Date ngay,String status) {
        List<Order> orders = new ArrayList<>();

        try {
            Connection connection = DataSourceConnection.getConnection();

            String where = "";
            String sqlStart ="SELECT h.MAHOADON,h.IDUSER,h.NgayDatHang,h.TrangThai,h.ngayNhanHang,h.SoNgayDuKien,h.tongTien, " +
                    " u.USERMAIL,k.HoTen,k.DiaChi,k.TinhTP,k.QuanHuyen,k.PhuongXa " +
                    " FROM hoadon h " +
                    " JOIN users u ON u.ID = h.IDUSER " +
                    " JOIN khachhang k ON u.ID = k.IDUSER WHERE 1 =1";
            if(ngay != null){
                where += " AND h.NgayDatHang = '"+ngay+"'";
            }
            if(status != null){
                where += " AND h.TrangThai = '"+status+"'";
            }
            String sql = sqlStart+where+" ORDER BY h.NgayDatHang DESC LIMIT ?,?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, start);
            preparedStatement.setInt(2, limit);
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

    public List<Order> getBellUser(int limit,int start,String idUser,String xemTrangThaiDonHang) {
        List<Order> orders = new ArrayList<>();

        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "";
            if(xemTrangThaiDonHang.equals("all")){
                sql = "SELECT * FROM hoadon WHERE IDUSER = ? ORDER BY NgayDatHang DESC LIMIT ?,?";
            }
            if(xemTrangThaiDonHang.equals("0")){
                sql = "SELECT * FROM hoadon WHERE IDUSER = ? AND TrangThai = 0 ORDER BY NgayDatHang DESC LIMIT ?,?";
            }
            if(xemTrangThaiDonHang.equals("1")){
                sql = "SELECT * FROM hoadon WHERE IDUSER = ? AND TrangThai = 1 ORDER BY NgayDatHang DESC LIMIT ?,?";
            }
            if(xemTrangThaiDonHang.equals("2")){
                sql = "SELECT * FROM hoadon WHERE IDUSER = ? AND TrangThai = 2 ORDER BY NgayDatHang DESC LIMIT ?,?";
            }
            if(xemTrangThaiDonHang.equals("3")){
                sql = "SELECT * FROM hoadon WHERE IDUSER = ? AND TrangThai = 3 ORDER BY NgayDatHang DESC LIMIT ?,?";
            }
            if(xemTrangThaiDonHang.equals("4")){
                sql = "SELECT * FROM hoadon WHERE IDUSER = ? AND TrangThai = 4 ORDER BY NgayDatHang DESC LIMIT ?,?";
            }
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idUser);
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, limit);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.addOrderUser(resultSet);
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
    public List<ChiTietHoaDon> getCTHoaDon(String idHoaDon) {
        List<ChiTietHoaDon> chiTietHoaDons = new ArrayList<>();
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT c.MaHD,c.PRICE,c.SOLUONG,c.MASP,h.URL,c.SIZE,p.TENSP FROM cthoadon c \n" +
                    "JOIN hinhanh h ON c.MaSP = h.IDSP \n" +
                    "JOIN products p ON h.IDSP = p.MASP\n" +
                    "WHERE MaHD = ? GROUP BY c.MaHD,c.PRICE,c.SOLUONG,c.MASP,c.SIZE,p.TENSP";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idHoaDon);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
                chiTietHoaDon.addChiTietHoaDon(resultSet);
                chiTietHoaDons.add(chiTietHoaDon);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chiTietHoaDons;
    }

    public int getSumBillUser(String idUser,String xemTrangThaiDonHang) {
        int sum = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "";
            if(xemTrangThaiDonHang.equals("all")){
                sql = "SELECT COUNT(*) SOLUONG FROM hoadon  WHERE IDUSER = ?";
            }
            if(xemTrangThaiDonHang.equals("0")){
                sql = "SELECT COUNT(*) SOLUONG FROM hoadon  WHERE IDUSER = ? AND TrangThai = 0";
            }
            if(xemTrangThaiDonHang.equals("1")){
                sql = "SELECT COUNT(*) SOLUONG FROM hoadon  WHERE IDUSER = ? AND TrangThai = 1";
            }
            if(xemTrangThaiDonHang.equals("2")){
                sql = "SELECT COUNT(*) SOLUONG FROM hoadon  WHERE IDUSER = ? AND TrangThai = 2";
            }
            if(xemTrangThaiDonHang.equals("3")){
                sql = "SELECT COUNT(*) SOLUONG FROM hoadon  WHERE IDUSER = ? AND TrangThai = 3";
            }
            if(xemTrangThaiDonHang.equals("4")){
                sql = "SELECT COUNT(*) SOLUONG FROM hoadon  WHERE IDUSER = ? AND TrangThai = 4";
            }
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                sum = resultSet.getInt(1);
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
}
