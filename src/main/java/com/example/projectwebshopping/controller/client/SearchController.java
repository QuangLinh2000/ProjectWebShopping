package com.example.projectwebshopping.controller.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("container_view","/views/search.jsp");

        request.getRequestDispatcher("index.jsp").forward(request, response);
//        request.getRequestDispatcher("views/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
