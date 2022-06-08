package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.LoaiSPDao;
import com.example.projectwebshopping.dao.client.TermDao;
import com.example.projectwebshopping.dto.client.LoaiSPAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TermSettingController", value = "/admin-term")
public class TermSettingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String index=request.getParameter("index");
        String content= TermDao.getInstance().getTerm(index);
        request.setAttribute("content",content);
        request.setAttribute("index",index);
        request.getRequestDispatcher("/views/admin/page-term.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String index=request.getParameter("index");
    String content=request.getParameter("content");
    boolean save=TermDao.getInstance().setTerm(index,content);
    if(save) response.getWriter().write("success");
    else response.getWriter().write("false");
    }
}
