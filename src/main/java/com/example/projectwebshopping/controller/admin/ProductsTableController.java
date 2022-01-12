package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.LoaiSP;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.model.client.ProductManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductsTableController", value = "/admin-products-table")
public class ProductsTableController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Product> products = ProductDao.getInstance().getProductsAdmin(null,null,-1,0,10);
        List<LoaiSP> loaiSPs = LoaiSPDao.getInstance().getAllLoaiSP();
        int total = ProductDao.getInstance().getCountProductAdmin(null,null,-1);
        request.setAttribute("products", products);
        request.setAttribute("total", ProductManager.getInstance().getPageCount(10,total));
        request.setAttribute("loaiSPs", loaiSPs);
        request.getRequestDispatcher("views/admin/page-products-table.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
