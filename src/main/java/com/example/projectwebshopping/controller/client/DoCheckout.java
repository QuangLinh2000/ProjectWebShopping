package com.example.projectwebshopping.controller.client;

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
            List<CartJson> listCartJson = new Gson().fromJson(data, List.class);
            HttpSession session = request.getSession();
            session.setAttribute("cartCheckout", listCartJson);
            System.out.println(listCartJson);
            response.getWriter().write("success");
        }
    }
}
