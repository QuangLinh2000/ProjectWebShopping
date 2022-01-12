package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.model.client.ProductManager;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "ProductGirdController", value = "/admin-product-gird")
public class ProductGirdController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Product> products = ProductDao.getInstance().getProductsAdmin(null,null,-1,0,12);
        List<LoaiSP> loaiSPs = LoaiSPDao.getInstance().getAllLoaiSP();
        int total = ProductDao.getInstance().getCountProductAdmin(null,null,-1);
        request.setAttribute("products", products);
        request.setAttribute("total", ProductManager.getInstance().getPageCount(12,total));
        request.setAttribute("loaiSPs", loaiSPs);
        request.getRequestDispatcher("views/admin/page-products-grid.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int status = Integer.parseInt(request.getParameter("status"));
        String loai = request.getParameter("loai");
        int page = Integer.parseInt(request.getParameter("page"));
        String date = request.getParameter("date");
        Date ngayNhap = null;
//        System.out.println(" satus : " + status + " loai : " + loai + " page : " + page + " date : " + date);
        if(date != null && date.trim().length() > 0){
            ngayNhap = Date.valueOf(date);
        }
        if(loai.equalsIgnoreCase("Loại")){
            loai = null;
        }
        List<Product> products = ProductDao.getInstance().getProductsAdmin(loai,ngayNhap,status,getStart(page,12),12);
        //convert products to json
        String json = new Gson().toJson(products);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        int total = 0;
        if(page == -1){
            total = ProductDao.getInstance().getCountProductAdmin(loai,ngayNhap,status);
            response.getWriter().write("{\"total\":" + total+ ",\"data\":" + json + "}");
        }else{
            response.getWriter().write("{\"total\":" + -1+ ",\"data\":" + json + "}");

        }


    }
    //start page
    public int getStart(int page, int limit){
        if(page == -1){
            return 0;
        }
        return (page - 1) * limit;
    }
}
