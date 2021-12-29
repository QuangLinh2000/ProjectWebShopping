package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.service.client.IUserService;
import com.example.projectwebshopping.service.client.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SigninSignupController", value = "/signin-signup")
public class SigninSignupController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/signinvssignup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String userName= request.getParameter("userName");
       String password= request.getParameter("password");
       String email= request.getParameter("email");
       IUserService userService = new UserService();
      if(userService.isValidUser(userName,password,email)){
          String text = "<a>xac thuc</a>";
          userService.sendMail(email,"Xac thuc tai khoan shop ITYSUKI",text);
      }else{
          request.setAttribute("register", "Register_Err");
          request.getRequestDispatcher("views/signinvssignup.jsp").forward(request, response);

      }

    }

}
