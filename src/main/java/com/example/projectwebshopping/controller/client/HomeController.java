package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.service.client.HomeSerVice;
import com.example.projectwebshopping.service.client.IHomeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Home", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IHomeService iHomeService = new HomeSerVice();
        request.setAttribute("listQC",iHomeService.getAllQC());
        request.setAttribute("listBST",iHomeService.getBSHome());
        request.setAttribute("listLoaiSP",iHomeService.getAllLoaiSP());
        request.getRequestDispatcher("/views/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
