package com.example.projectwebshopping.controller.client;

import modal.beans.Product;
import dao.managerProductDetail;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "detailController", value = "/detail")
<<<<<<< HEAD:src/main/java/com/example/projectwebshopping/controller/client/detailController.java
public class detailController extends HttpServlet {
=======
public class DetailController extends HttpServlet {
>>>>>>> a6ef03fb6ef6107a45a0b6d6f85595e7e9c0ea25:src/main/java/com/example/projectwebshopping/controller/client/DetailController.java
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product= managerProductDetail.getInstance().getProduct("Dam-hoa-xanh-D00869");
        ArrayList<Product> listRelatedProduct= (ArrayList<Product>) managerProductDetail.getInstance().getRelatedProduct(product);
        request.setAttribute("relatedProduct",listRelatedProduct);
        request.setAttribute("productDetail",product);
        request.getRequestDispatcher("/views/detail.jsp").forward(request,response);

    }
}
