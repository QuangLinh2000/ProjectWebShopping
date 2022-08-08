package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.dto.client.LoaiSPAdmin;
import com.example.projectwebshopping.model.admin.Appreciate;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class AppreciateDao {
    private static AppreciateDao instance;

    public static AppreciateDao getInstance() {
        if (instance == null) {
            instance = new AppreciateDao();
        }
        return instance;
    }

    //pattern singleton
    private AppreciateDao() {
    }
    public boolean deleteAppreciate(String id){
        Connection connection = null;
        int affect=0;

        try {
            connection = DataSourceConnection.getConnection();
            String sql="DELETE FROM NHANXET WHERE NHANXET.IDNhanXet=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,id);
            affect=preparedStatement.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(affect>0)return true;
        else return false;
    }
    public boolean confirmAppreciate(String id){
        Connection connection = null;
        int affect=0;

        try {
            connection = DataSourceConnection.getConnection();
            String sql="UPDATE NHANXET SET NHANXET.STATUS=1 WHERE NHANXET.IDNhanXet=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,id);
            affect=preparedStatement.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(affect>0)return true;
        else return false;
    }
    public boolean addAppreciateNow(String idComment,String idUser, String imgUser, String comment,String job){
        Connection connection = null;
        int affect=0;

        try {
            connection = DataSourceConnection.getConnection();
        String sql="INSERT INTO nhanxet(IDNhanXet,IDUSER,IMGUSER,NHANXET,NGAY,STATUS,JOB) " +
                "VALUE(?,?,?,?,?,?,?)";
            Date date=Date.valueOf(LocalDate.now());
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,idComment);
            preparedStatement.setString(2,idUser);
            preparedStatement.setString(3,imgUser);
            preparedStatement.setString(4,comment);
            preparedStatement.setDate(5,date);
            preparedStatement.setInt(6,0);
            preparedStatement.setString(7,job);
            affect=preparedStatement.executeUpdate();
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
if(affect>0)return true;
else return false;
    }
    public List<Appreciate> getAppreciateAlready(){
        List<Appreciate> dsdanhgia = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT * FROM khachhang inner join nhanxet on nhanxet.IDUSER=khachhang.IDUSER WHERE nhanxet.STATUS=1 ORDER BY nhanxet.NGAY LIMIT 4"
                    ;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Appreciate danhgia=new Appreciate();
                danhgia.addAttibute(resultSet);
                dsdanhgia.add(danhgia);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsdanhgia;
    }
    public List<Appreciate> getAllAppreciate(){
        List<Appreciate> dsdanhgia = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT * FROM khachhang inner join nhanxet on nhanxet.IDUSER=khachhang.IDUSER ORDER BY nhanxet.NGAY"
                    ;
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Appreciate danhgia=new Appreciate();
                danhgia.addAttibute(resultSet);
                dsdanhgia.add(danhgia);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dsdanhgia;
    }
}
