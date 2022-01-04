package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.CartDao;
import com.example.projectwebshopping.model.client.Cart;
import com.example.projectwebshopping.model.client.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get name from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLognin");
        List<Cart> cartList = new ArrayList<>();
        if(user == null){
            //get the Map cart from session
            Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
            if (cartMap != null) {
                //convert map to list
                for (Map.Entry<String, Cart> entry : cartMap.entrySet()) {
                    cartList.add(entry.getValue());
                }

            }

        }else{




        }

        request.setAttribute("cartList", cartList);
        request.setAttribute("container_view","/views/cart.jsp");

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //get the cart from ajax
        String id = request.getParameter("id");

        //get name from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLognin");
        if(user == null){
            //get the Map cart from session
            Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
            if (cartMap == null) {
                cartMap = new HashMap<>();
            }
            if(cartMap.containsKey(id)){
                cartMap.get(id).setQuantity(cartMap.get(id).getQuantity() + 1);
            }else{
                Cart cart = new Cart();
                cart.setIdProduct(id);
                cart.setQuantity(1);
                cartMap.put(id, cart);
            }
            session.setAttribute("cartMap", cartMap);
            //get quantity   from map
            int quantity = 0;
            for (Map.Entry<String, Cart> entry : cartMap.entrySet()) {
                quantity += entry.getValue().getQuantity();
            }
            //send data to ajax json size and suscess
            response.getWriter().write("{\"quantity\":\"" + quantity + "\",\"success\":\"true\"}");


        }else{


            CartDao.getInstance().addGioHang(user.getId(), id,1);
            int quantity =  CartDao.getInstance().getSizeCart(user.getId());

            response.getWriter().write("{\"quantity\":\"" + quantity + "\",\"success\":\"true\"}");


        }


    }
}
