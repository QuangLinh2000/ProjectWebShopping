package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.data.DataString;
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
                loaiSP.setMoTa(resultSet.getString("Mota"));
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
}
