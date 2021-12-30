package com.example.projectwebshopping.controller.client;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "CheckOutsController", value = "/check-outs")
public class CheckOutsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.getRequestDispatcher("/views/checkOuts.jsp").forward(request, response);
      //local date  miliseconds
      LocalDateTime now = LocalDateTime.now();
      System.out.println(now);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
