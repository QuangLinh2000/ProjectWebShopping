package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.model.admin.ThongBao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ThongBaoDao {
    //pattern singleton
    private static ThongBaoDao instance;

    public static ThongBaoDao getInstance() {
        if (instance == null) {
            instance = new ThongBaoDao();
        }
        return instance;
    }

    //pattern singleton
    private ThongBaoDao() {
    }
    public int insertThongBao(ThongBao thongBao) {
        int reuslt = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "INSERT INTO `thongbao`(`IDThongBao`, `Title`, `MoTa`, `Link`, `NgayCapNhat`, `TrangThai`, `LoaiThongBao`, `PhanLoai`,`IdUser`) " +
                    "VALUES (? , ? , ? , ? , ? , ? , ? , ?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, thongBao.getIdThongBao());
            preparedStatement.setString(2, thongBao.getTitle());
            preparedStatement.setString(3, thongBao.getMota());
            preparedStatement.setString(4, thongBao.getLink());
            preparedStatement.setDate(5, thongBao.getNgayCapNhat());
            preparedStatement.setInt(6, thongBao.getTrangThai());
            preparedStatement.setInt(7, thongBao.getLoaiThongBao());
            preparedStatement.setInt(8, thongBao.getPhanLoai());
            preparedStatement.setString(9, thongBao.getIdUser());
            reuslt = preparedStatement.executeUpdate();


            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reuslt;

    }
    public int countNotify(String idUser) {
        int count = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT COUNT(*) soLuong FROM `thongbao` WHERE `IdUser` = ? AND `TrangThai` = 0";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("soLuong");
            }

            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    public List<ThongBao> getThongBao(String idUser,int LoaiThongBao) {
        List<ThongBao> thongBaos = new ArrayList<>();
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "";
            if(LoaiThongBao == -1){
                sql = "SELECT * FROM `thongbao` WHERE `IdUser` = ?  ORDER BY `NgayCapNhat` DESC";
            }else{
                sql = "SELECT * FROM `thongbao` WHERE `IdUser` = ? AND `LoaiThongBao` = ? ORDER BY `NgayCapNhat` DESC";
            }
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idUser);
            if(LoaiThongBao != -1){
                preparedStatement.setInt(2, LoaiThongBao);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ThongBao thongBao = new ThongBao();
                thongBao.getThongBao(resultSet);
                thongBaos.add(thongBao);
            }

            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return thongBaos;
    }


}
