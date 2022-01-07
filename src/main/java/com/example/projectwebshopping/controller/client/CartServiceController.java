package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.ProductDao;
import com.example.projectwebshopping.model.client.Cart;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "CartServiceController", value = "/CartServiceController")
public class CartServiceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String size = request.getParameter("size");
        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        User user = (User) request.getSession().getAttribute("userLognin");
        HttpSession session = request.getSession();
        Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
    System.out.println(cartMap.size());

        if (size==null || id==null || quantity==null) {
            //send error ajax json

            response.getWriter().write("{\"status\":\"error\",\"quantity\":\""+0+"\"}");
            return;
        }
        int quantityInt = Integer.parseInt(quantity);
        int sizeDao = 0;
        if (user==null) {
            sizeDao = ProductDao.getInstance().getSizeProduct(id, size);
        }else{
            sizeDao = ProductDao.getInstance().getSizeProduct(id,size,user.getId(),quantityInt);
        }
        if (quantityInt>sizeDao) {
            //send error ajax
            if (user == null) {
                if (cartMap != null) {
                    if (cartMap.containsKey(id+size)) {
                        Cart cart = cartMap.get(id+size);
                        cart.setQuantity(sizeDao);
                        cartMap.put(id+size, cart);
                    }
                }
            }
            response.getWriter().write("{\"status\":\"outsize\",\"quantity\":\""+sizeDao+"\"}");
        }else {
            //send success ajax
            if (user == null) {
                if (cartMap != null) {
                    if (cartMap.containsKey(id+size)) {
                        Cart cart = cartMap.get(id+size);
                        cart.setQuantity(quantityInt);
                        cartMap.put(id+size, cart);
                    }
                }
            }
            response.getWriter().write("{\"status\":\"success\",\"quantity\":\""+quantityInt+"\"}");

        }
        if (cartMap!= null) {
            session.setAttribute("cartMap", cartMap);
        }
    }
}
