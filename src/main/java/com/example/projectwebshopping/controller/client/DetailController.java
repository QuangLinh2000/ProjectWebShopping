package com.example.projectwebshopping.controller.client;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "detailController", value = "/detail")
public class DetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idSP=request.getParameter("detailProductID");
        Product product= ProductDao.getInstance().getProducts(idSP);
        BoSuaTap bst=ProductDao.getInstance().getCollection(product.getIdBoST());
        request.setAttribute("product",product);
        request.setAttribute("bosuutap",bst);
        request.getRequestDispatcher("/views/detail.jsp").forward(request,response);


    }
}
