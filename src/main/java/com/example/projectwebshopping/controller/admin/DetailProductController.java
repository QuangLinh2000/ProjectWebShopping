package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.dto.client.DetailProduct;
import com.example.projectwebshopping.model.client.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DetailAdminController", value = "/admin-detail-product")
public class DetailProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if(id == null){
            return;
        }
        DetailProduct detailProduct = ProductDao.getInstance().getProduct(id);
        request.setAttribute("detailProduct", detailProduct);
        request.getRequestDispatcher("/views/admin/page-products-detail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
