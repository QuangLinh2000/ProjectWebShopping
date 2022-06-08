package com.example.projectwebshopping.controller.admin;

import com.example.projectwebshopping.dao.client.HoaDonDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.admin.Order;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "OrdersController", value = "/admin-orders")
public class OrdersController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("listOder", HoaDonDao.getInstance().getAllBill(5,0,null,null,""));
       request.setAttribute("total", getPageCount(5,HoaDonDao.getInstance().getCountAllBill(null,null,"")));
        request.getRequestDispatcher("/views/admin/page-orders.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String date = request.getParameter("date");
       String status = request.getParameter("status");
       String page = request.getParameter("page");
       String key = request.getParameter("key");

        Date date1 = null;
       if(date != null && date.length() > 0){
           date1 = Date.valueOf(date);
       }
       if (status.equals("-1")){
           status = null;
       }
       List<Order> orderList = HoaDonDao.getInstance().getAllBill(5,getStart(Integer.parseInt(page),5),date1,status,key);
       String json = new Gson().toJson(orderList);
       response.setContentType("application/json");
       response.setCharacterEncoding("UTF-8");
        int total = getPageCount(5,HoaDonDao.getInstance().getCountAllBill(date1,status,key));
        response.getWriter().write("{\"total\":" + total+ ",\"data\":" + json + "}");

    }
    public int getStart(int page, int limit){
        if(page == -1){
            return 0;
        }
        return (page - 1) * limit;
    }
    public int getPageCount(int pageSize,int total) {
        if(total % pageSize == 0) {
            return total / pageSize;
        }
        return total / pageSize + 1;
    }
}
