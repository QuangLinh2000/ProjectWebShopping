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

public class QuangCaoDao {
    //pattern Singleton
    private static QuangCaoDao instance;

    public static QuangCaoDao getInstance() {
        if (instance == null) {
            instance = new QuangCaoDao();
        }
        return instance;
    }
    public List<QuangCao> getAllQC(){
        List<QuangCao> quangCaos = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from quangcao");
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



}
