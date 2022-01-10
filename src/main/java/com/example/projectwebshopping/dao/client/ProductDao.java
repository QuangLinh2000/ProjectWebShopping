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
    public int getSizeProduct(String id,String sizeName) {
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
    public int getSizeProduct(String id,String sizeName,String idUser, int quantity) {
        int size = 0;

        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT * FROM products WHERE MASP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
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
    public int getSizeProduct(String id,String sizeName,String idUser, int quantity,String sizeCurrent) {
        int size = 0;
        try {
            Connection connection = DataSourceConnection.getConnection();
            String sql = "SELECT * FROM products WHERE MASP = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            String sqlRemove = "DELETE FROM giohang WHERE IDUser = ? AND IDSP = ? AND SIZE = ?";
            String sqlGioHang= "select * from giohang where IDUser = ? and IDSP = ? and SIZE = ?";
            if (resultSet.next()) {
                // size moi trong cua hang con bao nhieu
                size = resultSet.getInt(sizeName);

                    PreparedStatement preparedStatement2 = connection.prepareStatement(sqlGioHang,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        preparedStatement2.setString(1, idUser);
                        preparedStatement2.setString(2, id);
                        preparedStatement2.setString(3, sizeName);
                        ResultSet resultSet2 = preparedStatement2.executeQuery();
                        if (resultSet2.next()) {
                            int soluong = resultSet2.getInt("SOLUONG");
                            if(size>=(soluong+quantity)){
                                resultSet2.updateInt("SOLUONG", soluong+quantity);
                                resultSet2.updateRow();
                            }



                        }else {
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

    public String checkOut(String idUser, List<CartJson> cartJsonList) {
        List<CartJson> cartJsonList1 = new ArrayList<>();
        cartJsonList1.addAll(cartJsonList);
        try {
            Connection connection = DataSourceConnection.getConnection();
            connection.setAutoCommit(false);
            String where ="";
            for (int i = 0; i < cartJsonList.size(); i++) {
                if(i==0){
                    where = " where MASP = ?";
                }else{
                    where = where+" or MASP = ?";
                }
            }
            String sql = "SELECT * FROM products "+where;
            PreparedStatement preparedStatement = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            for (int i = 0; i < cartJsonList.size(); i++) {
                preparedStatement.setString(i+1, cartJsonList.get(i).getId());
            }

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("MASP");
                String name = resultSet.getString("TENSP");
                for (int i = 0; i < cartJsonList.size(); i++) {

                    if(cartJsonList.get(i).getId().equals(id)) {
                        //số lượng muốn mua
                        int quantity = cartJsonList.get(i).getQuantity();
                        String size = cartJsonList.get(i).getSize();
                        //số lượng của size có trong cửa hàng
                        int soluong = resultSet.getInt(size);

                        if(soluong>=quantity){
                            resultSet.updateInt(size, soluong-quantity);
                            resultSet.updateRow();
                            cartJsonList.remove(i);
                        }else{
                            connection.rollback();
                            connection.setAutoCommit(true);
                            DataSourceConnection.returnConnection(connection);

                            return "Sản phẩm "+name+" không đủ số lượng";
                        }

                    }

                }

            }
            resultSet.close();
            preparedStatement.close();
            if(cartJsonList.size()==0){
                String idHoaDon = UUID.randomUUID().toString();
                if(deleteCart(idUser,cartJsonList1,connection) ==1
                && insertHoaDon(idUser,connection,idHoaDon)==1
                && insertCTHoaDon(idHoaDon,cartJsonList1,connection)==1) {
                    connection.commit();
                }else{
                    connection.rollback();
                    connection.setAutoCommit(true);

                    DataSourceConnection.returnConnection(connection);
                    return "Đặt hàng thất bại";
                }
            }else{
                connection.rollback();
                connection.setAutoCommit(true);

                DataSourceConnection.returnConnection(connection);
                return "Đặt hàng thất bại";
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

   public int deleteCart(String idUser,List<CartJson> cartJsonList ,Connection connection) {
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
    public int insertHoaDon(String idUser,Connection connection,String idHoaDon) {
        try {
            String sql = "INSERT INTO hoadon(MAHOADON,IDUSER,NgayDatHang,TrangThai) VALUES(?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, idHoaDon);
            preparedStatement.setString(2, idUser);
            preparedStatement.setDate(3, new Date(System.currentTimeMillis()));
            preparedStatement.setInt(4, 0);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int insertCTHoaDon(String idHoaDon,List<CartJson> cartJsonList,Connection connection) {
        try {
            String sql = "INSERT INTO cthoadon(MaHD,PRICE,SoLuong,MaSP) VALUES(?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < cartJsonList.size(); i++) {
                preparedStatement.setString(1, idHoaDon);
                preparedStatement.setDouble(2, cartJsonList.get(i).getPrice());
                preparedStatement.setInt(3, cartJsonList.get(i).getQuantity());
                preparedStatement.setString(4, cartJsonList.get(i).getId());
                preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


}
