package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.data.DataString;
import com.example.projectwebshopping.dto.client.LoaiSPAdmin;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.QuangCao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoaiSPDao {
    //patten: Singleton
    private static LoaiSPDao instance;

    private LoaiSPDao() {
    }

    public static LoaiSPDao getInstance() {
        if (instance == null) {
            instance = new LoaiSPDao();
        }
        return instance;
    }
    public List<LoaiSP> getAllLoaiSP(){
        List<LoaiSP> loaiSPS = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from loaisp");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                LoaiSP loaiSP = new LoaiSP();
                loaiSP.setMaLoai(resultSet.getString("idloai"));
                loaiSP.setTenLoai(resultSet.getString("nameLoai"));
                loaiSP.setListProduct(new ArrayList<>());
                loaiSPS.add(loaiSP);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loaiSPS;
    }
    public List<LoaiSPAdmin> getAllLoaiSPAdmin(){
        List<LoaiSPAdmin> loaiSPAdmins = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT l.IDLOAI,l.NameLoai,l.MOTATHELOAI,COUNT(p.MASP) soLuongSP,COUNT(ct.MaSP) soLuongMua FROM loaisp l " +
                    " LEFT JOIN products p ON p.LOAISP = l.IDLOAI " +
                    " LEFT JOIN  cthoadon ct ON ct.MaSP = p.MASP " +
                    "GROUP BY l.IDLOAI,l.NameLoai,l.MOTATHELOAI ";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                LoaiSPAdmin loaiSPAdmin = new LoaiSPAdmin();
                loaiSPAdmin.addTheLoaiAdmin(resultSet);
                loaiSPAdmins.add(loaiSPAdmin);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loaiSPAdmins;
    }
    //add loaiSP
    public boolean addLoaiSP(String idLoai,String nameLoai,String motaLoai){
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "INSERT INTO loaisp(idloai,nameLoai,MOTATHELOAI) VALUES(?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,idLoai);
            preparedStatement.setString(2,nameLoai);
            preparedStatement.setString(3,motaLoai);
            int result = preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            if (result > 0){
                return true;
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //update loaiSP
    public boolean updateLoaiSP(String idLoai,String nameLoai,String motaLoai){
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "UPDATE loaisp SET nameLoai = ?,MOTATHELOAI = ? WHERE idloai = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,nameLoai);
            preparedStatement.setString(2,motaLoai);
            preparedStatement.setString(3,idLoai);
            int result = preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            if (result > 0){
                return true;
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //lay loai sp
    public LoaiSPAdmin getLoaiSp(String id){
        LoaiSPAdmin loaiSP=new LoaiSPAdmin();
        try {
            Connection connection=DataSourceConnection.getConnection();
            String sql = "SELECT loaisp.NameLoai, loaisp.Mota FROM loaisp WHERE idloai = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                loaiSP.setNameLoai(resultSet.getString("NameLoai"));
                loaiSP.setMota(resultSet.getString("Mota"));
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
return loaiSP;
    }
}
