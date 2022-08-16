package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.model.client.LogninManager;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.service.client.HomeService;
import com.example.projectwebshopping.service.client.IHomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IHomeService iHomeService = new HomeService();
        String id = request.getParameter("id");
        String tuTrang = request.getParameter("res");

        List<Product> productList = new ArrayList<>();
        if(tuTrang ==null){
            int loai = Integer.parseInt(request.getParameter("slt"));
            productList=  iHomeService.getProducts(id, loai);
        }else{
            productList=  iHomeService.getAllProductByBSTId(id, 9999999);

        }

        request.setAttribute("list_product", productList);
        request.setAttribute("size", getCount(productList.size(),12));
        request.setAttribute("soLuongSP", productList.size());

        LogninManager.getInstance().setURLCookies(request, response);

        request.setAttribute("container_view","/views/search.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    //get data from form


    }
    public int getCount(int size,int limit) {
        if(size%limit==0){
            return size/limit;
        }else{
            return size/limit+1;
        }
    }
}
