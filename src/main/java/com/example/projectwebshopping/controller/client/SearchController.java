package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.service.client.HomeSerVice;
import com.example.projectwebshopping.service.client.IHomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IHomeService iHomeService = new HomeSerVice();
        String id = request.getParameter("id");
        int loai = Integer.parseInt(request.getParameter("slt"));
        List<Product> productList = iHomeService.getProducts(id, loai);
        request.setAttribute("list_product", productList);
        request.setAttribute("size", getCount(productList.size(),12));
        request.setAttribute("soLuongSP", productList.size());
        request.setAttribute("container_view","/views/search.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public int getCount(int size,int limit) {
        if(size%limit==0){
            return size/limit;
        }else{
            return size/limit+1;
        }
    }
}
