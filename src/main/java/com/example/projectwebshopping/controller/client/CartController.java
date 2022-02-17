package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.CartDao;
import com.example.projectwebshopping.dto.client.CartProduct;
import com.example.projectwebshopping.model.client.Cart;
import com.example.projectwebshopping.model.client.LogninManager;
import com.example.projectwebshopping.model.client.User;
import com.google.gson.Gson;

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
        List<CartProduct> cartProductList = new ArrayList<>();
        List<Cart> cartList = new ArrayList<>();
        if(user == null){
            //get the Map cart from session
            Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
            if (cartMap != null) {
                cartProductList = CartDao.getInstance().getCartsBySession(cartMap);
            }

        }else{
            //get cart from database
            cartProductList = CartDao.getInstance().getCarts(user.getId());



        }

        LogninManager.getInstance().setURLCookies(request, response);

        request.setAttribute("cartList", cartProductList);
        request.setAttribute("container_view","/views/cart.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //get the cart from ajax
        String id = request.getParameter("id");
        String arrSize = request.getParameter("size");
        String quantityDetail = request.getParameter("quantity");

        // convert json to list
        List<String> listSize = new Gson().fromJson(arrSize, List.class);


        List<String> listQuantity = new ArrayList<>();
        if(quantityDetail == null){
            for ( int i = 0; i < listSize.size(); i++) {
                listQuantity.add("1");
            }
        }else {
            listQuantity = new Gson().fromJson(quantityDetail, List.class);
        }

        //get name from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userLognin");
        if(user == null){
            //get the Map cart from session
            Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
            if (cartMap == null) {
                cartMap = new HashMap<>();
            }

            for (int i =0 ;i< listSize.size();i++){
                String size = listSize.get(i);
                int quantity = Integer.parseInt(listQuantity.get(i));
                if(cartMap.containsKey(id+size)){
                    cartMap.get(id+size).setQuantity(cartMap.get(id+size).getQuantity() + quantity);
                }else{
                    Cart cart = new Cart();
                    cart.setIdProduct(id);
                    cart.setQuantity(quantity);
                    cart.setSize(size);
                    cartMap.put(id+size, cart);
                }
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
            for (int i =0 ;i< listSize.size();i++){
                String size = listSize.get(i);
                int quantity = Integer.parseInt(listQuantity.get(i));
                CartDao.getInstance().addGioHang(user.getId(), id,quantity,size);
            }
            int quantity =  CartDao.getInstance().getSizeCart(user.getId());

            response.getWriter().write("{\"quantity\":\"" + quantity + "\",\"success\":\"true\"}");


        }


    }
}
