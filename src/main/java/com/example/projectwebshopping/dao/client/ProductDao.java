package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.dto.client.DetailProduct;
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

    public List<Product> getAllProductByBSTId(String idBoSuaTap, int limit) {
        Map<String, Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT * FROM hinhanh AS h " +
                            "INNER JOIN  (SELECT * FROM products " +
                            "WHERE IDBoSuuTap = ? AND TRANGTHAI = ?  LIMIT ? ) " +
                            "as p ON h.IDSP = p.MASP ");
            preparedStatement.setString(1, idBoSuaTap);
            preparedStatement.setInt(2, 1);
            preparedStatement.setInt(3, limit);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String maSP = resultSet.getString("MASP");
                String url = resultSet.getString("URL");
                Product product = new Product();
                product.addProduct(resultSet);
                if (map.containsKey(maSP)) {
                    List<String> listURL = map.get(maSP).getListUrlImg();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
                } else {
                    List<String> listURL = new ArrayList<>();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
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
        for (Map.Entry<String, Product> entry : map.entrySet()) {
            products.add(entry.getValue());
        }
        return products;
    }
    /*
     * 0 sản phẩm nổi bật
     * 1 sản phẩm mới
     * 2 sản phẩm khuyến mãi
     * 3 sản phẩm bán chạy
     * */


    public List<Product> getSanPhamNoiBat(int loaiSlected, int limit) {
        Map<String, Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement;
            switch (loaiSlected) {
                case 0:
                    preparedStatement = connection.prepareStatement(" SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products where  TRANGTHAI = ? ORDER BY DONGIA DESC LIMIT ?) as p ON h.IDSP = p.MASP ORDER BY DONGIA DESC");
                    break;
                case 1:
                    preparedStatement = connection.prepareStatement(" SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products where  TRANGTHAI = ? ORDER BY NGAYNHAP DESC LIMIT ?) as p ON h.IDSP = p.MASP ORDER BY NGAYNHAP DESC");
                    break;
                case 2:
                    preparedStatement = connection.prepareStatement("  SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products WHERE  TRANGTHAI = ? AND SALE > 0 AND CURDATE() BETWEEN NGAYBATDAUSALE AND NGAYKETTHUCSALE" +
                            "  ORDER BY SALE DESC  LIMIT ?) as p ON h.IDSP = p.MASP ORDER BY SALE DESC");
                    break;
                case 3:
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products where  TRANGTHAI = ? ORDER BY NGAYNHAP DESC LIMIT ?) as p ON h.IDSP = p.MASP ORDER BY NGAYNHAP DESC");
                    break;

                default:
                    throw new IllegalStateException("Unexpected value: " + loaiSlected);
            }
            preparedStatement.setInt(1, 1);
            preparedStatement.setInt(2, limit);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String maSP = resultSet.getString("MASP");
                String url = resultSet.getString("URL");
                Product product = new Product();
                product.addProduct(resultSet);
                if (map.containsKey(maSP)) {
                    List<String> listURL = map.get(maSP).getListUrlImg();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
                } else {
                    List<String> listURL = new ArrayList<>();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
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
        for (Map.Entry<String, Product> entry : map.entrySet()) {
            products.add(entry.getValue());

        }
        return products;
    }
    public List<Product> getSanPhamNoiBat(int loaiSlected, int limit,int start) {
        Map<String, Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement;
            switch (loaiSlected) {
                case 0:
                    preparedStatement = connection.prepareStatement(" SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products where  TRANGTHAI = ? ORDER BY DONGIA DESC LIMIT ?,?) as p ON h.IDSP = p.MASP ORDER BY DONGIA DESC");
                    break;
                case 1:
                    preparedStatement = connection.prepareStatement(" SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products where  TRANGTHAI = ? ORDER BY NGAYNHAP DESC LIMIT ?,?) as p ON h.IDSP = p.MASP ORDER BY NGAYNHAP DESC");
                    break;
                case 2:
                    preparedStatement = connection.prepareStatement("  SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products WHERE  TRANGTHAI = ? AND SALE > 0 AND CURDATE() BETWEEN NGAYBATDAUSALE AND NGAYKETTHUCSALE" +
                            "  ORDER BY SALE DESC  LIMIT ?,?) as p ON h.IDSP = p.MASP ORDER BY SALE DESC");
                    break;
                case 3:
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products where  TRANGTHAI = ? ORDER BY NGAYNHAP DESC LIMIT ?,?) as p ON h.IDSP = p.MASP ORDER BY NGAYNHAP DESC");
                    break;

                default:
                    throw new IllegalStateException("Unexpected value: " + loaiSlected);
            }
            preparedStatement.setInt(1, 1);
            preparedStatement.setInt(2, start);
            preparedStatement.setInt(3, limit);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String maSP = resultSet.getString("MASP");
                String url = resultSet.getString("URL");
                Product product = new Product();
                product.addProduct(resultSet);
                if (map.containsKey(maSP)) {
                    List<String> listURL = map.get(maSP).getListUrlImg();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
                } else {
                    List<String> listURL = new ArrayList<>();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
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
        for (Map.Entry<String, Product> entry : map.entrySet()) {
            products.add(entry.getValue());

        }
        return products;
    }

    /*

     * ---loaiSlected--
     * 0 sản phẩm nổi bật giá tiền đắt nhất
     * 1 sản phẩm mới ngày nhập mới nhất
     * 2 best seller bán nhiều nhất
     * 3 giảm giá
     * */
    public List<Product> getSanPhamHeader(String idLoai, int limit, int loaiSlected) {
        Map<String, Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        try {
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement;
            switch (loaiSlected) {
                case 0:
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products WHERE LOAISP = ? AND TRANGTHAI = ?  ORDER BY DONGIA DESC  LIMIT ? ) as p ON h.IDSP = p.MASP ");
                    break;
                case 1:
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products WHERE LOAISP = ? AND TRANGTHAI = ?  ORDER BY NGAYNHAP DESC  LIMIT ? ) as p ON h.IDSP = p.MASP ");
                    break;
                case 2:
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products WHERE LOAISP = ? AND TRANGTHAI = ?  ORDER BY DONGIA DESC  LIMIT ? ) as p ON h.IDSP = p.MASP ");
                    break;

                case 3:
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products WHERE LOAISP = ? AND TRANGTHAI = ?  AND SALE > 0 AND CURDATE() BETWEEN NGAYBATDAUSALE AND NGAYKETTHUCSALE " +
                            "ORDER BY SALE DESC  LIMIT ?) as p ON h.IDSP = p.MASP ORDER BY SALE DESC");
                    break;
                default:
                    throw new IllegalArgumentException("Invalid loaiSlected");
            }


            preparedStatement.setString(1, idLoai);
            preparedStatement.setInt(2, 1);
            preparedStatement.setInt(3, limit);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String maSP = resultSet.getString("MASP");
                String url = resultSet.getString("URL");
                Product product = new Product();
                product.addProduct(resultSet);

                if (map.containsKey(maSP)) {
                    List<String> listURL = map.get(maSP).getListUrlImg();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
                } else {
                    List<String> listURL = new ArrayList<>();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
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
        for (Map.Entry<String, Product> entry : map.entrySet()) {
            products.add(entry.getValue());
        }
        return products;
    }


    /*

     * ---loaiSlected--
     * 0 sản phẩm nổi bật giá tiền đắt nhất
     * 1 sản phẩm mới ngày nhập mới nhất
     * 2 best seller bán nhiều nhất
     * 3 giảm giá

     * */

    public List<Product> getProducts(String idLoai, int loaiSlected) {
        Map<String, Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        String sqlStart = "SELECT * FROM hinhanh AS h INNER JOIN  (SELECT * FROM products ";
        String sqlWhere = " WHERE LOAISP = ? AND TRANGTHAI = ?  ";
        String sqlOrderBy = "";
        String sqlEnd = "  ) as p ON h.IDSP = p.MASP";

        switch (loaiSlected) {
            case 0: sqlOrderBy += " ORDER BY DONGIA DESC ";
                break;
            case 1: sqlOrderBy += " ORDER BY NGAYNHAP DESC";
                break;
            case 2: sqlOrderBy += " ORDER BY DONGIA DESC";
                break;

            case 3: sqlOrderBy += " ORDER BY SALE DESC";
                sqlWhere += " AND SALE > 0 AND CURDATE() BETWEEN NGAYBATDAUSALE AND NGAYKETTHUCSALE ";
                break;
            case 4: sqlOrderBy += "";
                break;
            default:
                throw new IllegalArgumentException("Invalid loaiSlected");

        }

        try {
            Connection connection = DataSourceConnection.getConnection();

            String sql = sqlStart + sqlWhere + sqlOrderBy + sqlEnd;


            PreparedStatement preparedStatement = connection.prepareStatement(sql);



            preparedStatement.setString(1, idLoai);
            preparedStatement.setInt(2, 1);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String maSP = resultSet.getString("MASP");
                String url = resultSet.getString("URL");
                Product product = new Product();
                product.addProduct(resultSet);
                if (map.containsKey(maSP)) {
                    List<String> listURL = map.get(maSP).getListUrlImg();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
                } else {
                    List<String> listURL = new ArrayList<>();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(maSP, product);
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
        for (Map.Entry<String, Product> entry : map.entrySet()) {
            products.add(entry.getValue());
        }
        return products;
    }

    public DetailProduct getProduct(String id) {
        Product product = new Product();
        DetailProduct detailProduct = new DetailProduct();
        BoSuaTap boSuaTap = new BoSuaTap();

        Map<String,Product> map = new HashMap<>();
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT * FROM products p JOIN hinhanh  h ON p.MASP = h.IDSP JOIN bosutap b ON b.IdBST = p.IDBoSuuTap WHERE MASP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String url = resultSet.getString("URL");
                product.addProduct(resultSet);
                if (map.containsKey(id)) {
                    List<String> listURL = map.get(id).getListUrlImg();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(id, product);
                } else {
                    List<String> listURL = new ArrayList<>();
                    listURL.add(url);
                    product.setListUrlImg(listURL);
                    map.put(id, product);
                }
                boSuaTap.addBoST(resultSet);
            }
            detailProduct.setProduct(map.get(id));
            detailProduct.setBoSuaTap(boSuaTap);
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detailProduct;
    }



//    public static void main(String[] args) {
////        List<String> list = new ArrayList<>();
////
////        try {
////            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\t.txt")));
////            String line;
////            while ((line =bufferedReader.readLine())!=null){
////                list.add(line);
////            }
////        } catch (Exception e) {
////            e.printStackTrace();
////        }
//        Map<String,String> map = new HashMap<>();
//        try {
//            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream("D:\\demo.txt")));
//            String line;
//            while ((line =bufferedReader.readLine())!=null){
//              if(map.containsKey(line)){
//                  System.out.println(line);
//              }
//              map.put(line,line);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }


}
