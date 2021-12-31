package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.Product;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDao {
    //pattern singleton
    private static ProductDao instance;

    private ProductDao() {
    }

    public static ProductDao getInstance() {
        if (instance == null) {
            instance = new ProductDao();
        }
        return instance;
    }

    //get all product by category id

    public List<Product> getAllProductByBSTId(String idBoSuaTap) {
        Map<String,Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from products p JOIN hinhanh h ON p.MASP = h.IDSP WHERE IDBoSuuTap = ?");
            preparedStatement.setString(1, idBoSuaTap);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maSP = resultSet.getString("MASP");
                String tenSP = resultSet.getString("TENSP");
                String url = resultSet.getString("URL");
                String idBoSuaTap2 = resultSet.getString("IDBoSuuTap");
                String moTa = resultSet.getString("MOTA");
                Double donGia = resultSet.getDouble("DONGIA");
                Double sell = resultSet.getDouble("SALE");
                String mau = resultSet.getString("MAU");
                String loaiSP = resultSet.getString("LOAISP");
                int trangThai = resultSet.getInt("TRANGTHAI");

                Product product = new Product();
                product.setMaSP(maSP);
                product.setTenSP(tenSP);
                product.setIdBoST(idBoSuaTap2);
                product.setMoTa(moTa);
                product.setGia(donGia);
                product.setSell(sell);
                product.setMau(mau);
                product.setLoaiSP(loaiSP);
                product.setTrangThai(trangThai);
                product.setNayNhap(resultSet.getDate("NgayNhap"));
                if(map.containsKey(maSP)){
                    List<String> listURL = map.get(maSP).getListUrlImg();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP,product);
                }else{
                    List<String> listURL = new ArrayList<>();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP,product);
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
        //convert map to list
        int i = 0;
        for(Map.Entry<String,Product> entry : map.entrySet()){
            products.add(entry.getValue());
            i++;
            if(i >= 10) break;
        }
        return products;
    }


    public List<Product> getSanPhamNoiBat(int loaiSlected) {
        Map<String,Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection =  DataSourceConnection.getConnection();
            PreparedStatement preparedStatement;
            switch (loaiSlected){
                case 0:
                    preparedStatement = connection.prepareStatement("SELECT  * from products p JOIN hinhanh h ON p.MASP = h.IDSP ORDER BY DONGIA DESC");
                    break;
                case 1:
                    preparedStatement = connection.prepareStatement("SELECT  * from products p JOIN hinhanh h ON p.MASP = h.IDSP ORDER BY NGAYNHAP DESC");
                    break;
                case 2:
                    preparedStatement = connection.prepareStatement("SELECT  * from products p JOIN hinhanh h ON p.MASP = h.IDSP\n" +
                            "WHERE SALE > 0 AND CURDATE() BETWEEN NGAYBATDAUSALE AND NGAYKETTHUCSALE  ORDER BY SALE DESC ");
                    break;

                default:
                    throw new IllegalStateException("Unexpected value: " + loaiSlected);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maSP = resultSet.getString("MASP");
                String tenSP = resultSet.getString("TENSP");
                String url = resultSet.getString("URL");
                String idBoSuaTap2 = resultSet.getString("IDBoSuuTap");
                String moTa = resultSet.getString("MOTA");
                Double donGia = resultSet.getDouble("DONGIA");
                Double sell = resultSet.getDouble("SALE");
                String mau = resultSet.getString("MAU");
                String loaiSP = resultSet.getString("LOAISP");
                int trangThai = resultSet.getInt("TRANGTHAI");

                Product product = new Product();
                product.setMaSP(maSP);
                product.setTenSP(tenSP);
                product.setIdBoST(idBoSuaTap2);
                product.setMoTa(moTa);
                product.setGia(donGia);
                product.setSell(sell);
                product.setMau(mau);
                product.setLoaiSP(loaiSP);
                product.setTrangThai(trangThai);
                product.setNayNhap(resultSet.getDate("NgayNhap"));
                if(map.containsKey(maSP)){
                    List<String> listURL = map.get(maSP).getListUrlImg();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP,product);
                }else{
                    List<String> listURL = new ArrayList<>();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP,product);
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
        //convert map to list
        int i = 0;
        for(Map.Entry<String,Product> entry : map.entrySet()){
            products.add(entry.getValue());
            i++;
            if(i >= 8) break;
        }
        return products;
    }
   

//    public static void main(String[] args) {
//
//
//        try {
//            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\demo.txt")));
//            String line;
//            while ((line =bufferedReader.readLine())!=null){
//              System.out.println("/img/product/"+line);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }


}
