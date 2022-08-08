package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.TermDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TermController", value = "/term")
public class TermController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String index=request.getParameter("index");
        String content= TermDao.getInstance().getTerm(index);
        request.setAttribute("content",content);
        request.setAttribute("index",index);
        request.setAttribute("container_view","/views/term.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
