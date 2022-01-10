package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.dto.client.CartProduct;
import com.example.projectwebshopping.model.client.Cart;
import com.example.projectwebshopping.model.client.CartJson;
import com.example.projectwebshopping.model.client.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CartDao {
    //pattern singleton
    private static CartDao instance;

    public static CartDao getInstance() {
        if (instance == null) {
            instance = new CartDao();
        }
        return instance;
    }

    private CartDao() {
    }

    public void addGioHang(String idUser,String idSanPham,int soLuong,String size) {
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT * FROM giohang WHERE IDUSER = ? AND IDSP = ? AND SIZE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1,idUser);
            preparedStatement.setString(2,idSanPham);
            preparedStatement.setString(3,size);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                int soLuongCurent = resultSet.getInt("SOLUONG");

                resultSet.updateInt("SOLUONG",soLuongCurent+soLuong);
                resultSet.updateRow();

            }else{
                String sql2 = "INSERT INTO giohang(IDUSER,IDSP,SOLUONG,SIZE) VALUES(?,?,?,?)";
                preparedStatement = connection.prepareStatement(sql2,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                preparedStatement.setString(1,idUser);
                preparedStatement.setString(2,idSanPham);
                preparedStatement.setInt(3,soLuong);
                preparedStatement.setString(4,size);
                preparedStatement.executeUpdate();

            }

            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public int getSizeCart(String idUser) {
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT SUM(SOLuong) SL FROM giohang WHERE IDUSER = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            int soLuong = 0;
            if(resultSet.next()){
                 soLuong = resultSet.getInt("SL");



            }

            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return soLuong;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<CartProduct> getCarts(String idUser) {
        List<CartProduct> cartProducts = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String sql = "SELECT p.MASP,p.TENSP,p.DONGIA,p.SALE,p.MAU,g.SOLUONG,h.URL,p.S,p.L,p.M,p.XL,p.TRANGTHAI,g.SIZE " +
                    " FROM giohang g JOIN products p ON g.IDSP = p.MASP JOIN hinhanh h ON h.IDSP = p.MASP " +
                    "WHERE IDUSER = ?"+
                    " GROUP BY  p.MASP,p.TENSP,p.DONGIA,p.SALE,p.MAU,p.S,p.L,p.M,p.XL,p.TRANGTHAI,g.SIZE";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,idUser);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
              CartProduct cartProduct = new CartProduct();
              cartProduct.addCartProduct(resultSet);
              cartProducts.add(cartProduct);



            }

            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartProducts;
    }

    //get cart by session
    public List<CartProduct> getCartsBySession(Map<String, Cart> session) {
        List<CartProduct> cartProducts = new ArrayList<>();
        List<CartProduct> resultList = new ArrayList<>();

        List<Cart> carts = new ArrayList<>();
        for (Map.Entry<String, Cart> entry : session.entrySet()) {
            carts.add(entry.getValue());
        }
        try {
            Connection connection =  DataSourceConnection.getConnection();
            String where = "";
            for (int i = 0; i < carts.size(); i++) {
                if(i == 0){
                    where += " WHERE MASP = ?";
                }else{
                    where += " OR MASP = ?";
                }
            }

            String sql = "SELECT p.MASP,p.TENSP,p.DONGIA,p.SALE,p.MAU,h.URL,p.S,p.L,p.M,p.XL,p.TRANGTHAI\n" +
                    " from products p JOIN hinhanh h ON h.IDSP = p.MASP  " + where+
                    " GROUP BY   p.MASP,p.TENSP,p.DONGIA,p.SALE,p.MAU,p.S,p.L,p.M,p.XL,p.TRANGTHAI";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < carts.size(); i++) {
                Cart cart = carts.get(i);
                preparedStatement.setString(i+1,cart.getIdProduct());
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                CartProduct cartProduct = new CartProduct();
                cartProduct.addCartProductSesstion(resultSet);
                cartProducts.add(cartProduct);

            }

            for ( Cart cart : carts) {
                String idProduct = cart.getIdProduct();
                for ( CartProduct c : cartProducts) {
                    if(c.getId().equals(idProduct)){
                        String id = c.getId();
                         String name = c.getName();
                         double price = c.getPrice();
                         double sale = c.getSale();
                         String mau = c.getMau();
                         int soLuong= cart.getQuantity();
                         String image= c.getImage();
                         int S= c.getS();
                         int M= c.getM();
                         int L= c.getL();
                         int XL= c.getXL();
                         int trangThai= c.getTrangThai();
                         String size = cart.getSize();

                        CartProduct cartProduct = new CartProduct(id,name,price,sale,mau,soLuong,image,S,M,L,XL,trangThai,size);

                        resultList.add(cartProduct);
                        break;
                    }

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
        return resultList;
    }
    public int deleteCart(String idUser,String idProduct,String size){
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sqlRemove = "DELETE FROM giohang WHERE IDUser = ? AND IDSP = ? AND SIZE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlRemove);
            preparedStatement.setString(1,idUser);
            preparedStatement.setString(2,idProduct);
            preparedStatement.setString(3,size);
            int result = preparedStatement.executeUpdate();

            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return result;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
