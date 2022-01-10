package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.KhachHangDao;
import com.example.projectwebshopping.model.client.CartJson;
import com.example.projectwebshopping.model.client.KhachHang;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckOutsController", value = "/check-outs")
public class CheckOutsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLognin");
        List<CartJson> cart = (List<CartJson>) session.getAttribute("cartCheckout");
        KhachHang khachHang = null;
        if (user != null) {
            khachHang = KhachHangDao.getInstance().getKhachHangByUserId(user.getId());
        }
        if (cart != null) {
            request.setAttribute("list_cart", cart);
            session.removeAttribute("cartCheckout");
        }
        if (khachHang != null) {
            request.setAttribute("khachHang", khachHang);
        }
        request.setAttribute("container_view","/views/checkOuts.jsp");

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
