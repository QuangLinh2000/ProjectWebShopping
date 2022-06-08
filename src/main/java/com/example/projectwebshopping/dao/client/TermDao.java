package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TermDao {
    //pattern Singleton
    private static TermDao instance;

    public static TermDao getInstance() {
        if (instance == null) {
            instance = new TermDao();
        }
        return instance;
    }

    private TermDao() {
    }
    public boolean setTerm(String index,String content){
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "UPDATE term SET term.content=? WHERE term.id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
           preparedStatement.setString(1,content);
            preparedStatement.setString(2,("DK"+index));
            int result=preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            if(result>0) return true;
            else return true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }
    public String getTerm(String index){

        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT term.content  FROM term where term.id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,("DK"+index));
            ResultSet resultSet = preparedStatement.executeQuery();
            String content="";
            while (resultSet.next()) content=resultSet.getString("content");
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return content;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "";
    }
}
