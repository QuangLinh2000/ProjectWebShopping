package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.data.DataString;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.QuangCao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuangCaoAndBoSTDao {
    //pattern Singleton
    private static QuangCaoAndBoSTDao instance;

    public static QuangCaoAndBoSTDao getInstance() {
        if (instance == null) {
            instance = new QuangCaoAndBoSTDao();
        }
        return instance;
    }
    public List<QuangCao> getAllQC(){
        List<QuangCao> quangCaos = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from quangcaoandbosutap where id = ?");
            preparedStatement.setString(1, DataString.ID_QC);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                QuangCao quangCao = new QuangCao();
                quangCao.setId(resultSet.getString("id"));
                quangCao.setUrl(resultSet.getString("url"));
                quangCao.setHinhAnh(resultSet.getString("urlImg"));
                quangCaos.add(quangCao);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quangCaos;
    }

    public List<BoSuaTap> getAllBS(){
        List<BoSuaTap> boSuaTaps = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from quangcaoandbosutap where id = ?");
            preparedStatement.setString(1, DataString.ID_BST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                BoSuaTap boSuaTap = new BoSuaTap();
                boSuaTap.setId(resultSet.getString("id"));
                boSuaTap.setLinnk(resultSet.getString("url"));
                boSuaTap.setHinhAnh(resultSet.getString("urlImg"));
                boSuaTap.setTieuDe(resultSet.getString("tieude"));
                boSuaTap.setMota(resultSet.getString("moTa"));
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
