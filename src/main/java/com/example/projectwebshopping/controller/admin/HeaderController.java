package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.ThongBaoDao;
import com.example.projectwebshopping.data.DataString;
import com.example.projectwebshopping.model.admin.ThongBao;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HeaderController", value = "/admin-header")
public class HeaderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String style = request.getParameter("style");
        List<ThongBao> list =ThongBaoDao.getInstance().getThongBao(DataString.ID_USER_ADMIN,Integer.parseInt(style));

        String json = new Gson().toJson(list);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
