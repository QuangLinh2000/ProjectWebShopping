package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.model.admin.DeleteProduct;
import com.example.projectwebshopping.model.admin.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
                    "u.USERMAIL,k.HoTen,k.DiaChi,k.TinhTP,k.QuanHuyen,k.PhuongXa,K.DienThoai FROM hoadon h JOIN users u ON u.ID = h.IDUSER\n" +
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

    public List<Order> getAllBill(int limit,int start,Date ngay,String status,String key) {
        List<Order> orders = new ArrayList<>();

        try {
            Connection connection = DataSourceConnection.getConnection();

            String where = "";
            String sqlStart ="SELECT h.MAHOADON,h.IDUSER,h.NgayDatHang,h.TrangThai,h.ngayNhanHang,h.SoNgayDuKien,h.tongTien, " +
                    " u.USERMAIL,k.HoTen,k.DiaChi,k.TinhTP,k.QuanHuyen,k.PhuongXa,k.DienThoai " +
                    " FROM hoadon h " +
                    " JOIN users u ON u.ID = h.IDUSER " +
                    " JOIN khachhang k ON u.ID = k.IDUSER " +
                    "WHERE h.IDUSER LIKE ? OR h.MAHOADON LIKE ? OR k.HoTen LIKE ?  ";
            if(ngay != null){
                where += " AND h.NgayDatHang = '"+ngay+"'";
            }
            if(status != null){
                where += " AND h.TrangThai = '"+status+"'";
            }
            String sql = sqlStart+where+" ORDER BY h.NgayDatHang DESC LIMIT ?,?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%"+key+"%");
            preparedStatement.setString(2, "%"+key+"%");
            preparedStatement.setString(3, "%"+key+"%");
            preparedStatement.setInt(4, start);
            preparedStatement.setInt(5, limit);
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
    public int getCountAllBill(Date ngay,String status,String key) {
        int sum = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();

            String where = "";
            String sqlStart ="SELECT COUNT(*) soluong" +
                    " FROM hoadon h " +
                    " JOIN users u ON u.ID = h.IDUSER " +
                    " JOIN khachhang k ON u.ID = k.IDUSER WHERE h.IDUSER LIKE ? OR h.MAHOADON LIKE ? OR k.HoTen LIKE ? ";
            if(ngay != null){
                where += " AND h.NgayDatHang = '"+ngay+"'";
            }
            if(status != null){
                where += " AND h.TrangThai = '"+status+"'";
            }
            String sql = sqlStart+where+" ORDER BY h.NgayDatHang ";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%"+key+"%");
            preparedStatement.setString(2, "%"+key+"%");
            preparedStatement.setString(3, "%"+key+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                sum = resultSet.getInt("soluong");


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
    public Order getBill(String id) {
        Order order = new Order();

        try {
            Connection connection = DataSourceConnection.getConnection();

            String where = "";
            String sqlStart ="SELECT h.MAHOADON,h.IDUSER,h.NgayDatHang,h.TrangThai,h.ngayNhanHang,h.SoNgayDuKien,h.tongTien, " +
                    " u.USERMAIL,k.HoTen,k.DiaChi,k.TinhTP,k.QuanHuyen,k.PhuongXa,K.DienThoai " +
                    " FROM hoadon h " +
                    " JOIN users u ON u.ID = h.IDUSER " +
                    " JOIN khachhang k ON u.ID = k.IDUSER " +
                    "WHERE  h.MAHOADON = ? ";

            String sql = sqlStart+where;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                order.addOrder(resultSet);

            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
    public int updateOder(String maDonHang,int status,int soNgayDuKien) {
        int result = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String start = "UPDATE hoadon SET TrangThai = ? ";
            if( status == 4){
                start = start + " ,ngayNhanHang = NOW() ";
            }
            if(status == 2){
                start = start + " ,SoNgayDuKien = ? ";
            }
            String sql = start+" WHERE MAHOADON = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, status);
            if(status == 2){
                preparedStatement.setInt(2, soNgayDuKien);
                preparedStatement.setString(3, maDonHang);
            }else{
                preparedStatement.setString(2, maDonHang);
            }

            result = preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public int huyHoaDon(String maDonHang,List<ChiTietHoaDon> listIdSanPham) {
        int result = 0;
        int result1 = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            connection.setAutoCommit(false);
            String sql = "UPDATE hoadon SET TrangThai = 1,ngayNhanHang = NOW()  WHERE MAHOADON = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, maDonHang);
            result = preparedStatement.executeUpdate();
            preparedStatement.close();

            String where = "";
            for (int i = 0; i < listIdSanPham.size(); i++){
                if(i == 0){
                    where = " WHERE MASP = ?";
                }else{
                    where = where + " OR MASP = ?";
                }
            }
            String sql1 = "SELECT * FROM products "+where;
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql1,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            for (int i = 0; i < listIdSanPham.size(); i++){
                preparedStatement1.setString(i+1, listIdSanPham.get(i).getMaSanPham());
            }
            ResultSet resultSet = preparedStatement1.executeQuery();
            while (resultSet.next()){
                String id = resultSet.getString("MASP");
                for (int i = 0; i < listIdSanPham.size(); i++){
                    if(id.equals(listIdSanPham.get(i).getMaSanPham())){
                        int soLuong = resultSet.getInt(listIdSanPham.get(i).getSize());
                        resultSet.updateInt(listIdSanPham.get(i).getSize(),soLuong+listIdSanPham.get(i).getSoLuong());
                        resultSet.updateRow();
                        listIdSanPham.remove(i);
                        break;
                    }
                }


            }
            resultSet.close();
            preparedStatement1.close();
            connection.commit();
            connection.setAutoCommit(true);
            DataSourceConnection.returnConnection(connection);
            return 1;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public int huyHoaDonUser(String maDonHang, int status) {
        int result = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "UPDATE hoadon SET TrangThai = ?,ngayNhanHang = NOW()  WHERE MAHOADON = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, status);
            preparedStatement.setString(2, maDonHang);
            result = preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;

    }
    public DeleteProduct chekHoaDon(String idProduct) {
        Map<Integer,Integer> map = new HashMap<>();
        List<String> list2 = new ArrayList<>();

        String sql = "SELECT  ct.MaHD,ct.MaSP,h.TrangThai  " +
                "FROM cthoadon ct JOIN hoadon h ON ct.MaHD = h.MAHOADON" +
                " WHERE MaSP = ? AND h.TrangThai != 1 AND h.TrangThai != 4 " +
                "GROUP BY ct.MaHD,ct.MaSP,h.TrangThai";
        try {
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idProduct);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int trangThai = resultSet.getInt("TrangThai");
                String maHoaDon = resultSet.getString("MaHD");
                list2.add(maHoaDon);
                if(map.containsKey(trangThai)){
                    int soLuong = map.get(trangThai);
                    map.put(trangThai,soLuong+1);
                }else{
                    map.put(trangThai,1);
                }
            }


            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return new DeleteProduct(list2,map);
    }
}
