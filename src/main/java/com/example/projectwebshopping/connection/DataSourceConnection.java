package com.example.projectwebshopping.connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.sql.Connection;
import java.util.Queue;

public class DataSourceConnection {
    //create instance of the class

    private static JdbcConnectionPool pool = new JdbcConnectionPool();


    public static   Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection connection = pool.getConnectionFromPool();

        return connection;
    }

    public static  void returnConnection(Connection connection) {
        pool.returnConnectionToPool(connection);

    }


}
