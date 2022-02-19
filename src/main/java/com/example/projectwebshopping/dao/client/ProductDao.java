package com.example.projectwebshopping.dao.client;

import com.example.projectwebshopping.connection.DataSourceConnection;
import com.example.projectwebshopping.dto.client.DetailProduct;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.CartJson;
import com.example.projectwebshopping.model.client.KhachHang;
import com.example.projectwebshopping.model.client.Product;

import java.io.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;

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
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN (SELECT p.MASP,p.TENSP,p.IDBoSuuTap,p.MOTA,p.DONGIA,p.SALE,p.MAU,p.NGAYNHAP,p.NGAYBATDAUSALE,p.NGAYKETTHUCSALE," +
                            "p.LOAISP,p.TRANGTHAI,p.S,p.L,p.M,p.XL,SUM(ct.SOLUONG) soLuong" +
                            " FROM products p JOIN cthoadon ct ON p.MASP = ct.MaSP" +
                            " WHERE p.TRANGTHAI = ?" +
                            " GROUP BY p.MASP,p.TENSP,p.IDBoSuuTap,p.MOTA,p.DONGIA,p.SALE,p.MAU,p.NGAYNHAP,p.NGAYBATDAUSALE,p.NGAYKETTHUCSALE," +
                            "p.LOAISP,p.TRANGTHAI,p.S,p.L,p.M,p.XL ORDER BY SOLUONG DESC LIMIT ?) as p ON h.IDSP = p.MASP ");
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

    public List<Product> getSanPhamNoiBat(int loaiSlected, int limit, int start) {
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
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN (SELECT p.MASP,p.TENSP,p.IDBoSuuTap,p.MOTA,p.DONGIA,p.SALE,p.MAU,p.NGAYNHAP,p.NGAYBATDAUSALE,p.NGAYKETTHUCSALE," +
                            "p.LOAISP,p.TRANGTHAI,p.S,p.L,p.M,p.XL,SUM(ct.SOLUONG) soLuong" +
                            " FROM products p JOIN cthoadon ct ON p.MASP = ct.MaSP" +
                            " WHERE p.TRANGTHAI = ?" +
                            " GROUP BY p.MASP,p.TENSP,p.IDBoSuuTap,p.MOTA,p.DONGIA,p.SALE,p.MAU,p.NGAYNHAP,p.NGAYBATDAUSALE,p.NGAYKETTHUCSALE," +
                            "p.LOAISP,p.TRANGTHAI,p.S,p.L,p.M,p.XL ORDER BY SOLUONG DESC LIMIT ?,?) as p ON h.IDSP = p.MASP ");
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
                    preparedStatement = connection.prepareStatement("SELECT * FROM hinhanh AS h INNER JOIN (SELECT p.MASP,p.TENSP,p.IDBoSuuTap,p.MOTA,p.DONGIA,p.SALE,p.MAU,p.NGAYNHAP,p.NGAYBATDAUSALE,p.NGAYKETTHUCSALE," +
                            "p.LOAISP,p.TRANGTHAI,p.S,p.L,p.M,p.XL,SUM(ct.SOLUONG) soLuong" +
                            " FROM products p JOIN cthoadon ct ON p.MASP = ct.MaSP" +
                            " WHERE  p.LOAISP = ? AND p.TRANGTHAI = ?" +
                            " GROUP BY p.MASP,p.TENSP,p.IDBoSuuTap,p.MOTA,p.DONGIA,p.SALE,p.MAU,p.NGAYNHAP,p.NGAYBATDAUSALE,p.NGAYKETTHUCSALE," +
                            "p.LOAISP,p.TRANGTHAI,p.S,p.L,p.M,p.XL ORDER BY SOLUONG DESC LIMIT ?) as p ON h.IDSP = p.MASP ");
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
        String sqlStart = "SELECT * FROM hinhanh AS h INNER JOIN  ( SELECT * FROM products";
        String sqlWhere = " WHERE LOAISP = ? AND TRANGTHAI = ?  ";
        String sqlOrderBy = "";
        String sqlEnd = "  ) as p ON h.IDSP = p.MASP";

        switch (loaiSlected) {
            case 0:
                sqlOrderBy += " ORDER BY DONGIA DESC ";
                break;
            case 1:
                sqlOrderBy += " ORDER BY NGAYNHAP DESC";
                break;
            case 2:
                sqlOrderBy += " SELECT * FROM hinhanh AS h INNER JOIN (SELECT p.MASP,p.TENSP,p.IDBoSuuTap,p.MOTA,p.DONGIA,p.SALE,p.MAU,p.NGAYNHAP,p.NGAYBATDAUSALE,p.NGAYKETTHUCSALE," +
                        "p.LOAISP,p.TRANGTHAI,p.S,p.L,p.M,p.XL,SUM(ct.SOLUONG) soLuong" +
                        " FROM products p JOIN cthoadon ct ON p.MASP = ct.MaSP" +
                        " WHERE  LOAISP = ? AND TRANGTHAI = ? " +
                        " GROUP BY p.MASP,p.TENSP,p.IDBoSuuTap,p.MOTA,p.DONGIA,p.SALE,p.MAU,p.NGAYNHAP,p.NGAYBATDAUSALE,p.NGAYKETTHUCSALE," +
                        "p.LOAISP,p.TRANGTHAI,p.S,p.L,p.M,p.XL ORDER BY SOLUONG DESC LIMIT 8) as p ON h.IDSP = p.MASP";
                break;

            case 3:
                sqlOrderBy += " ORDER BY SALE DESC";
                sqlWhere += " AND SALE > 0 AND CURDATE() BETWEEN NGAYBATDAUSALE AND NGAYKETTHUCSALE ";
                break;
            case 4:
                sqlOrderBy += "";
                break;
            default:
                throw new IllegalArgumentException("Invalid loaiSlected");

        }

        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = sqlStart + sqlWhere + sqlOrderBy + sqlEnd;

            if (loaiSlected == 2) {
                sql = sqlOrderBy;
            }


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

        Map<String, Product> map = new HashMap<>();
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

    public int getSizeProduct(String id, String sizeName) {
        int size = 0;

        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT * FROM products WHERE MASP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                size = resultSet.getInt(sizeName);
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return size;
    }

    public int getSizeProduct(String id, String sizeName, String idUser, int quantity) {
        int size = 0;

        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT * FROM products WHERE MASP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            String sql2 = "UPDATE  giohang SET SOLUONG = ? WHERE IDUser = ? AND IDSP = ? AND SIZE = ?";
            if (resultSet.next()) {
                size = resultSet.getInt(sizeName);
                if (size >= quantity) {
                    PreparedStatement preparedStatement2 = connection.prepareStatement(sql2);
                    preparedStatement2.setInt(1, quantity);
                    preparedStatement2.setString(2, idUser);
                    preparedStatement2.setString(3, id);
                    preparedStatement2.setString(4, sizeName);
                    preparedStatement2.executeUpdate();
                    preparedStatement2.close();
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
        return size;
    }

    // update product and countdown size current
    public int getSizeProduct(String id, String sizeName, String idUser, int quantity, String sizeCurrent) {
        int size = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT * FROM products WHERE MASP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            String sqlRemove = "DELETE FROM giohang WHERE IDUser = ? AND IDSP = ? AND SIZE = ?";
            String sqlGioHang = "select * from giohang where IDUser = ? and IDSP = ? and SIZE = ?";
            if (resultSet.next()) {
                // size moi trong cua hang con bao nhieu
                size = resultSet.getInt(sizeName);

                PreparedStatement preparedStatement2 = connection.prepareStatement(sqlGioHang, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                preparedStatement2.setString(1, idUser);
                preparedStatement2.setString(2, id);
                preparedStatement2.setString(3, sizeName);
                ResultSet resultSet2 = preparedStatement2.executeQuery();
                if (resultSet2.next()) {
                    int soluong = resultSet2.getInt("SOLUONG");
                    if (size >= (soluong + quantity)) {
                        resultSet2.updateInt("SOLUONG", soluong + quantity);
                        resultSet2.updateRow();
                    }


                } else {
                    String sql2 = "INSERT INTO giohang(IDUser,IDSP,SIZE,SOLUONG) VALUES(?,?,?,?)";
                    PreparedStatement preparedStatement3 = connection.prepareStatement(sql2);
                    preparedStatement3.setString(1, idUser);
                    preparedStatement3.setString(2, id);
                    preparedStatement3.setString(3, sizeName);
                    preparedStatement3.setInt(4, quantity);
                    preparedStatement3.executeUpdate();
                    preparedStatement3.close();
                }
                PreparedStatement preparedStatementRemove = connection.prepareStatement(sqlRemove);
                preparedStatementRemove.setString(1, idUser);
                preparedStatementRemove.setString(2, id);
                preparedStatementRemove.setString(3, sizeCurrent);
                preparedStatementRemove.executeUpdate();
                preparedStatementRemove.close();

                resultSet2.close();

                preparedStatement2.close();

            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return size;
    }

    public String checkOut(String idUser, List<CartJson> cartJsonList,String idHoaDon) {
        List<CartJson> cartJsonList1 = new ArrayList<>();
        int sumMoney = 0;
        for (CartJson cartJson : cartJsonList) {
            sumMoney += cartJson.getPrice() * cartJson.getQuantity();
        }
        cartJsonList1.addAll(cartJsonList);
        try {
            Connection connection = DataSourceConnection.getConnection();
            connection.setAutoCommit(false);
            String where = "";
            for (int i = 0; i < cartJsonList.size(); i++) {
                if (i == 0) {
                    where = " where MASP = ?";
                } else {
                    where = where + " or MASP = ?";
                }
            }
            String sql = "SELECT * FROM products " + where;
            PreparedStatement preparedStatement = connection.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            for (int i = 0; i < cartJsonList.size(); i++) {
                preparedStatement.setString(i + 1, cartJsonList.get(i).getId());
            }

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("MASP");
                String name = resultSet.getString("TENSP");
                for (int i = 0; i < cartJsonList.size(); i++) {

                    if (cartJsonList.get(i).getId().equals(id)) {
                        //số lượng muốn mua
                        int quantity = cartJsonList.get(i).getQuantity();
                        String size = cartJsonList.get(i).getSize();
                        //số lượng của size có trong cửa hàng
                        int soluong = resultSet.getInt(size);

                        if (soluong >= quantity) {
                            resultSet.updateInt(size, soluong - quantity);
                            resultSet.updateRow();
                            cartJsonList.remove(i);
                            i--;
                        } else {
                            connection.rollback();
                            connection.setAutoCommit(true);
                            DataSourceConnection.returnConnection(connection);

                            return "Sản phẩm " + name + " không đủ số lượng";
                        }

                    }

                }

            }
            resultSet.close();
            preparedStatement.close();

            if (cartJsonList.size() == 0) {
                int delete = deleteCart(idUser, cartJsonList1, connection);
                int ínert = insertHoaDon(idUser, connection, idHoaDon, sumMoney);
                int ctInsert = insertCTHoaDon(idHoaDon, cartJsonList1, connection);
                if (delete >= 1
                        && ínert >= 1
                        && ctInsert >= 1) {
                    connection.commit();
                } else {
                    connection.rollback();
                    connection.setAutoCommit(true);

                    DataSourceConnection.returnConnection(connection);
                    return "Đặt hàng thất bại 1";
                }
            } else {
                connection.rollback();
                connection.setAutoCommit(true);

                DataSourceConnection.returnConnection(connection);
                return "Đặt hàng thất bại 2";
            }
            connection.setAutoCommit(true);

            DataSourceConnection.returnConnection(connection);
            return "success";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "success";
    }

    public int deleteCart(String idUser, List<CartJson> cartJsonList, Connection connection) {
        try {
            String sql = "DELETE FROM giohang WHERE IDUSER = ? AND IDSP = ? AND SIZE = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < cartJsonList.size(); i++) {
                preparedStatement.setString(1, idUser);
                preparedStatement.setString(2, cartJsonList.get(i).getId());
                preparedStatement.setString(3, cartJsonList.get(i).getSize());
                preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int insertHoaDon(String idUser, Connection connection, String idHoaDon, double tongTien) {
        try {
            String sql = "INSERT INTO hoadon(MAHOADON,IDUSER,NgayDatHang,TrangThai,tongTien) VALUES(?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idHoaDon);
            preparedStatement.setString(2, idUser);
            preparedStatement.setDate(3, new Date(System.currentTimeMillis()));
            preparedStatement.setInt(4, 0);
            preparedStatement.setDouble(5, tongTien);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int insertCTHoaDon(String idHoaDon, List<CartJson> cartJsonList, Connection connection) {
        try {
            String sql = "INSERT INTO cthoadon(MaHD,PRICE,SoLuong,MaSP,SIZE) VALUES(?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < cartJsonList.size(); i++) {
                preparedStatement.setString(1, idHoaDon);
                preparedStatement.setDouble(2, cartJsonList.get(i).getPrice());
                preparedStatement.setInt(3, cartJsonList.get(i).getQuantity());
                preparedStatement.setString(4, cartJsonList.get(i).getId());
                preparedStatement.setString(5, cartJsonList.get(i).getSize());
                preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    //get page product
    public List<Product> getProductsAdmin(String idLoai, Date ngayNhap, int status, int start, int limit) {
        Map<String, Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        String where = "";
        String sqlStart = "SELECT * FROM hinhanh AS h INNER JOIN (  SELECT * FROM products ps " +
                "JOIN loaisp l ON l.IDLOAI = ps.LOAISP WHERE 1 = 1";
        String sqlEnd = " LIMIT ?,?) as p ON h.IDSP = p.MASP";
        if (idLoai != null) {
            where += " AND ps.LOAISP = ? ";
        }
        if (ngayNhap != null) {
            where += " AND ps.NGAYNHAP = ? ";
        }
        if (status != -1) {
            where += " AND ps.TRANGTHAI = ? ";
        }
        try {
            String sql = sqlStart + where + sqlEnd;
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            int i = 1;
            if (idLoai != null) {
                preparedStatement.setString(i, idLoai);
                i++;

            }
            if (ngayNhap != null) {
                preparedStatement.setDate(i, ngayNhap);
                i++;
            }
            if (status != -1) {
                preparedStatement.setInt(i, status);
                i++;
            }
            preparedStatement.setInt(i, start);
            preparedStatement.setInt(i + 1, limit);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String maSP = resultSet.getString("MASP");
                String url = resultSet.getString("URL");
                String nameLoai = resultSet.getString("NAMELOAI");
                Product product = new Product();
                product.setNamLoaiSP(nameLoai);
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

    public int getCountProductAdmin(String idLoai, Date ngayNhap, int status) {
        int count = 0;
        String where = "";
        String sqlStart = "SELECT COUNT(*) tong FROM products WHERE 1 = 1";
        if (idLoai != null) {
            where += " AND LOAISP = ? ";
        }
        if (ngayNhap != null) {
            where += " AND NGAYNHAP = ? ";
        }
        if (status != -1) {
            where += " AND TRANGTHAI = ? ";
        }
        try {
            String sql = sqlStart + where;
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            int i = 1;
            if (idLoai != null) {
                preparedStatement.setString(i, idLoai);
                i++;

            }
            if (ngayNhap != null) {
                preparedStatement.setDate(i, ngayNhap);
                i++;
            }
            if (status != -1) {
                preparedStatement.setInt(i, status);
            }

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("tong");

            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    //INSERT INTO `products`(`MASP`, `TENSP`, `IDBoSuuTap`, `MOTA`, `DONGIA`, `SALE`, `MAU`, `NGAYNHAP`, `NGAYBATDAUSALE`, `NGAYKETTHUCSALE`, `LOAISP`, `TRANGTHAI`, `S`, `L`, `M`, `XL`) VALUES ()
    //insert product
    public boolean insertProduct(Product product) {
        boolean result = false;
        String sql = "INSERT INTO `products`(`MASP`, `TENSP`," +
                " `IDBoSuuTap`, `MOTA`, `DONGIA`, `SALE`, `MAU`, `NGAYNHAP`," +
                " `NGAYBATDAUSALE`, `NGAYKETTHUCSALE`, `LOAISP`, `TRANGTHAI`, " +
                "`S`, `L`, `M`, `XL`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            Connection connection = DataSourceConnection.getConnection();
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product.getMaSP());
            preparedStatement.setString(2, product.getTenSP());
            preparedStatement.setString(3, product.getIdBoST());
            preparedStatement.setString(4, product.getMoTa());
            preparedStatement.setDouble(5, product.getGia());
            preparedStatement.setDouble(6, product.getSell());
            preparedStatement.setString(7, product.getMau());
            preparedStatement.setDate(8, product.getNayNhap());
            preparedStatement.setDate(9, product.getNgayBatDausell());
            preparedStatement.setDate(10, product.getNgayHetHansell());
            preparedStatement.setString(11, product.getLoaiSP());
            preparedStatement.setInt(12, product.getTrangThai());
            preparedStatement.setInt(13, product.getS());
            preparedStatement.setInt(14, product.getL());
            preparedStatement.setInt(15, product.getM());
            preparedStatement.setInt(16, product.getXL());
            int i = preparedStatement.executeUpdate();

            //INSERT INTO `hinhanh`(`IDSP`, `URL`) VALUES ([value-1],[value-2])
            String sqlStart = "INSERT INTO `hinhanh`(`IDSP`, `URL`) VALUES";
            String values = "";
            for (String url : product.getListUrlImg()) {
                values += "(?,?),";

            }
            String sql2 = sqlStart + values.substring(0, values.length() - 1);

            PreparedStatement preparedStatement2 = connection.prepareStatement(sql2);
            int j = 1;
            for (String url : product.getListUrlImg()) {
                preparedStatement2.setString(j, product.getMaSP());
                preparedStatement2.setString(j + 1, url);
                j += 2;

            }
            int k = preparedStatement2.executeUpdate();
            if (i > 0 && k > 0) {
                connection.commit();
                connection.setAutoCommit(true);
                result = true;

            }
            preparedStatement2.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    //update product
    public boolean updateProduct(Product product) {
        boolean result = false;
        String sql = "UPDATE `products` SET `TENSP`=?,`IDBoSuuTap`=?,`MOTA`=?,`DONGIA`=?,`SALE`=?,`MAU`=?,`NGAYNHAP`=?," +
                "`NGAYBATDAUSALE`=?,`NGAYKETTHUCSALE`=?,`LOAISP`=?,`TRANGTHAI`=?,`S`=?,`L`=?,`M`=?,`XL`=? WHERE `MASP`=?";
        try {
            Connection connection = DataSourceConnection.getConnection();
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product.getTenSP());
            preparedStatement.setString(2, product.getIdBoST());
            preparedStatement.setString(3, product.getMoTa());
            preparedStatement.setDouble(4, product.getGia());
            preparedStatement.setDouble(5, product.getSell());
            preparedStatement.setString(6, product.getMau());
            preparedStatement.setDate(7, product.getNayNhap());
            preparedStatement.setDate(8, product.getNgayBatDausell());
            preparedStatement.setDate(9, product.getNgayHetHansell());
            preparedStatement.setString(10, product.getLoaiSP());
            preparedStatement.setInt(11, product.getTrangThai());
            preparedStatement.setInt(12, product.getS());
            preparedStatement.setInt(13, product.getL());
            preparedStatement.setInt(14, product.getM());
            preparedStatement.setInt(15, product.getXL());
            preparedStatement.setString(16, product.getMaSP());
            int k = 0;
            if (product.getListUrlImg().size() > 0) {
                String sqlStart = "INSERT INTO `hinhanh`(`IDSP`, `URL`) VALUES(?,?)";
                PreparedStatement preparedStatement2 = connection.prepareStatement(sqlStart);
                for (String url : product.getListUrlImg()) {
                    preparedStatement2.setString(1, product.getMaSP());
                    preparedStatement2.setString(2, url);
                    k += preparedStatement2.executeUpdate();
                }
                preparedStatement2.close();
            }

            int i = preparedStatement.executeUpdate();
            if (i > 0 && k == product.getListUrlImg().size()) {
                connection.commit();
                connection.setAutoCommit(true);
                result = true;
            }
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public int removeImg(String idProduct, String idImg) {
        String sql = "DELETE FROM `hinhanh` WHERE `IDSP`=? AND `URL`=?";
        try {
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idProduct);
            preparedStatement.setString(2, idImg);
            int i = preparedStatement.executeUpdate();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
            return i;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return -1;
    }
    //delete product

    public List<String> deleteProduct(String idProduct) {
        List<String> result =  new ArrayList<>();
        String sql = "DELETE FROM `products` WHERE `MASP`= ?";
        String sqlDeleteImg = "DELETE FROM `hinhanh` WHERE `IDSP`=?";
        String sqlDeleteGioHang = "DELETE FROM `giohang` WHERE `IDSP`=?";
        String selectImg = "SELECT `URL` FROM `hinhanh` WHERE `IDSP`=?";
        try {
            Connection connection = DataSourceConnection.getConnection();
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement4 = connection.prepareStatement(selectImg);
            preparedStatement4.setString(1, idProduct);
            ResultSet resultSet = preparedStatement4.executeQuery();
            while (resultSet.next()) {
                result.add(resultSet.getString("URL"));
            }
            resultSet.close();
            preparedStatement4.close();

            PreparedStatement preparedStatement = connection.prepareStatement(sqlDeleteImg);
            preparedStatement.setString(1, idProduct);
            preparedStatement.executeUpdate();
            PreparedStatement preparedStatement2 = connection.prepareStatement(sqlDeleteGioHang);
            preparedStatement2.setString(1, idProduct);
            preparedStatement2.executeUpdate();
            PreparedStatement preparedStatement3 = connection.prepareStatement(sql);
            preparedStatement3.setString(1, idProduct);
            preparedStatement3.executeUpdate();



            preparedStatement3.close();

            preparedStatement2.close();

            preparedStatement.close();

            connection.commit();

            connection.setAutoCommit(true);
            DataSourceConnection.returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<String> deleteProductCoHoaDonChuaGiao(String idProduct, List<String> listIdHoaDon) {
        List<String> result = new ArrayList<>();
        String sql = "DELETE FROM `products` WHERE `MASP`= ?";
        String sqlDeleteImg = "DELETE FROM `hinhanh` WHERE `IDSP`=?";
        String sqlDeleteGioHang = "DELETE FROM `giohang` WHERE `IDSP`=?";
        String sqlUpdateHoaDon = "UPDATE `hoadon` SET `TrangThai`= 1, `NgayNhanHang` = NOW(), `SoNgayDuKien` = 0 ";
        String sqlUpdatectHoaDon = "UPDATE `cthoadon` SET `MASP`= 'SANPHAMNGUNGKINHDOANH' WHERE `MASP`=?";
        String selectImg = "SELECT `URL` FROM `hinhanh` WHERE `IDSP`=?";

        for (int i = 0; i < listIdHoaDon.size(); i++) {
            if (i == 0) {
                sqlUpdateHoaDon += " WHERE `MAHOADON` = ?";
            } else {
                sqlUpdateHoaDon += " OR `MAHOADON` = ?";
            }
        }
        try {
            Connection connection = DataSourceConnection.getConnection();
            connection.setAutoCommit(false);

            PreparedStatement preparedStatement6 = connection.prepareStatement(selectImg);
            preparedStatement6.setString(1, idProduct);
            ResultSet resultSet = preparedStatement6.executeQuery();
            while (resultSet.next()) {
                result.add(resultSet.getString("URL"));
            }
            resultSet.close();
            preparedStatement6.close();

            PreparedStatement preparedStatement = connection.prepareStatement(sqlDeleteImg);
            preparedStatement.setString(1, idProduct);
            preparedStatement.executeUpdate();

            PreparedStatement preparedStatement2 = connection.prepareStatement(sqlDeleteGioHang);
            preparedStatement2.setString(1, idProduct);
            preparedStatement2.executeUpdate();
            PreparedStatement preparedStatement3 = connection.prepareStatement(sqlUpdatectHoaDon);
            preparedStatement3.setString(1, idProduct);
            preparedStatement3.executeUpdate();
            PreparedStatement preparedStatement4 = connection.prepareStatement(sqlUpdateHoaDon);
            for (int i = 0; i < listIdHoaDon.size(); i++) {
                preparedStatement4.setString(i + 1, listIdHoaDon.get(i));
            }
            preparedStatement4.executeUpdate();
            PreparedStatement preparedStatement5 = connection.prepareStatement(sql);
            preparedStatement5.setString(1, idProduct);
            preparedStatement5.executeUpdate();





            preparedStatement5.close();
            preparedStatement4.close();

            preparedStatement3.close();

            preparedStatement2.close();

            preparedStatement.close();
            connection.commit();

            connection.setAutoCommit(true);
            DataSourceConnection.returnConnection(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

    public int deleteProductCoHoaDonDangGiao(String idProduct, List<String> listIdHoaDon) {
        int result = 0;
        String sqlUpdateProduct = "UPDATE `products` SET `TrangThai`= 2 WHERE `MASP`=?";
        String sqlUpdateHoaDon = "UPDATE `hoadon` SET `TrangThai`= 1";

        for (int i = 0; i < listIdHoaDon.size(); i++) {
            if (i == 0) {
                sqlUpdateHoaDon += " WHERE (`MAHOADON` = ? and `TrangThai`!= 3)";
            } else {
                sqlUpdateHoaDon += " OR (`MAHOADON` = ? and `TrangThai`!= 3)";
            }
        }
        try {
            Connection connection = DataSourceConnection.getConnection();
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(sqlUpdateProduct);
            preparedStatement.setString(1, idProduct);
            preparedStatement.executeUpdate();
            PreparedStatement preparedStatement2 = connection.prepareStatement(sqlUpdateHoaDon);
            for (int i = 0; i < listIdHoaDon.size(); i++) {
                preparedStatement2.setString(i + 1, listIdHoaDon.get(i));
            }
            preparedStatement2.executeUpdate();
            result = 1;
            preparedStatement2.close();


            preparedStatement.close();


            connection.commit();
            connection.setAutoCommit(true);
            DataSourceConnection.returnConnection(connection);
       } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
   }
   // trang thai 0 het hang 1 con hang 2 tam ngung sap xep theo ngay nhap
   public List<Product> getListProductByNameAndID(String pram,int rowCount){
       Map<String, Product> map = new HashMap<>();
       List<Product> products = new ArrayList<>();
       String sql = "SELECT * FROM hinhanh AS h JOIN ( SELECT * FROM products ps " +
               "JOIN loaisp l ON l.IDLOAI = ps.LOAISP "+
               "WHERE TRANGTHAI = 1 AND ( TENSP LIKE ? OR MASP LIKE ? )" +
               "ORDER BY NGAYNHAP DESC LIMIT ? ) AS p ON p.MASP = h.IDSP";
       try {
           Connection connection = DataSourceConnection.getConnection();
           PreparedStatement preparedStatement = connection.prepareStatement(sql);
           preparedStatement.setString(1,"%"+pram+"%");
           preparedStatement.setString(2,"%"+pram+"%");
           preparedStatement.setInt(3,rowCount);
           ResultSet resultSet = preparedStatement.executeQuery();
           while (resultSet.next()){
               String maSP = resultSet.getString("MASP");
               String url = resultSet.getString("URL");
               String nameLoai = resultSet.getString("NAMELOAI");
               Product product = new Product();
               product.setNamLoaiSP(nameLoai);
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
    public List<Product> getListProductByNameAndID(String pram,int offset,int rowCount){
        Map<String, Product> map = new HashMap<>();
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM hinhanh AS h JOIN ( SELECT * FROM products ps " +
                "JOIN loaisp l ON l.IDLOAI = ps.LOAISP "+
                "WHERE TRANGTHAI = 1 AND ( TENSP LIKE ? OR MASP LIKE ? )" +
                "ORDER BY NGAYNHAP DESC LIMIT ?,? ) AS p ON p.MASP = h.IDSP";
        try {
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,"%"+pram+"%");
            preparedStatement.setString(2,"%"+pram+"%");
            preparedStatement.setInt(3,offset);
            preparedStatement.setInt(4,rowCount);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String maSP = resultSet.getString("MASP");
                String url = resultSet.getString("URL");
                String nameLoai = resultSet.getString("NAMELOAI");
                Product product = new Product();
                product.setNamLoaiSP(nameLoai);
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
    public int getCountProductSearch(String pram){
        int result = 0;
        String sql = "SELECT COUNT(*) AS COUNT FROM products " +
                "WHERE TRANGTHAI = 1 AND ( TENSP LIKE ? OR MASP LIKE ? )";
        try {
            Connection connection = DataSourceConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,"%"+pram+"%");
            preparedStatement.setString(2,"%"+pram+"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                result = resultSet.getInt("COUNT");
            }
            resultSet.close();
            preparedStatement.close();
            DataSourceConnection.returnConnection(connection);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return result;
    }

}
