package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.ThongBaoDao;
import com.example.projectwebshopping.data.DataString;
import com.example.projectwebshopping.model.admin.ThongBao;
import com.example.projectwebshopping.model.client.User;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HeaderUserController", value = "/header-user")
public class HeaderUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String type = request.getParameter("type");
        User user = (User) request.getSession().getAttribute("userLognin");
        List<ThongBao> list = ThongBaoDao.getInstance().getThongBao(user.getId(),Integer.parseInt(type));

        String json = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
