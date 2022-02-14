package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.ChiTietHoaDon;
import com.example.projectwebshopping.dao.client.HoaDonDao;
import com.example.projectwebshopping.model.admin.Order;
import com.example.projectwebshopping.model.client.User;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = new ArrayList<>();
        String xemTrangThaiDonHang = request.getParameter("status");
        if (xemTrangThaiDonHang == null) {
            xemTrangThaiDonHang = "all";
        }

        User user = (User) request.getSession().getAttribute("userLognin");
        int sumBill = HoaDonDao.getInstance().getSumBillUser(user.getId(),xemTrangThaiDonHang);
        if (user != null) {
            orders = HoaDonDao.getInstance().getBellUser(4,0,user.getId(),xemTrangThaiDonHang);
        }
        request.setAttribute("orders", orders);
        int page = sumBill%4==0?sumBill/4:sumBill/4+1;
        request.setAttribute("page", page);
        request.setAttribute("xemTrangThaiDonHang", xemTrangThaiDonHang);
        request.setAttribute("container_view","/views/orders.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String idHoaDon = request.getParameter("idHoaDon");
      String page = request.getParameter("page");
      String xemTrangThaiDonHang = request.getParameter("xemTrangThaiDonHang");

        if(idHoaDon!=null){
      List<ChiTietHoaDon> chiTietHoaDonList = HoaDonDao.getInstance().getCTHoaDon(idHoaDon.trim());
      //convert list to json
        String json = new Gson().toJson(chiTietHoaDonList);
      //send ajax
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

      }
      if(page!=null){

          List<Order> orders = new ArrayList<>();

          User user = (User) request.getSession().getAttribute("userLognin");
          if (user != null) {
              orders = HoaDonDao.getInstance().getBellUser(4,4*Integer.parseInt(page)-4,user.getId(),xemTrangThaiDonHang);
          }
          String json = new Gson().toJson(orders);
          response.setContentType("application/json");
          response.setCharacterEncoding("UTF-8");
          response.getWriter().write(json);

      }



    }
}
