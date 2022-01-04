package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.dao.client.CartDao;
import com.example.projectwebshopping.model.client.Cart;
import com.example.projectwebshopping.model.client.User;
import com.example.projectwebshopping.service.client.IUserService;
import com.example.projectwebshopping.service.client.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "Signin", value = "/signin")
public class SigninController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String idUser = request.getParameter("id");
        IUserService userService = new UserService();
        if(code != null ){
           userService.isVerification(idUser, code);
        }
        request.setAttribute("login_err","login");
        request.setAttribute("container_view","/views/signinvssignup.jsp");

        request.getRequestDispatcher("index.jsp").forward(request, response);
//        request.getRequestDispatcher("views/signinvssignup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String username = request.getParameter("username");
       String password = request.getParameter("pass");
       IUserService userService = new UserService();
        User user = userService.checkLogin(username, password);
       if(username != null && password != null && user != null){
           HttpSession session = request.getSession();
           session.setAttribute("userLognin", user);

           Map<String, Cart> cartMap = (Map<String, Cart>) session.getAttribute("cartMap");
           if(cartMap != null){
               for (Map.Entry<String, Cart> entry : cartMap.entrySet()) {
                   CartDao.getInstance().addGioHang(user.getId(),entry.getKey(), entry.getValue().getQuantity());
               }
               request.removeAttribute("cartMap");
           }

           response.sendRedirect("/Shopping/home");

       }else{
           request.setAttribute("login_err","login fall");
           request.setAttribute("container_view","/views/signinvssignup.jsp");

           request.getRequestDispatcher("index.jsp").forward(request, response);
       }
    }
}
