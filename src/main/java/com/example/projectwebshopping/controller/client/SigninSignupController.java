package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.service.client.IUserService;
import com.example.projectwebshopping.service.client.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@WebServlet(name = "SigninSignupController", value = "/signin-signup")
public class SigninSignupController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        request.getRequestDispatcher("views/signinvssignup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        String userName= request.getParameter("userName");
       String password= request.getParameter("password");
       String email= request.getParameter("email");
       IUserService userService = new UserService();
       String vetificationCode = UUID.randomUUID().toString();
      if(userService.isValidUser(userName,password,email,vetificationCode)){
          String text ="xac thuc: "+ request.getRequestURL().toString()+"?code="+vetificationCode;
          userService.sendMail(email,"Xac thuc tai khoan shop ITYSUKI",text);
          PrintWriter out = response.getWriter();
          out.println("<h1>Đăng ký thành công</h1>");
          out.println("<h1>Vui lòng check mail để xác thực</h1>");

      }else{
          request.setAttribute("register", "Register_Err");
          request.getRequestDispatcher("views/signinvssignup.jsp").forward(request, response);

      }

    }

}
