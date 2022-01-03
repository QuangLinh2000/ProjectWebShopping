package com.example.projectwebshopping.controller.client;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.dto.client.DetailProduct;
import com.example.projectwebshopping.model.client.BoSuaTap;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.service.client.HomeSerVice;
import com.example.projectwebshopping.service.client.IHomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "detailController", value = "/detail")
public class DetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idSP=request.getParameter("id");
        IHomeService homeService = new HomeSerVice();
       DetailProduct detailProduct =  homeService.getProduct(idSP);
        request.setAttribute("related",detailProduct.getRelated());
        request.setAttribute("product",detailProduct.getProduct());
        request.setAttribute("bosuutap",detailProduct.getBoSuaTap());

        request.setAttribute("container_view","/views/detail.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}
