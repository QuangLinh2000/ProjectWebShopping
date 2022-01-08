package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.CartDao;
import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.Cart;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "CartRemoveControler", value = "/CartRemoveController")
public class CartRemoveController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String sizeName = request.getParameter("size");
        User user = (User) request.getSession().getAttribute("userLognin");
        HttpSession session = request.getSession();
        Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
        if (id==null||sizeName==null){
            response.getWriter().write("fail");
            return;
        }
        if (user == null) {
            if (cartMap != null&&cartMap.containsKey(id+sizeName)) {
                cartMap.remove(id+sizeName);
                response.getWriter().write("success");
            }
            session.setAttribute("cartMap", cartMap);
        }else {
            int result = CartDao.getInstance().deleteCart(user.getId(),id,sizeName);
            if (result>0){
                response.getWriter().write("success");
            }else {
                response.getWriter().write("fail");
            }
        }


    }
}
