package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.HoaDonDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrdersController", value = "/admin-orders")
public class OrdersController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listOder", HoaDonDao.getInstance().getAllBill(500,0,null,null));
        request.getRequestDispatcher("/views/admin/page-orders.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
