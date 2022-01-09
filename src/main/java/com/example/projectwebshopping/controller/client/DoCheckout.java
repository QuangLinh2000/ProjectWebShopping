package com.example.projectwebshopping.controller.client;

import com.episode6.hackit.mockspresso.reflect.TypeToken;
import com.example.projectwebshopping.model.client.CartJson;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DoCheckout", value = "/DoCheckout")
public class DoCheckout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String data = request.getParameter("data");
        if (data!=null) {
            List<CartJson> listCartJson = new Gson().fromJson(data, new TypeToken<List<CartJson>>() {}.getType());
            for (CartJson cartJson : listCartJson) {
                System.out.println(cartJson);
            }
            HttpSession session = request.getSession();
            session.setAttribute("cartCheckout", listCartJson);
            response.getWriter().write("success");
        }
    }
}
