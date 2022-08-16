package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.model.client.LogninManager;
import com.example.projectwebshopping.model.client.Product;
import com.example.projectwebshopping.service.client.HomeService;
import com.example.projectwebshopping.service.client.IHomeService;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SearchAjaxController", value = "/searchAjax")
public class SearchAjaxController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IHomeService homeService = new HomeService();
        String param = request.getParameter("txt");
        List<Product> list = homeService.searchProduct(param,10);
        int count = homeService.countSearch(param);
        request.setAttribute("list_product", list);
        LogninManager.getInstance().setURLCookies(request, response);
        request.setAttribute("container_view","/views/search_ajax.jsp");
        request.setAttribute("count",count);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String param = request.getParameter("txtSearch");
        IHomeService homeService = new HomeService();
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        switch (type.toUpperCase()){
            case "SEARCHICON":
                List<Product> list = homeService.searchProduct(param,4);
                int count = homeService.countSearch(param);
                String data = new Gson().toJson(list);
                // send count vs data
                out.print("{\"count\":"+count+",\"data\":"+data+"}");
                break;
            case "SEARCHLOADMORE":
                int offset = Integer.parseInt(request.getParameter("offset"));
                int limit = Integer.parseInt(request.getParameter("limit"));
//                System.out.println(param+""+offset+" "+limit);
                List<Product> listLoad = homeService.searchProduct(param,offset,limit);
                out.print(new Gson().toJson(listLoad));
                break;
            default:
                break;
        }
    }
}
