//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.example.projectwebshopping.controller.client;

import com.example.projectwebshopping.service.client.IUserService;
import com.example.projectwebshopping.service.client.UserService;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        name = "ForgotPasswordControler",
        value = {"/change-pass"}
)
public class ForgotPasswordController extends HttpServlet {
    public ForgotPasswordController() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/forgot_password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String code = request.getParameter("code");
        System.out.println(userName + " " + email + " " + code);
        if (userName != null && email != null && password != null) {
            IUserService userService = new UserService();
            String newCode = UUID.randomUUID().toString();
            if (userService.updatePassword(userName, password, code, newCode) > 0) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("fail");
            }
        } else {
            response.getWriter().write("fail");
        }

    }
}
