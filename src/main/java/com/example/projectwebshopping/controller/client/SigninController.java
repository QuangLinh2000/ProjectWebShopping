package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.service.client.IUserService;
import com.example.projectwebshopping.service.client.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
       if(username != null && password != null &&userService.checkLogin(username, password)){
           HttpSession session = request.getSession();
           session.setAttribute("isusername", username);
           response.sendRedirect("/Shopping/home");

       }else{
           request.setAttribute("login_err","login fall");
           request.setAttribute("container_view","/views/signinvssignup.jsp");

           request.getRequestDispatcher("index.jsp").forward(request, response);
       }
    }
}
