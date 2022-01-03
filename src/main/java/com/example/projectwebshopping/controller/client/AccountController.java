package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.service.client.HomeSerVice;
import com.example.projectwebshopping.service.client.IHomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AccountController", value = "/account")
public class AccountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IHomeService iHomeService = new HomeSerVice();
        request.setAttribute("container_view","/views/account.jsp");

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
