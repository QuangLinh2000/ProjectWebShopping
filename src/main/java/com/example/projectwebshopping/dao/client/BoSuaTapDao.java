package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.data.DataString;
import com.example.projectwebshopping.model.client.BoSuaTap;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoSuaTapDao {
    //pattern singleton
    private static BoSuaTapDao instance;

    public static BoSuaTapDao getInstance() {
        if (instance == null) {
            instance = new BoSuaTapDao();
        }
        return instance;
    }

    //pattern singleton
    private BoSuaTapDao() {
    }
    public List<BoSuaTap> getBSHome(){
        List<BoSuaTap> boSuaTaps = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from bosutap where `check` = ?");
            preparedStatement.setInt(1, 1);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                BoSuaTap boSuaTap = new BoSuaTap();
                boSuaTap.setId(resultSet.getString("idbst"));
                boSuaTap.setName(resultSet.getString("name"));
                boSuaTap.setTieuDe(resultSet.getString("tieude"));
                boSuaTap.setMota(resultSet.getString("motaBST"));
                boSuaTap.setHinhAnh(resultSet.getString("img"));
                boSuaTaps.add(boSuaTap);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boSuaTaps;
    }
    public List<BoSuaTap> getALLBST(){
        List<BoSuaTap> boSuaTaps = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from bosutap");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                BoSuaTap boSuaTap = new BoSuaTap();
                boSuaTap.setId(resultSet.getString("idbst"));
                boSuaTap.setName(resultSet.getString("name"));
                boSuaTap.setTieuDe(resultSet.getString("tieude"));
                boSuaTap.setMota(resultSet.getString("motaBST"));
                boSuaTap.setHinhAnh(resultSet.getString("img"));
                boSuaTaps.add(boSuaTap);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return boSuaTaps;
    }



}
