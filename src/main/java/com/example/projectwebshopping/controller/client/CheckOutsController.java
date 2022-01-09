package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.CartDao;
import com.example.projectwebshopping.dto.client.CartProduct;
import com.example.projectwebshopping.model.client.CartJson;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "CheckOutsController", value = "/check-outs")
public class CheckOutsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLognin");
        List<CartJson> cart = (List<CartJson>) session.getAttribute("cartCheckout");
        List<CartProduct> cartProducts = CartDao.getInstance().getCartsCheckOust(cart,user.getId());
        if (cart != null) {
            request.setAttribute("list_cart", cartProducts);
            session.removeAttribute("cartCheckout");
        }
        request.setAttribute("container_view","/views/checkOuts.jsp");

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
